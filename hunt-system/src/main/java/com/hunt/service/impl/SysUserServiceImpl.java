package com.hunt.service.impl;

import com.github.pagehelper.PageHelper;
import com.hunt.dao.*;
import com.hunt.model.dto.LoginInfo;
import com.hunt.model.dto.PageInfo;
import com.hunt.model.dto.SysUserDto;
import com.hunt.model.entity.*;
import com.hunt.service.SysUserService;
import com.hunt.system.security.shiro.RedisCache;
import org.apache.shiro.session.Session;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import system.SystemConstant;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @Author: ouyangan
 * @Date : 2016/10/7
 */
@Service
@Transactional
public class SysUserServiceImpl implements SysUserService {
    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);
    private static final String sessionIdPrefix = "shiro-session-";
    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysUserRoleOrganizationMapper sysUserRoleOrganizationMapper;
    @Autowired
    private SysUserPermissionMapper sysUserPermissionMapper;
    @Autowired
    private SysPermissionMapper sysPermissionMapper;
    @Autowired
    private SysLoginStatusMapper sysLoginStatusMapper;
    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;
    @Autowired
    private SysRoleOrganizationMapper sysRoleOrganizationMapper;

    @Override
    public long insertUser(SysUser user, String jobIds, String permissionIds) {
        sysUserMapper.insert(user);
        String[] jobIdArray = jobIds.split(",");
        String[] permissionIdArray = permissionIds.split(",");
        for (String jobid : jobIdArray) {
            SysUserRoleOrganization userRoleOrganization = new SysUserRoleOrganization();
            userRoleOrganization.setSysUserId(user.getId());
            userRoleOrganization.setSysRoleOrganizationId(Long.valueOf(jobid));
            userRoleOrganization.setIsFinal(1);
            sysUserRoleOrganizationMapper.insert(userRoleOrganization);
        }
        for (String permissionId : permissionIdArray) {
            SysUserPermission userPermission = new SysUserPermission();
            userPermission.setSysUserId(user.getId());
            userPermission.setSysPermissionId(Long.valueOf(permissionId));
            userPermission.setIsFinal(1);
            sysUserPermissionMapper.insert(userPermission);
        }
        return user.getId();
    }

    @Override
    public boolean isExistLoginName(String loginName) {
        return sysUserMapper.selectByLoginName(loginName);
    }

    @Override
    public SysUser selectById(long id) {
        return sysUserMapper.selectById(id);
    }

    @Override
    public void updateUser(SysUser user, String jobIds, String permissionIds) {
        sysUserMapper.update(user);
        sysUserPermissionMapper.deleteByUserId(user.getId());
        sysUserRoleOrganizationMapper.deleteUserId(user.getId());
        String[] jobIdArray = jobIds.split(",");
        String[] permissionIdArray = permissionIds.split(",");

        for (String jobid : jobIdArray) {
            SysUserRoleOrganization userRoleOrganization = new SysUserRoleOrganization();
            userRoleOrganization.setSysUserId(user.getId());
            userRoleOrganization.setSysRoleOrganizationId(Long.valueOf(jobid));
            userRoleOrganization.setIsFinal(1);
            sysUserRoleOrganizationMapper.insert(userRoleOrganization);
        }
        for (String permissionId : permissionIdArray) {
            SysUserPermission userPermission = new SysUserPermission();
            userPermission.setSysUserId(user.getId());
            userPermission.setSysPermissionId(Long.valueOf(permissionId));
            userPermission.setIsFinal(1);
            sysUserPermissionMapper.insert(userPermission);
        }
    }

    @Override
    public PageInfo selectPage(int page, int rows, String sort, String order) {
        int counts = sysUserMapper.selectCounts();
        PageHelper.startPage(page, rows);
        List<SysUser> sysUsers = sysUserMapper.selectAll(sort, order);
        List<SysUserDto> sysUserDtos = new ArrayList<>();
        for (SysUser user : sysUsers) {
            SysUserDto userDto = new SysUserDto();
            BeanUtils.copyProperties(user, userDto);
            userDto.setPassword("");
            userDto.setPasswordSalt("");
            List<SysUserPermission> userPermissions = sysUserPermissionMapper.selectByUserId(user.getId());
            List<SysPermission> permissions = new ArrayList<>();
            for (SysUserPermission userPermission : userPermissions) {
                SysPermission sysPermission = sysPermissionMapper.selectById(userPermission.getSysPermissionId());
                permissions.add(sysPermission);
            }
            List<SysUserRoleOrganization> userRoleOrganizations = sysUserRoleOrganizationMapper.selectByUserId(user.getId());
            userDto.setPermissions(permissions);
            userDto.setUserRoleOrganizations(userRoleOrganizations);
            sysUserDtos.add(userDto);
        }
        PageInfo pageInfo = new PageInfo(counts, sysUserDtos);
        return pageInfo;
    }

    @Override
    public void updateUser(SysUser user) {
        sysUserMapper.update(user);
    }

    @Override
    public SysUser selectByLoginName(String loginName) {
        return sysUserMapper.selectUserByLoginName(loginName);
    }

    @Override
    public LoginInfo login(SysUser user, Serializable id, int platform) {
        log.debug("sessionId is:{}", id.toString());
        LoginInfo loginInfo = new LoginInfo();
        BeanUtils.copyProperties(user, loginInfo);
        List<SysUserPermission> userPermissions = sysUserPermissionMapper.selectByUserId(user.getId());
        List<SysPermission> permissions = new ArrayList<>();
        for (SysUserPermission userPermission : userPermissions) {
            SysPermission sysPermission = sysPermissionMapper.selectById(userPermission.getSysPermissionId());
            permissions.add(sysPermission);
        }
        List<SysUserRoleOrganization> userRoleOrganizations = sysUserRoleOrganizationMapper.selectByUserId(user.getId());
        loginInfo.setJobs(userRoleOrganizations);

        SysLoginStatus newLoginStatus = new SysLoginStatus();
        newLoginStatus.setSysUserId(user.getId());
        newLoginStatus.setSysUserZhName(user.getZhName());
        newLoginStatus.setSysUserLoginName(user.getLoginName());
        newLoginStatus.setSessionId(id.toString());
        newLoginStatus.setSessionExpires(new DateTime().plusDays(30).toDate());
        newLoginStatus.setPlatform(platform);

        SysLoginStatus oldLoginStatus = sysLoginStatusMapper.selectByUserIdAndPlatform(user.getId(), platform);
        if (oldLoginStatus != null) {
            if (!oldLoginStatus.getSessionId().equals(id.toString())) {
                redisTemplate.opsForValue().getOperations().delete(oldLoginStatus.getSessionId());
            }
            oldLoginStatus.setStatus(2);
            sysLoginStatusMapper.update(oldLoginStatus);
            newLoginStatus.setLastLoginTime(oldLoginStatus.getCreateTime());
        }
        sysLoginStatusMapper.insert(newLoginStatus);
        return loginInfo;
    }

    @Override
    public void forceLogout(long userId) {
        List<SysLoginStatus> list = sysLoginStatusMapper.selectByUserId(userId);
        for (int i = 0; i < list.size(); i++) {
            String sessionId = list.get(i).getSessionId();
            redisTemplate.opsForValue().getOperations().delete(sessionId);
        }
    }

    @Override
    public boolean isExistLoginNameExcludeId(long id, String loginName) {
        return sysUserMapper.isExistLoginNameExcludeId(id, loginName);
    }

    @Override
    public void deleteById(long id) {
        sysUserMapper.deleteById(id);
        sysUserPermissionMapper.deleteByUserId(id);
        sysUserRoleOrganizationMapper.deleteUserId(id);
    }

    @Override
    public void clearAuthorizationInfoCacheByUserId(long userId) {
        SysUser sysUser = sysUserMapper.selectById(userId);
        if (sysUser != null) {
            redisTemplate.opsForValue().getOperations().delete(SystemConstant.shiro_cache_prefix + sysUser.getLoginName());
        }
    }

    @Override
    public void clearAuthorizationInfoALL() {
        Set<Object> keys = redisTemplate.keys(SystemConstant.shiro_cache_prefix_keys);
        if (keys.size() > 0) {
            redisTemplate.opsForValue().getOperations().delete(keys);
        }
    }

    @Override
    public void clearAuthorizationInfoByRoleId(long roleId) {
        List<Long> list = sysRoleOrganizationMapper.selectByRoleId(roleId);
        if (list.size() > 0) {
            for (long id : list) {
                List<Long> userIds = sysUserRoleOrganizationMapper.selectByRoleOrganizationId(id);
                if (userIds.size() > 0) {
                    for (Long userId : userIds) {
                        SysUser sysUser = sysUserMapper.selectById(userId);
                        if (sysUser != null) {
                            redisTemplate.opsForValue().getOperations().delete(SystemConstant.shiro_cache_prefix + sysUser.getLoginName());
                        }
                    }
                }
            }
        }
    }
}
