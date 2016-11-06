/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : hunt

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-10-31 23:54:14
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for `sys_data_group`
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_group`;
CREATE TABLE `sys_data_group` (
  `id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(256)        DEFAULT NULL
  COMMENT '描述',
  `parent_id`   BIGINT(20)          DEFAULT NULL
  COMMENT '父级id',
  `name`        VARCHAR(256)        DEFAULT NULL
  COMMENT '名称',
  `is_final`    INT(11)             DEFAULT '1'
  COMMENT '是否可删除',
  `rank`        BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time` DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time` DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '创建人',
  `update_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '更热人',
  `status`      TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_data_group
-- ----------------------------
INSERT INTO `sys_data_group`
VALUES ('1', '极限验证', '0', '极限验证', '2', '0', '2016-10-31 22:08:28', '2016-10-31 22:08:28', '0', '0', '1');
INSERT INTO `sys_data_group`
VALUES ('2', '日志输出控制', '0', '日志', '2', '0', '2016-10-31 22:09:38', '2016-10-31 22:09:38', '0', '0', '1');

-- ----------------------------
-- Table structure for `sys_data_item`
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_item`;
CREATE TABLE `sys_data_item` (
  `id`                BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sys_data_group_id` BIGINT(20)          DEFAULT NULL
  COMMENT '组id',
  `key_value`         VARCHAR(256)        DEFAULT NULL
  COMMENT '值',
  `key_name`          VARCHAR(256)        DEFAULT NULL
  COMMENT '名称',
  `is_final`          INT(11)             DEFAULT '1'
  COMMENT '是否可删除',
  `rank`              BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`       DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`       DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`         BIGINT(20)          DEFAULT '0'
  COMMENT '创建人',
  `update_by`         BIGINT(20)          DEFAULT '0'
  COMMENT '更热人',
  `status`            TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除,3:禁用账号',
  `description`       VARCHAR(256)        DEFAULT NULL
  COMMENT '描述',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_data_item
-- ----------------------------
INSERT INTO `sys_data_item` VALUES
  ('1', '1', '796c2461adf8051c835e4a758a6091f6', 'geetest_id', '2', '0', '2016-10-31 22:08:48', '2016-10-31 23:51:11',
        '0', '0', '1', 'geetest_id');
INSERT INTO `sys_data_item` VALUES
  ('2', '1', '0edad631bed761ab039d8391dd3103ff', 'geetest_key', '2', '0', '2016-10-31 22:09:19', '2016-10-31 23:51:12',
        '0', '0', '1', 'geetest_key');
INSERT INTO `sys_data_item` VALUES
  ('3', '2', 'true', 'error_detail', '2', '0', '2016-10-31 22:10:21', '2016-10-31 23:51:13', '0', '0', '1',
   '是否输出错误日志详情');

-- ----------------------------
-- Table structure for `sys_ip_forbidden`
-- ----------------------------
DROP TABLE IF EXISTS `sys_ip_forbidden`;
CREATE TABLE `sys_ip_forbidden` (
  `id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
  `is_final`    INT(11)             DEFAULT '1'
  COMMENT '是否可删除',
  `rank`        BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time` DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time` DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '创建人',
  `update_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '更热人',
  `status`      TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  `expire_time` DATETIME            DEFAULT NULL
  COMMENT '到期时间',
  `description` VARCHAR(256)        DEFAULT NULL
  COMMENT '说明',
  `ip`          VARCHAR(256)        DEFAULT NULL
  COMMENT 'IP地址',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_ip_forbidden
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id`          BIGINT(20) NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  `rank`        BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time` DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time` DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '创建人',
  `update_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '更热人',
  `status`      TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  `ip`          VARCHAR(256)        DEFAULT NULL
  COMMENT '请求ip',
  `user_id`     VARCHAR(256)        DEFAULT NULL
  COMMENT '操作用户id',
  `method`      VARCHAR(2048)       DEFAULT NULL
  COMMENT '请求方法',
  `param`       TEXT COMMENT '请求参数',
  `result`      TEXT COMMENT '请求结果',
  `duration`    BIGINT(20)          DEFAULT NULL
  COMMENT '持续时间',
  `url`         VARCHAR(512)        DEFAULT NULL
  COMMENT '请求url',
  `user_agent`  VARCHAR(512)        DEFAULT NULL
  COMMENT '请求ua',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1093
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '0', '2016-10-29 19:15:23', '2016-10-29 19:15:23', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.SystemController.StartCaptcha', 't = 1477739721702 | ',
                              '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"5d5e1ad522ca10684c0684ac93170dff\"}',
                              '1827', 'http://localhost:8080/system/captcha',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('2', '0', '2016-10-29 19:15:25', '2016-10-29 19:15:25', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('3', '0', '2016-10-29 19:15:28', '2016-10-29 19:15:28', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.UserController.user', '_ = 1477739726577 | ', 'system/user',
                              '28', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('4', '0', '2016-10-29 19:15:29', '2016-10-29 19:15:29', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '219', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('5', '0', '2016-10-29 19:15:29', '2016-10-29 19:15:29', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '271',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('6', '0', '2016-10-29 19:15:46', '2016-10-29 19:15:46', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('7', '0', '2016-10-29 19:15:51', '2016-10-29 19:15:51', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.UserController.user', '_ = 1477739748408 | ', 'system/user',
                              '13', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('8', '0', '2016-10-29 19:15:53', '2016-10-29 19:15:53', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '311',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('9', '0', '2016-10-29 19:15:53', '2016-10-29 19:15:53', '0', '0', '1', '127.0.0.1', NULL,
                                   'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '718', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('10', '0', '2016-10-29 19:15:54', '2016-10-29 19:15:54', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.select',
                                    'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
                              'data is too long', '1958', 'http://localhost:8080/user/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('11', '0', '2016-10-29 19:15:56', '2016-10-29 19:15:56', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.job', '_ = 1477739748411 | ', 'system/job', '4',
                              'http://localhost:8080/job/job',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('12', '0', '2016-10-29 19:15:58', '2016-10-29 19:15:58', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '469', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('13', '0', '2016-10-29 19:15:58', '2016-10-29 19:15:58', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.select', NULL,
                              'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
                              '427', 'http://localhost:8080/organization/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('14', '0', '2016-10-29 19:15:58', '2016-10-29 19:15:58', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '267', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('15', '0', '2016-10-29 19:15:58', '2016-10-29 19:15:58', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.select', NULL,
                              'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
                              '860', 'http://localhost:8080/role/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('16', '0', '2016-10-29 19:15:59', '2016-10-29 19:15:59', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.organization', '_ = 1477739748414 | ',
                              'system/organization', '3', 'http://localhost:8080/organization/organization',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('17', '0', '2016-10-29 19:15:59', '2016-10-29 19:15:59', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.select', NULL,
                              'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
                              '196', 'http://localhost:8080/organization/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('18', '0', '2016-10-29 19:16:00', '2016-10-29 19:16:00', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.select', NULL,
                              'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
                              '86', 'http://localhost:8080/organization/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('19', '0', '2016-10-29 19:16:00', '2016-10-29 19:16:00', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.role', '_ = 1477739748417 | ', 'system/role',
                              '3', 'http://localhost:8080/role/role',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('20', '0', '2016-10-29 19:16:01', '2016-10-29 19:16:01', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '126',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('21', '0', '2016-10-29 19:16:01', '2016-10-29 19:16:01', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.select', NULL,
                              'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
                              '479', 'http://localhost:8080/role/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('22', '0', '2016-10-29 19:16:02', '2016-10-29 19:16:02', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.permission', '_ = 1477739748420 | ',
                              'system/permission', '3', 'http://localhost:8080/permission/permission',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('23', '0', '2016-10-29 19:16:02', '2016-10-29 19:16:02', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '125',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('24', '0', '2016-10-29 19:16:02', '2016-10-29 19:16:02', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.selectGroup', NULL,
                              '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
                              '22', 'http://localhost:8080/permission/group/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('25', '0', '2016-10-29 19:16:23', '2016-10-29 19:16:23', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('26', '0', '2016-10-29 19:16:24', '2016-10-29 19:16:24', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.role', '_ = 1477739783374 | ', 'system/role',
                              '2', 'http://localhost:8080/role/role',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('27', '0', '2016-10-29 19:16:24', '2016-10-29 19:16:24', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '126',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('28', '0', '2016-10-29 19:16:24', '2016-10-29 19:16:24', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.select', NULL,
                              'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
                              '309', 'http://localhost:8080/role/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('29', '0', '2016-10-29 19:18:07', '2016-10-29 19:18:07', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '3',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('30', '0', '2016-10-29 19:18:08', '2016-10-29 19:18:08', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.role', '_ = 1477739887606 | ', 'system/role',
                              '2', 'http://localhost:8080/role/role',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('31', '0', '2016-10-29 19:18:09', '2016-10-29 19:18:09', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '181',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('32', '0', '2016-10-29 19:18:09', '2016-10-29 19:18:09', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.select', NULL,
                              'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
                              '533', 'http://localhost:8080/role/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('33', '0', '2016-10-29 19:19:10', '2016-10-29 19:19:10', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('34', '0', '2016-10-29 19:19:39', '2016-10-29 19:19:39', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('35', '0', '2016-10-29 19:19:42', '2016-10-29 19:19:42', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('36', '0', '2016-10-29 19:19:42', '2016-10-29 19:19:42', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.permission', '_ = 1477739982381 | ',
                              'system/permission', '4', 'http://localhost:8080/permission/permission',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('37', '0', '2016-10-29 19:19:43', '2016-10-29 19:19:43', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '47',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('38', '0', '2016-10-29 19:19:43', '2016-10-29 19:19:43', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.selectGroup', NULL,
                              '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
                              '10', 'http://localhost:8080/permission/group/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('39', '0', '2016-10-29 19:19:46', '2016-10-29 19:19:46', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '3',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('40', '0', '2016-10-29 19:19:47', '2016-10-29 19:19:47', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.log', '_ = 1477739987038 | ', 'system/log',
                              '3', 'http://localhost:8080/system/log',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('41', '0', '2016-10-29 19:19:48', '2016-10-29 19:19:48', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.logList',
                                    'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
                              'PageInfo{total=40, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=40, pages=2, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
                              '196', 'http://localhost:8080/system/log/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('42', '0', '2016-10-29 19:19:52', '2016-10-29 19:19:52', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.ip', '_ = 1477739987041 | ', 'system/ip', '7',
                              'http://localhost:8080/system/ip',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('43', '0', '2016-10-29 19:19:52', '2016-10-29 19:19:52', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
                              'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
                              '64', 'http://localhost:8080/system/ip/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('44', '0', '2016-10-29 19:20:05', '2016-10-29 19:20:05', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '3',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('45', '0', '2016-10-29 19:20:06', '2016-10-29 19:20:06', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.job', '_ = 1477740005487 | ', 'system/job', '6',
                              'http://localhost:8080/job/job',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('46', '0', '2016-10-29 19:20:06', '2016-10-29 19:20:06', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '92', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('47', '0', '2016-10-29 19:20:07', '2016-10-29 19:20:07', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.select', NULL,
                              'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
                              '211', 'http://localhost:8080/organization/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('48', '0', '2016-10-29 19:20:07', '2016-10-29 19:20:07', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '350', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('49', '0', '2016-10-29 19:20:07', '2016-10-29 19:20:07', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.select', NULL,
                              'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
                              '592', 'http://localhost:8080/role/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('50', '0', '2016-10-29 19:20:08', '2016-10-29 19:20:08', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.organization', '_ = 1477740005490 | ',
                              'system/organization', '4', 'http://localhost:8080/organization/organization',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('51', '0', '2016-10-29 19:20:08', '2016-10-29 19:20:08', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.select', NULL,
                              'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
                              '50', 'http://localhost:8080/organization/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('52', '0', '2016-10-29 19:20:08', '2016-10-29 19:20:08', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.OrganizationController.select', NULL,
                              'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
                              '39', 'http://localhost:8080/organization/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('53', '0', '2016-10-29 19:20:10', '2016-10-29 19:20:10', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.role', '_ = 1477740005493 | ', 'system/role',
                              '3', 'http://localhost:8080/role/role',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('54', '0', '2016-10-29 19:20:10', '2016-10-29 19:20:10', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '71',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('55', '0', '2016-10-29 19:20:10', '2016-10-29 19:20:10', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.RoleController.select', NULL,
                              'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
                              '222', 'http://localhost:8080/role/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('56', '0', '2016-10-29 19:20:10', '2016-10-29 19:20:10', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.permission', '_ = 1477740005496 | ',
                              'system/permission', '2', 'http://localhost:8080/permission/permission',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('57', '0', '2016-10-29 19:20:10', '2016-10-29 19:20:10', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '47',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('58', '0', '2016-10-29 19:20:11', '2016-10-29 19:20:11', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.selectGroup', NULL,
                              '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
                              '13', 'http://localhost:8080/permission/group/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('59', '0', '2016-10-29 19:20:11', '2016-10-29 19:20:11', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.data', '_ = 1477740005499 | ', 'system/data',
                              '5', 'http://localhost:8080/system/data',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('60', '0', '2016-10-29 19:20:12', '2016-10-29 19:20:12', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
                              'PageInfo{total=0, rows=[]}', '46', 'http://localhost:8080/system/data/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('61', '0', '2016-10-29 19:20:12', '2016-10-29 19:20:12', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '11',
                              'http://localhost:8080/system/dataGroup/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('62', '0', '2016-10-29 19:20:12', '2016-10-29 19:20:12', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.online', '_ = 1477740005502 | ',
                              'system/online', '15', 'http://localhost:8080/system/online',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('63', '0', '2016-10-29 19:20:13', '2016-10-29 19:20:13', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
                              'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
                              '42', 'http://localhost:8080/system/online/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('64', '0', '2016-10-29 19:20:13', '2016-10-29 19:20:13', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.log', '_ = 1477740005505 | ', 'system/log',
                              '3', 'http://localhost:8080/system/log',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('65', '0', '2016-10-29 19:20:13', '2016-10-29 19:20:13', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.logList',
                                    'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
                              'PageInfo{total=64, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=64, pages=3, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
                              '21', 'http://localhost:8080/system/log/list',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('66', '0', '2016-10-29 19:31:14', '2016-10-29 19:31:14', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('67', '0', '2016-10-29 19:31:32', '2016-10-29 19:31:32', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.user', '_ = 1477740675644 | ', 'system/user',
                              '12', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('68', '0', '2016-10-29 19:31:33', '2016-10-29 19:31:33', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.select',
                                    'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
                              'data is too long', '751', 'http://localhost:8080/user/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('69', '0', '2016-10-29 19:31:33', '2016-10-29 19:31:33', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '724',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('70', '0', '2016-10-29 19:31:34', '2016-10-29 19:31:34', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '808', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('71', '0', '2016-10-29 19:32:26', '2016-10-29 19:32:26', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('72', '0', '2016-10-29 19:32:49', '2016-10-29 19:32:49', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '10',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('73', '0', '2016-10-29 19:33:34', '2016-10-29 19:33:34', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.user', '_ = 1477740770513 | ', 'system/user',
                              '4', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('74', '0', '2016-10-29 19:33:35', '2016-10-29 19:33:35', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.select',
                                    'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
                              'data is too long', '350', 'http://localhost:8080/user/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('75', '0', '2016-10-29 19:33:35', '2016-10-29 19:33:35', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '191',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('76', '0', '2016-10-29 19:33:35', '2016-10-29 19:33:35', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '179', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('77', '0', '2016-10-29 19:34:32', '2016-10-29 19:34:32', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.user', '_ = 1477740770516 | ', 'system/user',
                              '4', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('78', '0', '2016-10-29 19:34:33', '2016-10-29 19:34:33', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.select',
                                    'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
                              'data is too long', '427', 'http://localhost:8080/user/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('79', '0', '2016-10-29 19:34:33', '2016-10-29 19:34:33', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '183',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('80', '0', '2016-10-29 19:34:33', '2016-10-29 19:34:33', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '152', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('81', '0', '2016-10-29 19:34:46', '2016-10-29 19:34:46', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('82', '0', '2016-10-29 19:35:10', '2016-10-29 19:35:10', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.user', '_ = 1477740887119 | ', 'system/user',
                              '3', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('83', '0', '2016-10-29 19:35:11', '2016-10-29 19:35:11', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.select',
                                    'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
                              'data is too long', '343', 'http://localhost:8080/user/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('84', '0', '2016-10-29 19:35:11', '2016-10-29 19:35:11', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '80',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('85', '0', '2016-10-29 19:35:11', '2016-10-29 19:35:11', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '110', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('86', '0', '2016-10-29 19:37:17', '2016-10-29 19:37:17', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '6',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('87', '0', '2016-10-29 19:37:21', '2016-10-29 19:37:21', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.user', '_ = 1477741037974 | ', 'system/user',
                              '5', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('88', '0', '2016-10-29 19:37:21', '2016-10-29 19:37:21', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.select',
                                    'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
                              'data is too long', '254', 'http://localhost:8080/user/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('89', '0', '2016-10-29 19:37:21', '2016-10-29 19:37:21', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '174',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('90', '0', '2016-10-29 19:37:22', '2016-10-29 19:37:22', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '163', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('91', '0', '2016-10-29 20:04:45', '2016-10-29 20:04:45', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '124',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('92', '0', '2016-10-29 20:04:55', '2016-10-29 20:04:55', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '5',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('93', '0', '2016-10-29 20:04:56', '2016-10-29 20:04:56', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.user', '_ = 1477742695385 | ', 'system/user',
                              '21', 'http://localhost:8080/user/user',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('94', '0', '2016-10-29 20:04:57', '2016-10-29 20:04:57', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.UserController.select',
                                    'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
                              'data is too long', '568', 'http://localhost:8080/user/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('95', '0', '2016-10-29 20:04:58', '2016-10-29 20:04:58', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '137',
                              'http://localhost:8080/permission/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('96', '0', '2016-10-29 20:04:58', '2016-10-29 20:04:58', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.JobController.select', NULL,
                              'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
                              '573', 'http://localhost:8080/job/select',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('97', '0', '2016-10-29 20:05:01', '2016-10-29 20:05:01', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '3',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('98', '0', '2016-10-29 20:05:03', '2016-10-29 20:05:03', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES ('99', '0', '2016-10-29 20:05:17', '2016-10-29 20:05:17', '0', '0', '1', '127.0.0.1', NULL,
                                    'com.hunt.controller.SystemController.index', NULL, 'system/index', '4',
                              'http://localhost:8080/system/index',
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('100', '0', '2016-10-29 20:11:00', '2016-10-29 20:11:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477743058115 | ', 'system/job', '4',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('101', '0', '2016-10-29 20:11:01', '2016-10-29 20:11:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '76', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('102', '0', '2016-10-29 20:11:01', '2016-10-29 20:11:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '221', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('103', '0', '2016-10-29 20:11:01', '2016-10-29 20:11:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '306', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('104', '0', '2016-10-29 20:11:01', '2016-10-29 20:11:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '110', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('105', '0', '2016-10-29 20:11:01', '2016-10-29 20:11:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477743058118 | ', 'system/organization', '4',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('106', '0', '2016-10-29 20:11:02', '2016-10-29 20:11:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '56', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('107', '0', '2016-10-29 20:11:02', '2016-10-29 20:11:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '50', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('108', '0', '2016-10-29 20:11:02', '2016-10-29 20:11:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477743058121 | ', 'system/role', '4',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('109', '0', '2016-10-29 20:11:03', '2016-10-29 20:11:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '169', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('110', '0', '2016-10-29 20:11:03', '2016-10-29 20:11:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '94',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('111', '0', '2016-10-29 20:11:09', '2016-10-29 20:11:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('112', '0', '2016-10-29 20:11:20', '2016-10-29 20:11:20', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477743069704 | ', 'system/job', '4',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('113', '0', '2016-10-29 20:11:20', '2016-10-29 20:11:20', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '62', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('114', '0', '2016-10-29 20:11:21', '2016-10-29 20:11:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '144', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('115', '0', '2016-10-29 20:11:21', '2016-10-29 20:11:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '225', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('116', '0', '2016-10-29 20:11:21', '2016-10-29 20:11:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '134', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('117', '0', '2016-10-29 20:13:12', '2016-10-29 20:13:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('118', '0', '2016-10-29 20:13:17', '2016-10-29 20:13:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '6', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('119', '0', '2016-10-29 20:13:19', '2016-10-29 20:13:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('120', '0', '2016-10-29 20:14:07', '2016-10-29 20:14:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('121', '0', '2016-10-29 20:14:12', '2016-10-29 20:14:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477743250854 | ', 'system/job', '3',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('122', '0', '2016-10-29 20:14:12', '2016-10-29 20:14:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '61', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('123', '0', '2016-10-29 20:14:12', '2016-10-29 20:14:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '122', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('124', '0', '2016-10-29 20:14:12', '2016-10-29 20:14:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '97', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('125', '0', '2016-10-29 20:14:12', '2016-10-29 20:14:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '207', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('126', '0', '2016-10-29 20:14:14', '2016-10-29 20:14:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('127', '0', '2016-10-29 20:14:15', '2016-10-29 20:14:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '6', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('128', '0', '2016-10-29 20:14:27', '2016-10-29 20:14:27', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('129', '0', '2016-10-29 20:14:29', '2016-10-29 20:14:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('130', '0', '2016-10-29 20:14:33', '2016-10-29 20:14:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477743269218 | ', 'system/job', '3',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('131', '0', '2016-10-29 20:14:33', '2016-10-29 20:14:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '56', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('132', '0', '2016-10-29 20:14:33', '2016-10-29 20:14:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '147', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('133', '0', '2016-10-29 20:14:33', '2016-10-29 20:14:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '144', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('134', '0', '2016-10-29 20:14:33', '2016-10-29 20:14:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '107', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('135', '0', '2016-10-29 20:14:35', '2016-10-29 20:14:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('136', '0', '2016-10-29 20:14:40', '2016-10-29 20:14:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477743275466 | ', 'system/job', '3',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('137', '0', '2016-10-29 20:14:40', '2016-10-29 20:14:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '53', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('138', '0', '2016-10-29 20:14:40', '2016-10-29 20:14:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '194', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('139', '0', '2016-10-29 20:14:40', '2016-10-29 20:14:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '231', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('140', '0', '2016-10-29 20:14:40', '2016-10-29 20:14:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '144', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('141', '0', '2016-10-29 20:14:43', '2016-10-29 20:14:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('142', '0', '2016-10-29 20:14:57', '2016-10-29 20:14:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('143', '0', '2016-10-29 20:15:00', '2016-10-29 20:15:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('144', '0', '2016-10-29 20:15:19', '2016-10-29 20:15:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('145', '0', '2016-10-29 20:15:27', '2016-10-29 20:15:27', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('146', '0', '2016-10-29 20:16:01', '2016-10-29 20:16:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('147', '0', '2016-10-29 20:16:02', '2016-10-29 20:16:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('148', '0', '2016-10-29 20:16:04', '2016-10-29 20:16:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477743362672 | ', 'system/job', '4',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('149', '0', '2016-10-29 20:16:04', '2016-10-29 20:16:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '53', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('150', '0', '2016-10-29 20:16:04', '2016-10-29 20:16:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '160', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('151', '0', '2016-10-29 20:16:04', '2016-10-29 20:16:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '97', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('152', '0', '2016-10-29 20:16:04', '2016-10-29 20:16:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '256', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('153', '0', '2016-10-29 20:26:26', '2016-10-29 20:26:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('154', '0', '2016-10-29 20:26:30', '2016-10-29 20:26:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('155', '0', '2016-10-29 20:26:35', '2016-10-29 20:26:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('156', '0', '2016-10-29 20:27:12', '2016-10-29 20:27:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('157', '0', '2016-10-29 20:27:16', '2016-10-29 20:27:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('158', '0', '2016-10-29 20:27:28', '2016-10-29 20:27:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('159', '0', '2016-10-29 20:28:23', '2016-10-29 20:28:23', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('160', '0', '2016-10-29 20:28:26', '2016-10-29 20:28:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('161', '0', '2016-10-29 20:29:28', '2016-10-29 20:29:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('162', '0', '2016-10-29 20:43:08', '2016-10-29 20:43:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '6', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('163', '0', '2016-10-29 20:43:12', '2016-10-29 20:43:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('164', '0', '2016-10-29 20:44:20', '2016-10-29 20:44:20', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('165', '0', '2016-10-29 20:44:22', '2016-10-29 20:44:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('166', '0', '2016-10-29 20:44:28', '2016-10-29 20:44:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('167', '0', '2016-10-29 20:44:33', '2016-10-29 20:44:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('168', '0', '2016-10-29 20:44:36', '2016-10-29 20:44:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('169', '0', '2016-10-29 20:45:24', '2016-10-29 20:45:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('170', '0', '2016-10-29 20:48:40', '2016-10-29 20:48:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('171', '0', '2016-10-29 20:48:44', '2016-10-29 20:48:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('172', '0', '2016-10-29 20:49:34', '2016-10-29 20:49:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('173', '0', '2016-10-29 20:49:35', '2016-10-29 20:49:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('174', '0', '2016-10-29 20:49:35', '2016-10-29 20:49:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '33',
   'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('175', '0', '2016-10-29 20:49:35', '2016-10-29 20:49:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('176', '0', '2016-10-29 20:51:51', '2016-10-29 20:51:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '236',
   'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('177', '0', '2016-10-29 20:52:27', '2016-10-29 20:52:27', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('178', '0', '2016-10-29 20:52:39', '2016-10-29 20:52:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('179', '0', '2016-10-29 20:52:50', '2016-10-29 20:52:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('180', '0', '2016-10-29 20:52:55', '2016-10-29 20:52:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477745572153 | ', 'system/user', '129',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('181', '0', '2016-10-29 20:52:56', '2016-10-29 20:52:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '462', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('182', '0', '2016-10-29 20:52:57', '2016-10-29 20:52:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '332',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('183', '0', '2016-10-29 20:52:57', '2016-10-29 20:52:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '668', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('184', '0', '2016-10-29 20:52:59', '2016-10-29 20:52:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477745572156 | ', 'system/job', '4',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('185', '0', '2016-10-29 20:53:00', '2016-10-29 20:53:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '87', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('186', '0', '2016-10-29 20:53:00', '2016-10-29 20:53:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '438', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('187', '0', '2016-10-29 20:53:00', '2016-10-29 20:53:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '428', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('188', '0', '2016-10-29 20:53:00', '2016-10-29 20:53:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '685', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('189', '0', '2016-10-29 20:53:01', '2016-10-29 20:53:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477745572159 | ', 'system/organization', '4',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('190', '0', '2016-10-29 20:53:01', '2016-10-29 20:53:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '100', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('191', '0', '2016-10-29 20:53:01', '2016-10-29 20:53:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '239', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('192', '0', '2016-10-29 20:53:22', '2016-10-29 20:53:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('193', '0', '2016-10-29 20:53:25', '2016-10-29 20:53:25', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '6', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('194', '0', '2016-10-29 20:53:29', '2016-10-29 20:53:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('195', '0', '2016-10-29 20:53:32', '2016-10-29 20:53:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477745609629 | ', 'system/user', '5',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('196', '0', '2016-10-29 20:53:32', '2016-10-29 20:53:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '266', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('197', '0', '2016-10-29 20:53:33', '2016-10-29 20:53:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '78',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('198', '0', '2016-10-29 20:53:34', '2016-10-29 20:53:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '630', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('199', '0', '2016-10-29 20:53:54', '2016-10-29 20:53:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477745633259 | ', 'system/user', '1',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('200', '0', '2016-10-29 20:53:55', '2016-10-29 20:53:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '244', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('201', '0', '2016-10-29 20:53:55', '2016-10-29 20:53:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '31',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('202', '0', '2016-10-29 20:53:55', '2016-10-29 20:53:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '123', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('203', '0', '2016-10-29 20:54:00', '2016-10-29 20:54:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477745633262 | ', 'system/job', '1',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('204', '0', '2016-10-29 20:54:00', '2016-10-29 20:54:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '97', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('205', '0', '2016-10-29 20:54:00', '2016-10-29 20:54:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '240', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('206', '0', '2016-10-29 20:54:00', '2016-10-29 20:54:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '173', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('207', '0', '2016-10-29 20:54:00', '2016-10-29 20:54:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '40', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('208', '0', '2016-10-29 20:54:01', '2016-10-29 20:54:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477745633265 | ', 'system/organization', '1',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('209', '0', '2016-10-29 20:54:01', '2016-10-29 20:54:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '40', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('210', '0', '2016-10-29 20:54:01', '2016-10-29 20:54:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '45', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('211', '0', '2016-10-29 20:54:01', '2016-10-29 20:54:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477745633268 | ', 'system/role', '2',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('212', '0', '2016-10-29 20:54:02', '2016-10-29 20:54:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '176', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('213', '0', '2016-10-29 20:54:02', '2016-10-29 20:54:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('214', '0', '2016-10-29 20:54:03', '2016-10-29 20:54:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477745633271 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('215', '0', '2016-10-29 20:54:04', '2016-10-29 20:54:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}',
   '29', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('216', '0', '2016-10-29 20:54:04', '2016-10-29 20:54:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '9',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('217', '0', '2016-10-29 20:54:06', '2016-10-29 20:54:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477745633274 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('218', '0', '2016-10-29 20:54:06', '2016-10-29 20:54:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '12', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('219', '0', '2016-10-29 20:54:07', '2016-10-29 20:54:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477745633277 | ', 'system/log', '0',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('220', '0', '2016-10-29 20:54:07', '2016-10-29 20:54:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=219, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=219, pages=8, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '30', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('221', '0', '2016-10-29 20:54:09', '2016-10-29 20:54:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477745633280 | ', 'system/ip', '2',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('222', '0', '2016-10-29 20:54:10', '2016-10-29 20:54:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '13', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('223', '0', '2016-10-29 20:55:02', '2016-10-29 20:55:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477745633283 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('224', '0', '2016-10-29 20:55:03', '2016-10-29 20:55:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('225', '0', '2016-10-29 20:55:03', '2016-10-29 20:55:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('226', '0', '2016-10-29 20:55:48', '2016-10-29 20:55:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('227', '0', '2016-10-29 20:55:50', '2016-10-29 20:55:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477745748767 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('228', '0', '2016-10-29 20:55:50', '2016-10-29 20:55:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('229', '0', '2016-10-29 20:55:50', '2016-10-29 20:55:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('230', '0', '2016-10-29 20:56:21', '2016-10-29 20:56:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477745748770 | ', 'system/user', '1',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('231', '0', '2016-10-29 20:56:21', '2016-10-29 20:56:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '175', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('232', '0', '2016-10-29 20:56:22', '2016-10-29 20:56:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('233', '0', '2016-10-29 20:56:22', '2016-10-29 20:56:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '112', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('234', '0', '2016-10-29 20:56:22', '2016-10-29 20:56:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477745748773 | ', 'system/job', '1',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('235', '0', '2016-10-29 20:56:22', '2016-10-29 20:56:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '82', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('236', '0', '2016-10-29 20:56:24', '2016-10-29 20:56:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '997', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('237', '0', '2016-10-29 20:56:24', '2016-10-29 20:56:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('238', '0', '2016-10-29 20:56:24', '2016-10-29 20:56:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '1389', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('239', '0', '2016-10-29 20:56:24', '2016-10-29 20:56:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '1622', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('240', '0', '2016-10-29 20:56:28', '2016-10-29 20:56:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477745785757 | ', 'system/user', '1',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('241', '0', '2016-10-29 20:56:28', '2016-10-29 20:56:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '322', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('242', '0', '2016-10-29 20:56:29', '2016-10-29 20:56:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('243', '0', '2016-10-29 20:56:29', '2016-10-29 20:56:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '122', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('244', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477745785761 | ', 'system/organization', '1',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('245', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477745785760 | ', 'system/job', '8',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('246', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '31', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('247', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '21', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('248', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '108', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('249', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '200', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('250', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '59', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('251', '0', '2016-10-29 22:28:44', '2016-10-29 22:28:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '40', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('252', '0', '2016-10-29 22:28:48', '2016-10-29 22:28:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477745785766 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('253', '0', '2016-10-29 22:28:48', '2016-10-29 22:28:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '29',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('254', '0', '2016-10-29 22:28:48', '2016-10-29 22:28:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('255', '0', '2016-10-29 22:28:49', '2016-10-29 22:28:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477745785769 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('256', '0', '2016-10-29 22:28:49', '2016-10-29 22:28:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '7',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('257', '0', '2016-10-29 22:28:49', '2016-10-29 22:28:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '4',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('258', '0', '2016-10-29 22:28:50', '2016-10-29 22:28:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477745785772 | ', 'system/online', '2',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('259', '0', '2016-10-29 22:28:50', '2016-10-29 22:28:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '6', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('260', '0', '2016-10-29 22:28:54', '2016-10-29 22:28:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477745785775 | ', 'system/log', '0',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('261', '0', '2016-10-29 22:28:55', '2016-10-29 22:28:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=260, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=260, pages=9, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '12', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('262', '0', '2016-10-29 22:29:02', '2016-10-29 22:29:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477745785778 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('263', '0', '2016-10-29 22:29:02', '2016-10-29 22:29:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '69', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('264', '0', '2016-10-29 22:29:02', '2016-10-29 22:29:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '51',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('265', '0', '2016-10-31 21:27:00', '2016-10-31 21:27:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477920419913 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"7a026eb47714f05e0fd5e2d45123e1c0\"}',
   '506', 'http://localhost:8080/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('266', '0', '2016-10-31 21:28:07', '2016-10-31 21:28:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'1\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Sat Oct 29 15:06:05 CST 2016\', updateTime=\'Sat Oct 29 15:06:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '582', 'http://localhost:8080/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('267', '0', '2016-10-31 21:28:07', '2016-10-31 21:28:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('268', '0', '2016-10-31 21:28:09', '2016-10-31 21:28:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477920488221 | ', 'system/ip', '2',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('269', '0', '2016-10-31 21:28:10', '2016-10-31 21:28:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '174', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('270', '0', '2016-10-31 21:28:12', '2016-10-31 21:28:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477920488224 | ', 'system/log', '2',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('271', '0', '2016-10-31 21:28:12', '2016-10-31 21:28:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=270, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=270, pages=9, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '62', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('272', '0', '2016-10-31 21:28:13', '2016-10-31 21:28:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477920488227 | ', 'system/online', '3',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('273', '0', '2016-10-31 21:28:13', '2016-10-31 21:28:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '19', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('274', '0', '2016-10-31 21:28:14', '2016-10-31 21:28:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477920488230 | ', 'system/role', '33',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('275', '0', '2016-10-31 21:28:14', '2016-10-31 21:28:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920488233 | ', 'system/permission', '11',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('276', '0', '2016-10-31 21:28:14', '2016-10-31 21:28:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '319', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('277', '0', '2016-10-31 21:28:15', '2016-10-31 21:28:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '635',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('278', '0', '2016-10-31 21:28:15', '2016-10-31 21:28:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '8', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('279', '0', '2016-10-31 21:28:15', '2016-10-31 21:28:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477920488236 | ', 'system/organization',
   '14', 'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('280', '0', '2016-10-31 21:28:15', '2016-10-31 21:28:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '55',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('281', '0', '2016-10-31 21:28:15', '2016-10-31 21:28:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '88', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('282', '0', '2016-10-31 21:28:15', '2016-10-31 21:28:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '85', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('283', '0', '2016-10-31 21:29:03', '2016-10-31 21:29:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477920488239 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('284', '0', '2016-10-31 21:29:03', '2016-10-31 21:29:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}',
   '15', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('285', '0', '2016-10-31 21:29:03', '2016-10-31 21:29:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '11',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('286', '0', '2016-10-31 21:29:07', '2016-10-31 21:29:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '39',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('287', '0', '2016-10-31 21:29:08', '2016-10-31 21:29:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '35',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('288', '0', '2016-10-31 21:30:48', '2016-10-31 21:30:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('289', '0', '2016-10-31 21:30:50', '2016-10-31 21:30:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477920648403 | ', 'system/ip', '1',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('290', '0', '2016-10-31 21:30:50', '2016-10-31 21:30:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '8', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('291', '0', '2016-10-31 21:30:51', '2016-10-31 21:30:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920648406 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('292', '0', '2016-10-31 21:30:51', '2016-10-31 21:30:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '30',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('293', '0', '2016-10-31 21:30:51', '2016-10-31 21:30:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '7', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('294', '0', '2016-10-31 21:31:01', '2016-10-31 21:31:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insertGroup', 'name = 数据库 | description = 数据库监控 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '13', 'http://localhost:8080/permission/group/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('295', '0', '2016-10-31 21:31:01', '2016-10-31 21:31:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '38',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('296', '0', '2016-10-31 21:31:04', '2016-10-31 21:31:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('297', '0', '2016-10-31 21:31:07', '2016-10-31 21:31:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920664796 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('298', '0', '2016-10-31 21:31:07', '2016-10-31 21:31:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '30',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('299', '0', '2016-10-31 21:31:07', '2016-10-31 21:31:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('300', '0', '2016-10-31 21:31:34', '2016-10-31 21:31:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 查看数据库监控 | code = db:select | description = 查看数据库监控 | groupId = 7 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '26', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('301', '0', '2016-10-31 21:31:34', '2016-10-31 21:31:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '37',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('302', '0', '2016-10-31 21:31:50', '2016-10-31 21:31:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477920664799 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('303', '0', '2016-10-31 21:31:50', '2016-10-31 21:31:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '13', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('304', '0', '2016-10-31 21:31:52', '2016-10-31 21:31:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477920712138 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"fe3b446dce38bbdc35d5aa92614804fb\"}',
   '131', 'http://localhost:8080/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('305', '0', '2016-10-31 21:31:56', '2016-10-31 21:31:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920713271 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('306', '0', '2016-10-31 21:31:56', '2016-10-31 21:31:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '31',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('307', '0', '2016-10-31 21:31:56', '2016-10-31 21:31:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('308', '0', '2016-10-31 21:32:45', '2016-10-31 21:32:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 下线 | code = user:loginout | description = 下线用户 | groupId = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '13', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('309', '0', '2016-10-31 21:32:45', '2016-10-31 21:32:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '39',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('310', '0', '2016-10-31 21:33:26', '2016-10-31 21:33:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 用户在线列表 | code = user:loginStatu:list | description = 用户在线列表 | groupId = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '18', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('311', '0', '2016-10-31 21:33:26', '2016-10-31 21:33:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '34',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('312', '0', '2016-10-31 21:33:29', '2016-10-31 21:33:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477920713274 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('313', '0', '2016-10-31 21:33:29', '2016-10-31 21:33:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '9', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('314', '0', '2016-10-31 21:33:36', '2016-10-31 21:33:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477920713277 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('315', '0', '2016-10-31 21:33:36', '2016-10-31 21:33:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('316', '0', '2016-10-31 21:33:36', '2016-10-31 21:33:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '5',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('317', '0', '2016-10-31 21:34:12', '2016-10-31 21:34:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 新建权限组 | code = permission:group:insert | description =  | groupId = 2 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '26', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('318', '0', '2016-10-31 21:34:12', '2016-10-31 21:34:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '31',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('319', '0', '2016-10-31 21:34:24', '2016-10-31 21:34:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('320', '0', '2016-10-31 21:34:26', '2016-10-31 21:34:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920864610 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('321', '0', '2016-10-31 21:34:26', '2016-10-31 21:34:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('322', '0', '2016-10-31 21:34:26', '2016-10-31 21:34:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('323', '0', '2016-10-31 21:34:31', '2016-10-31 21:34:31', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.update',
          'id = 37 | name = 新建权限组 | code = permission:group:insert | description = 新建权限组 | groupId = 2 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '17', 'http://localhost:8080/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('324', '0', '2016-10-31 21:34:31', '2016-10-31 21:34:31', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '37',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('325', '0', '2016-10-31 21:34:33', '2016-10-31 21:34:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('326', '0', '2016-10-31 21:34:34', '2016-10-31 21:34:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920873383 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('327', '0', '2016-10-31 21:34:34', '2016-10-31 21:34:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '32',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('328', '0', '2016-10-31 21:34:34', '2016-10-31 21:34:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('329', '0', '2016-10-31 21:35:10', '2016-10-31 21:35:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 权限组列表 | code = permission:group:list | description = 权限组列表 | groupId = 2 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '11', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('330', '0', '2016-10-31 21:35:10', '2016-10-31 21:35:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '32',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('331', '0', '2016-10-31 21:35:13', '2016-10-31 21:35:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('332', '0', '2016-10-31 21:35:14', '2016-10-31 21:35:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477920913208 | ', 'system/user', '29',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('333', '0', '2016-10-31 21:35:14', '2016-10-31 21:35:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '139', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('334', '0', '2016-10-31 21:35:14', '2016-10-31 21:35:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('335', '0', '2016-10-31 21:35:14', '2016-10-31 21:35:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '176', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('336', '0', '2016-10-31 21:35:15', '2016-10-31 21:35:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477920913211 | ', 'system/job', '2',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('337', '0', '2016-10-31 21:35:15', '2016-10-31 21:35:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '74', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('338', '0', '2016-10-31 21:35:16', '2016-10-31 21:35:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '148', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('339', '0', '2016-10-31 21:35:16', '2016-10-31 21:35:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '224', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('340', '0', '2016-10-31 21:35:16', '2016-10-31 21:35:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '267', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('341', '0', '2016-10-31 21:35:17', '2016-10-31 21:35:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '50', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('342', '0', '2016-10-31 21:35:19', '2016-10-31 21:35:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477920913214 | ', 'system/organization', '1',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('343', '0', '2016-10-31 21:35:19', '2016-10-31 21:35:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '39', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('344', '0', '2016-10-31 21:35:19', '2016-10-31 21:35:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '44', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('345', '0', '2016-10-31 21:35:19', '2016-10-31 21:35:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477920913217 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('346', '0', '2016-10-31 21:35:19', '2016-10-31 21:35:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '43',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('347', '0', '2016-10-31 21:35:19', '2016-10-31 21:35:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '101', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('348', '0', '2016-10-31 21:35:20', '2016-10-31 21:35:20', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477920913220 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('349', '0', '2016-10-31 21:35:21', '2016-10-31 21:35:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('350', '0', '2016-10-31 21:35:21', '2016-10-31 21:35:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '4',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('351', '0', '2016-10-31 21:35:21', '2016-10-31 21:35:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477920913223 | ', 'system/online', '2',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('352', '0', '2016-10-31 21:35:22', '2016-10-31 21:35:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '7', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('353', '0', '2016-10-31 21:35:23', '2016-10-31 21:35:23', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477920913226 | ', 'system/log', '1',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('354', '0', '2016-10-31 21:35:23', '2016-10-31 21:35:23', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=353, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=353, pages=12, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '13', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('355', '0', '2016-10-31 21:35:24', '2016-10-31 21:35:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920913229 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('356', '0', '2016-10-31 21:35:24', '2016-10-31 21:35:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '27',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('357', '0', '2016-10-31 21:35:24', '2016-10-31 21:35:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('358', '0', '2016-10-31 21:35:25', '2016-10-31 21:35:25', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477920913232 | ', 'system/ip', '2',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('359', '0', '2016-10-31 21:35:25', '2016-10-31 21:35:25', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '6', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('360', '0', '2016-10-31 21:35:27', '2016-10-31 21:35:27', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '5', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('361', '0', '2016-10-31 21:35:45', '2016-10-31 21:35:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupInsert', 'name = 安全 | description = 系统访问限制 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '14', 'http://localhost:8080/system/dataGroup/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('362', '0', '2016-10-31 21:35:45', '2016-10-31 21:35:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('363', '0', '2016-10-31 21:35:47', '2016-10-31 21:35:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('364', '0', '2016-10-31 21:35:48', '2016-10-31 21:35:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477920947204 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('365', '0', '2016-10-31 21:35:48', '2016-10-31 21:35:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('366', '0', '2016-10-31 21:35:48', '2016-10-31 21:35:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'系统访问限制\', parentId=\'0\', name=\'安全\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:35:45 CST 2016\', updateTime=\'Mon Oct 31 21:35:45 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('367', '0', '2016-10-31 21:35:48', '2016-10-31 21:35:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920947207 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('368', '0', '2016-10-31 21:35:49', '2016-10-31 21:35:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('369', '0', '2016-10-31 21:35:49', '2016-10-31 21:35:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('370', '0', '2016-10-31 21:35:54', '2016-10-31 21:35:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('371', '0', '2016-10-31 21:35:54', '2016-10-31 21:35:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920954144 | ', 'system/permission', '2',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('372', '0', '2016-10-31 21:35:54', '2016-10-31 21:35:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '31',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('373', '0', '2016-10-31 21:35:54', '2016-10-31 21:35:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('374', '0', '2016-10-31 21:36:23', '2016-10-31 21:36:23', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('375', '0', '2016-10-31 21:36:24', '2016-10-31 21:36:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('376', '0', '2016-10-31 21:36:26', '2016-10-31 21:36:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920985140 | ', 'system/permission', '0',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('377', '0', '2016-10-31 21:36:26', '2016-10-31 21:36:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('378', '0', '2016-10-31 21:36:26', '2016-10-31 21:36:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('379', '0', '2016-10-31 21:36:37', '2016-10-31 21:36:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('380', '0', '2016-10-31 21:36:38', '2016-10-31 21:36:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477920997450 | ', 'system/ip', '1',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('381', '0', '2016-10-31 21:36:38', '2016-10-31 21:36:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '5', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('382', '0', '2016-10-31 21:36:39', '2016-10-31 21:36:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477920997453 | ', 'system/data', '0',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('383', '0', '2016-10-31 21:36:39', '2016-10-31 21:36:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('384', '0', '2016-10-31 21:36:39', '2016-10-31 21:36:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'系统访问限制\', parentId=\'0\', name=\'安全\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:35:45 CST 2016\', updateTime=\'Mon Oct 31 21:35:45 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('385', '0', '2016-10-31 21:36:39', '2016-10-31 21:36:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477920997456 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('386', '0', '2016-10-31 21:36:40', '2016-10-31 21:36:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '23',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('387', '0', '2016-10-31 21:36:40', '2016-10-31 21:36:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('388', '0', '2016-10-31 21:36:47', '2016-10-31 21:36:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('389', '0', '2016-10-31 21:36:48', '2016-10-31 21:36:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921007488 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('390', '0', '2016-10-31 21:36:48', '2016-10-31 21:36:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('391', '0', '2016-10-31 21:36:48', '2016-10-31 21:36:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('392', '0', '2016-10-31 21:37:42', '2016-10-31 21:37:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '6', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('393', '0', '2016-10-31 21:37:42', '2016-10-31 21:37:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('394', '0', '2016-10-31 21:37:42', '2016-10-31 21:37:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('395', '0', '2016-10-31 21:37:44', '2016-10-31 21:37:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921062535 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('396', '0', '2016-10-31 21:37:44', '2016-10-31 21:37:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '20',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('397', '0', '2016-10-31 21:37:44', '2016-10-31 21:37:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('398', '0', '2016-10-31 21:37:51', '2016-10-31 21:37:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('399', '0', '2016-10-31 21:38:04', '2016-10-31 21:38:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '31',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('400', '0', '2016-10-31 21:38:05', '2016-10-31 21:38:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('401', '0', '2016-10-31 21:38:05', '2016-10-31 21:38:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '27',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('402', '0', '2016-10-31 21:38:24', '2016-10-31 21:38:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477921062538 | ', 'system/ip', '1',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('403', '0', '2016-10-31 21:38:24', '2016-10-31 21:38:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '5', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('404', '0', '2016-10-31 21:38:26', '2016-10-31 21:38:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '6', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('405', '0', '2016-10-31 21:38:26', '2016-10-31 21:38:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '8', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('406', '0', '2016-10-31 21:38:26', '2016-10-31 21:38:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '7', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('407', '0', '2016-10-31 21:38:32', '2016-10-31 21:38:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477921062541 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('408', '0', '2016-10-31 21:38:32', '2016-10-31 21:38:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '6', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('409', '0', '2016-10-31 21:38:33', '2016-10-31 21:38:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477921062544 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('410', '0', '2016-10-31 21:38:33', '2016-10-31 21:38:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '4',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('411', '0', '2016-10-31 21:38:33', '2016-10-31 21:38:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'系统访问限制\', parentId=\'0\', name=\'安全\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:35:45 CST 2016\', updateTime=\'Mon Oct 31 21:35:45 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('412', '0', '2016-10-31 21:38:34', '2016-10-31 21:38:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477921062547 | ', 'system/role', '0',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('413', '0', '2016-10-31 21:38:34', '2016-10-31 21:38:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '45',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('414', '0', '2016-10-31 21:38:34', '2016-10-31 21:38:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '116', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('415', '0', '2016-10-31 21:38:34', '2016-10-31 21:38:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477921062550 | ', 'system/organization', '1',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('416', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '29', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('417', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '35', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('418', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477921062553 | ', 'system/job', '1',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('419', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '51', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('420', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '114', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('421', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '175', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('422', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '41', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('423', '0', '2016-10-31 21:38:35', '2016-10-31 21:38:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477921062556 | ', 'system/user', '1',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('424', '0', '2016-10-31 21:38:36', '2016-10-31 21:38:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '120', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('425', '0', '2016-10-31 21:38:36', '2016-10-31 21:38:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '66',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('426', '0', '2016-10-31 21:38:36', '2016-10-31 21:38:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '68', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('427', '0', '2016-10-31 21:38:38', '2016-10-31 21:38:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '67', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('428', '0', '2016-10-31 21:38:38', '2016-10-31 21:38:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '132', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('429', '0', '2016-10-31 21:38:39', '2016-10-31 21:38:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477921062559 | ', 'system/log', '0',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('430', '0', '2016-10-31 21:38:39', '2016-10-31 21:38:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=429, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=429, pages=15, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '11', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('431', '0', '2016-10-31 21:39:56', '2016-10-31 21:39:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('432', '0', '2016-10-31 21:39:57', '2016-10-31 21:39:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921196522 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('433', '0', '2016-10-31 21:39:57', '2016-10-31 21:39:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('434', '0', '2016-10-31 21:39:57', '2016-10-31 21:39:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '6', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('435', '0', '2016-10-31 21:40:00', '2016-10-31 21:40:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477921196525 | ', 'system/log', '1',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('436', '0', '2016-10-31 21:40:00', '2016-10-31 21:40:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=435, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=435, pages=15, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '9', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('437', '0', '2016-10-31 21:43:47', '2016-10-31 21:43:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insertGroup', 'name = 安全 | description = 安全 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '11', 'http://localhost:8080/permission/group/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('438', '0', '2016-10-31 21:43:47', '2016-10-31 21:43:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '24',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('439', '0', '2016-10-31 21:43:51', '2016-10-31 21:43:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('440', '0', '2016-10-31 21:43:52', '2016-10-31 21:43:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921431557 | ', 'system/permission', '0',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('441', '0', '2016-10-31 21:43:52', '2016-10-31 21:43:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '23',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('442', '0', '2016-10-31 21:43:52', '2016-10-31 21:43:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('443', '0', '2016-10-31 21:44:18', '2016-10-31 21:44:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 新增IP | code = ip:insert | description = 新增IP | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '11', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('444', '0', '2016-10-31 21:44:18', '2016-10-31 21:44:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('445', '0', '2016-10-31 21:44:44', '2016-10-31 21:44:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 更新ip | code = ip:update | description = 更新ip | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '12', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('446', '0', '2016-10-31 21:44:44', '2016-10-31 21:44:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '27',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('447', '0', '2016-10-31 21:44:59', '2016-10-31 21:44:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 删除ip | code = ip:delete | description = 删除ip | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '14', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('448', '0', '2016-10-31 21:44:59', '2016-10-31 21:44:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('449', '0', '2016-10-31 21:45:14', '2016-10-31 21:45:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 查看ip | code = ip:select | description = 查看ip | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '14', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('450', '0', '2016-10-31 21:45:14', '2016-10-31 21:45:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('451', '0', '2016-10-31 21:45:18', '2016-10-31 21:45:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477921431560 | ', 'system/ip', '1',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('452', '0', '2016-10-31 21:45:18', '2016-10-31 21:45:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '4', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('453', '0', '2016-10-31 21:45:20', '2016-10-31 21:45:20', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '5', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('454', '0', '2016-10-31 21:45:37', '2016-10-31 21:45:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = ip列表 | code = ip:list | description = ip列表 | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '10', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('455', '0', '2016-10-31 21:45:37', '2016-10-31 21:45:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '27',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('456', '0', '2016-10-31 21:45:47', '2016-10-31 21:45:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.update',
          'id = 39 | name = 新增 | code = ip:insert | description = 新增IP | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '17', 'http://localhost:8080/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('457', '0', '2016-10-31 21:45:47', '2016-10-31 21:45:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '31',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('458', '0', '2016-10-31 21:45:51', '2016-10-31 21:45:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.update',
          'id = 40 | name = 更新 | code = ip:update | description = 更新ip | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '12', 'http://localhost:8080/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('459', '0', '2016-10-31 21:45:51', '2016-10-31 21:45:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('460', '0', '2016-10-31 21:45:54', '2016-10-31 21:45:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.update',
          'id = 41 | name = 删除 | code = ip:delete | description = 删除ip | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '12', 'http://localhost:8080/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('461', '0', '2016-10-31 21:45:54', '2016-10-31 21:45:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '29',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('462', '0', '2016-10-31 21:45:57', '2016-10-31 21:45:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.update',
          'id = 42 | name = 查看 | code = ip:select | description = 查看ip | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '11', 'http://localhost:8080/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('463', '0', '2016-10-31 21:45:58', '2016-10-31 21:45:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '28',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('464', '0', '2016-10-31 21:46:02', '2016-10-31 21:46:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.update',
          'id = 43 | name = 列表 | code = ip:list | description = ip列表 | groupId = 8 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '13', 'http://localhost:8080/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('465', '0', '2016-10-31 21:46:02', '2016-10-31 21:46:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('466', '0', '2016-10-31 21:46:13', '2016-10-31 21:46:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('467', '0', '2016-10-31 21:46:13', '2016-10-31 21:46:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('468', '0', '2016-10-31 21:46:18', '2016-10-31 21:46:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477921431563 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('469', '0', '2016-10-31 21:46:18', '2016-10-31 21:46:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('470', '0', '2016-10-31 21:46:18', '2016-10-31 21:46:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '5',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('471', '0', '2016-10-31 21:46:18', '2016-10-31 21:46:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477921431566 | ', 'system/log', '1',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('472', '0', '2016-10-31 21:46:19', '2016-10-31 21:46:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=471, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=471, pages=16, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '9', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('473', '0', '2016-10-31 21:46:41', '2016-10-31 21:46:41', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('474', '0', '2016-10-31 21:46:44', '2016-10-31 21:46:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477921601525 | ', 'system/user', '2',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('475', '0', '2016-10-31 21:46:44', '2016-10-31 21:46:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '72', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('476', '0', '2016-10-31 21:46:44', '2016-10-31 21:46:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('477', '0', '2016-10-31 21:46:44', '2016-10-31 21:46:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '56', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('478', '0', '2016-10-31 21:46:45', '2016-10-31 21:46:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477921601528 | ', 'system/job', '1',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('479', '0', '2016-10-31 21:46:45', '2016-10-31 21:46:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '44', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('480', '0', '2016-10-31 21:46:45', '2016-10-31 21:46:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '77', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('481', '0', '2016-10-31 21:46:45', '2016-10-31 21:46:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '75', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('482', '0', '2016-10-31 21:46:45', '2016-10-31 21:46:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '126', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('483', '0', '2016-10-31 21:46:46', '2016-10-31 21:46:46', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477921601531 | ', 'system/organization', '2',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('484', '0', '2016-10-31 21:46:46', '2016-10-31 21:46:46', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '27', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('485', '0', '2016-10-31 21:46:46', '2016-10-31 21:46:46', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '30', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('486', '0', '2016-10-31 21:46:47', '2016-10-31 21:46:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477921601534 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('487', '0', '2016-10-31 21:46:47', '2016-10-31 21:46:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '80', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('488', '0', '2016-10-31 21:46:47', '2016-10-31 21:46:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '34',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('489', '0', '2016-10-31 21:46:48', '2016-10-31 21:46:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921601537 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('490', '0', '2016-10-31 21:46:48', '2016-10-31 21:46:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '19',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('491', '0', '2016-10-31 21:46:48', '2016-10-31 21:46:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('492', '0', '2016-10-31 21:46:48', '2016-10-31 21:46:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477921601540 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('493', '0', '2016-10-31 21:46:49', '2016-10-31 21:46:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('494', '0', '2016-10-31 21:46:49', '2016-10-31 21:46:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '8',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('495', '0', '2016-10-31 21:46:49', '2016-10-31 21:46:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477921601543 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('496', '0', '2016-10-31 21:46:49', '2016-10-31 21:46:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '8', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('497', '0', '2016-10-31 21:46:50', '2016-10-31 21:46:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477921601546 | ', 'system/log', '1',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('498', '0', '2016-10-31 21:46:50', '2016-10-31 21:46:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=497, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=497, pages=17, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '10', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('499', '0', '2016-10-31 21:46:51', '2016-10-31 21:46:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ip', '_ = 1477921601549 | ', 'system/ip', '1',
   'http://localhost:8080/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('500', '0', '2016-10-31 21:46:51', '2016-10-31 21:46:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '8', 'http://localhost:8080/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('501', '0', '2016-10-31 21:47:16', '2016-10-31 21:47:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '4',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('502', '0', '2016-10-31 21:47:17', '2016-10-31 21:47:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('503', '0', '2016-10-31 21:48:05', '2016-10-31 21:48:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('504', '0', '2016-10-31 21:48:08', '2016-10-31 21:48:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921686034 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('505', '0', '2016-10-31 21:48:08', '2016-10-31 21:48:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('506', '0', '2016-10-31 21:48:08', '2016-10-31 21:48:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('507', '0', '2016-10-31 21:48:09', '2016-10-31 21:48:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477921686037 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('508', '0', '2016-10-31 21:48:10', '2016-10-31 21:48:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('509', '0', '2016-10-31 21:48:10', '2016-10-31 21:48:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '4',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('510', '0', '2016-10-31 21:50:14', '2016-10-31 21:50:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('511', '0', '2016-10-31 21:50:16', '2016-10-31 21:50:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477921814438 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('512', '0', '2016-10-31 21:50:16', '2016-10-31 21:50:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('513', '0', '2016-10-31 21:50:16', '2016-10-31 21:50:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '4',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('514', '0', '2016-10-31 21:50:18', '2016-10-31 21:50:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921814441 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('515', '0', '2016-10-31 21:50:18', '2016-10-31 21:50:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '22',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('516', '0', '2016-10-31 21:50:18', '2016-10-31 21:50:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '3', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('517', '0', '2016-10-31 21:51:32', '2016-10-31 21:51:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('518', '0', '2016-10-31 21:51:33', '2016-10-31 21:51:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921892908 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('519', '0', '2016-10-31 21:51:34', '2016-10-31 21:51:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '29',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('520', '0', '2016-10-31 21:51:55', '2016-10-31 21:51:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('521', '0', '2016-10-31 21:51:56', '2016-10-31 21:51:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921915615 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('522', '0', '2016-10-31 21:51:57', '2016-10-31 21:51:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '29',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('523', '0', '2016-10-31 21:52:07', '2016-10-31 21:52:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477921915618 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('524', '0', '2016-10-31 21:52:07', '2016-10-31 21:52:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '87', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('525', '0', '2016-10-31 21:52:07', '2016-10-31 21:52:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '29',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('526', '0', '2016-10-31 21:52:07', '2016-10-31 21:52:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477921915621 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('527', '0', '2016-10-31 21:52:08', '2016-10-31 21:52:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '6',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('528', '0', '2016-10-31 21:52:11', '2016-10-31 21:52:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('529', '0', '2016-10-31 21:52:11', '2016-10-31 21:52:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('530', '0', '2016-10-31 21:52:13', '2016-10-31 21:52:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921931739 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('531', '0', '2016-10-31 21:52:13', '2016-10-31 21:52:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('532', '0', '2016-10-31 21:52:16', '2016-10-31 21:52:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('533', '0', '2016-10-31 21:52:16', '2016-10-31 21:52:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('534', '0', '2016-10-31 21:52:18', '2016-10-31 21:52:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921936512 | ', 'system/permission', '0',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('535', '0', '2016-10-31 21:52:18', '2016-10-31 21:52:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '23',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('536', '0', '2016-10-31 21:53:29', '2016-10-31 21:53:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477921936515 | ', 'system/permission', '3',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('537', '0', '2016-10-31 21:53:29', '2016-10-31 21:53:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '17',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('538', '0', '2016-10-31 22:03:35', '2016-10-31 22:03:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('539', '0', '2016-10-31 22:03:36', '2016-10-31 22:03:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922615325 | ', 'system/permission', '2',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('540', '0', '2016-10-31 22:03:36', '2016-10-31 22:03:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '22',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('541', '0', '2016-10-31 22:04:26', '2016-10-31 22:04:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('542', '0', '2016-10-31 22:04:28', '2016-10-31 22:04:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('543', '0', '2016-10-31 22:04:28', '2016-10-31 22:04:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('544', '0', '2016-10-31 22:04:29', '2016-10-31 22:04:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('545', '0', '2016-10-31 22:04:30', '2016-10-31 22:04:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477922669303 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('546', '0', '2016-10-31 22:04:30', '2016-10-31 22:04:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '82', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('547', '0', '2016-10-31 22:04:30', '2016-10-31 22:04:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '39',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('548', '0', '2016-10-31 22:04:34', '2016-10-31 22:04:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922669306 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('549', '0', '2016-10-31 22:04:34', '2016-10-31 22:04:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '22',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('550', '0', '2016-10-31 22:04:36', '2016-10-31 22:04:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477922669309 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('551', '0', '2016-10-31 22:04:36', '2016-10-31 22:04:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '7', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('552', '0', '2016-10-31 22:04:36', '2016-10-31 22:04:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477922669312 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('553', '0', '2016-10-31 22:04:36', '2016-10-31 22:04:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('554', '0', '2016-10-31 22:04:38', '2016-10-31 22:04:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922669315 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('555', '0', '2016-10-31 22:04:38', '2016-10-31 22:04:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('556', '0', '2016-10-31 22:04:42', '2016-10-31 22:04:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('557', '0', '2016-10-31 22:04:57', '2016-10-31 22:04:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('558', '0', '2016-10-31 22:04:57', '2016-10-31 22:04:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('559', '0', '2016-10-31 22:04:59', '2016-10-31 22:04:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477922697919 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('560', '0', '2016-10-31 22:04:59', '2016-10-31 22:04:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '60', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('561', '0', '2016-10-31 22:04:59', '2016-10-31 22:04:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('562', '0', '2016-10-31 22:05:00', '2016-10-31 22:05:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477922697922 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('563', '0', '2016-10-31 22:05:00', '2016-10-31 22:05:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('564', '0', '2016-10-31 22:05:00', '2016-10-31 22:05:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '4',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('565', '0', '2016-10-31 22:05:02', '2016-10-31 22:05:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922697925 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('566', '0', '2016-10-31 22:05:02', '2016-10-31 22:05:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('567', '0', '2016-10-31 22:05:09', '2016-10-31 22:05:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('568', '0', '2016-10-31 22:05:10', '2016-10-31 22:05:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922709242 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('569', '0', '2016-10-31 22:05:10', '2016-10-31 22:05:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '19',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('570', '0', '2016-10-31 22:05:11', '2016-10-31 22:05:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('571', '0', '2016-10-31 22:05:43', '2016-10-31 22:05:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('572', '0', '2016-10-31 22:05:44', '2016-10-31 22:05:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922743767 | ', 'system/permission', '2',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('573', '0', '2016-10-31 22:05:44', '2016-10-31 22:05:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '24',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('574', '0', '2016-10-31 22:05:44', '2016-10-31 22:05:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '3', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('575', '0', '2016-10-31 22:05:57', '2016-10-31 22:05:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477922743770 | ', 'system/data', '0',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('576', '0', '2016-10-31 22:05:58', '2016-10-31 22:05:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('577', '0', '2016-10-31 22:05:58', '2016-10-31 22:05:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '3',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('578', '0', '2016-10-31 22:06:03', '2016-10-31 22:06:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('579', '0', '2016-10-31 22:06:03', '2016-10-31 22:06:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('580', '0', '2016-10-31 22:06:05', '2016-10-31 22:06:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('581', '0', '2016-10-31 22:06:06', '2016-10-31 22:06:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('582', '0', '2016-10-31 22:06:30', '2016-10-31 22:06:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477922766575 | ', 'system/role', '0',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('583', '0', '2016-10-31 22:06:30', '2016-10-31 22:06:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922766576 | ', 'system/permission', '0',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('584', '0', '2016-10-31 22:06:30', '2016-10-31 22:06:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '59', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('585', '0', '2016-10-31 22:06:30', '2016-10-31 22:06:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '25',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('586', '0', '2016-10-31 22:06:30', '2016-10-31 22:06:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('587', '0', '2016-10-31 22:06:30', '2016-10-31 22:06:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '3', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('588', '0', '2016-10-31 22:06:37', '2016-10-31 22:06:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477922766581 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('589', '0', '2016-10-31 22:06:38', '2016-10-31 22:06:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '4',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('590', '0', '2016-10-31 22:06:38', '2016-10-31 22:06:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '4',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('591', '0', '2016-10-31 22:07:00', '2016-10-31 22:07:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('592', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477922820844 | ', 'system/user', '1',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('593', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '81', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('594', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '18',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('595', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '45', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('596', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477922820847 | ', 'system/job', '0',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('597', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '41', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('598', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '102', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('599', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '58', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('600', '0', '2016-10-31 22:07:02', '2016-10-31 22:07:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '118', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('601', '0', '2016-10-31 22:07:03', '2016-10-31 22:07:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477922820850 | ', 'system/organization', '1',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('602', '0', '2016-10-31 22:07:03', '2016-10-31 22:07:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '29', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('603', '0', '2016-10-31 22:07:03', '2016-10-31 22:07:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '35', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('604', '0', '2016-10-31 22:07:03', '2016-10-31 22:07:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477922820853 | ', 'system/role', '0',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('605', '0', '2016-10-31 22:07:03', '2016-10-31 22:07:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '66', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('606', '0', '2016-10-31 22:07:04', '2016-10-31 22:07:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '31',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('607', '0', '2016-10-31 22:07:04', '2016-10-31 22:07:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922820856 | ', 'system/permission', '0',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('608', '0', '2016-10-31 22:07:04', '2016-10-31 22:07:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '19',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('609', '0', '2016-10-31 22:07:04', '2016-10-31 22:07:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('610', '0', '2016-10-31 22:07:06', '2016-10-31 22:07:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('611', '0', '2016-10-31 22:07:08', '2016-10-31 22:07:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922826426 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('612', '0', '2016-10-31 22:07:08', '2016-10-31 22:07:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('613', '0', '2016-10-31 22:07:08', '2016-10-31 22:07:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '3', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('614', '0', '2016-10-31 22:07:16', '2016-10-31 22:07:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('615', '0', '2016-10-31 22:07:18', '2016-10-31 22:07:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922836374 | ', 'system/permission', '0',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('616', '0', '2016-10-31 22:07:18', '2016-10-31 22:07:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '20',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('617', '0', '2016-10-31 22:07:18', '2016-10-31 22:07:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('618', '0', '2016-10-31 22:08:14', '2016-10-31 22:08:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477922836377 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('619', '0', '2016-10-31 22:08:14', '2016-10-31 22:08:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '7',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('620', '0', '2016-10-31 22:08:14', '2016-10-31 22:08:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL, '[]', '5',
   'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('621', '0', '2016-10-31 22:08:28', '2016-10-31 22:08:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupInsert', 'name = 极限验证 | description = 极限验证 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '8', 'http://localhost:8080/system/dataGroup/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('622', '0', '2016-10-31 22:08:28', '2016-10-31 22:08:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('623', '0', '2016-10-31 22:08:30', '2016-10-31 22:08:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('624', '0', '2016-10-31 22:08:31', '2016-10-31 22:08:31', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477922910976 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('625', '0', '2016-10-31 22:08:31', '2016-10-31 22:08:31', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '21',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('626', '0', '2016-10-31 22:08:32', '2016-10-31 22:08:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '3', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('627', '0', '2016-10-31 22:08:32', '2016-10-31 22:08:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477922910979 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('628', '0', '2016-10-31 22:08:32', '2016-10-31 22:08:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ', 'PageInfo{total=0, rows=[]}', '5',
   'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('629', '0', '2016-10-31 22:08:32', '2016-10-31 22:08:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '3', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('630', '0', '2016-10-31 22:08:48', '2016-10-31 22:08:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataInsert',
          'key = geetest_id | value = 796c2461adf8051c835e4a758a6091f6 | description = geetest_id | groupId = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '10', 'http://localhost:8080/system/data/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('631', '0', '2016-10-31 22:08:48', '2016-10-31 22:08:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=1, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '39', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('632', '0', '2016-10-31 22:09:19', '2016-10-31 22:09:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataInsert',
          'key = geetest_key | value = 0edad631bed761ab039d8391dd3103ff | description = geetest_key | groupId = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=2}', '13', 'http://localhost:8080/system/data/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('633', '0', '2016-10-31 22:09:19', '2016-10-31 22:09:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=2, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '11', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('634', '0', '2016-10-31 22:09:38', '2016-10-31 22:09:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupInsert', 'name = 日志 | description = 日志输出控制 | ',
   'Result{code=10000, msg=\'操作成功\', data=2}', '7', 'http://localhost:8080/system/dataGroup/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('635', '0', '2016-10-31 22:09:38', '2016-10-31 22:09:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=2, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '10', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('636', '0', '2016-10-31 22:09:42', '2016-10-31 22:09:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '1', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('637', '0', '2016-10-31 22:09:44', '2016-10-31 22:09:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477922982710 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('638', '0', '2016-10-31 22:09:44', '2016-10-31 22:09:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=2, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '9', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('639', '0', '2016-10-31 22:09:44', '2016-10-31 22:09:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '3', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('640', '0', '2016-10-31 22:10:21', '2016-10-31 22:10:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataInsert',
          'key = error_detail | value = true | description = 是否错误日志详情 | groupId = 2 | ',
   'Result{code=10000, msg=\'操作成功\', data=3}', '6', 'http://localhost:8080/system/data/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('641', '0', '2016-10-31 22:10:21', '2016-10-31 22:10:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '12', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('642', '0', '2016-10-31 22:10:55', '2016-10-31 22:10:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '10', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('643', '0', '2016-10-31 22:10:55', '2016-10-31 22:10:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '22', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('644', '0', '2016-10-31 22:10:56', '2016-10-31 22:10:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '11', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('645', '0', '2016-10-31 22:10:56', '2016-10-31 22:10:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '12', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('646', '0', '2016-10-31 22:10:59', '2016-10-31 22:10:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '11', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('647', '0', '2016-10-31 22:11:00', '2016-10-31 22:11:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '13', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('648', '0', '2016-10-31 22:11:00', '2016-10-31 22:11:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '12', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('649', '0', '2016-10-31 22:11:01', '2016-10-31 22:11:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '12', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('650', '0', '2016-10-31 22:11:02', '2016-10-31 22:11:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '14', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('651', '0', '2016-10-31 22:11:50', '2016-10-31 22:11:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '0', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('652', '0', '2016-10-31 22:11:56', '2016-10-31 22:11:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477923111033 | ', 'system/user', '14',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('653', '0', '2016-10-31 22:11:56', '2016-10-31 22:11:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '399', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('654', '0', '2016-10-31 22:11:57', '2016-10-31 22:11:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '405', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('655', '0', '2016-10-31 22:11:57', '2016-10-31 22:11:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '622',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('656', '0', '2016-10-31 22:11:59', '2016-10-31 22:11:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477923111036 | ', 'system/log', '3',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('657', '0', '2016-10-31 22:11:59', '2016-10-31 22:11:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=656, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=656, pages=22, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '33', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('658', '0', '2016-10-31 22:12:03', '2016-10-31 22:12:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477923111039 | ', 'system/data', '3',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('659', '0', '2016-10-31 22:12:03', '2016-10-31 22:12:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '32', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('660', '0', '2016-10-31 22:12:03', '2016-10-31 22:12:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '13', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('661', '0', '2016-10-31 22:12:06', '2016-10-31 22:12:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477923111042 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('662', '0', '2016-10-31 22:12:07', '2016-10-31 22:12:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '20', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('663', '0', '2016-10-31 22:12:07', '2016-10-31 22:12:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '9', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('664', '0', '2016-10-31 22:12:19', '2016-10-31 22:12:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataUpdate',
          'id = 3 | key = error_detail | value = true | description = 是否输出错误日志详情 | groupId = 2 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '34', 'http://localhost:8080/system/data/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('665', '0', '2016-10-31 22:12:19', '2016-10-31 22:12:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '17', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('666', '0', '2016-10-31 22:16:11', '2016-10-31 22:16:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('667', '0', '2016-10-31 22:17:33', '2016-10-31 22:17:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477923371750 | ', 'system/data', '3',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('668', '0', '2016-10-31 22:17:34', '2016-10-31 22:17:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '59', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('669', '0', '2016-10-31 22:17:34', '2016-10-31 22:17:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '12', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('670', '0', '2016-10-31 22:18:53', '2016-10-31 22:18:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '43', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('671', '0', '2016-10-31 22:18:54', '2016-10-31 22:18:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '25', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('672', '0', '2016-10-31 22:18:58', '2016-10-31 22:18:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '20', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('673', '0', '2016-10-31 22:18:59', '2016-10-31 22:18:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477923371753 | ', 'system/role', '2',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('674', '0', '2016-10-31 22:18:59', '2016-10-31 22:18:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '235', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('675', '0', '2016-10-31 22:18:59', '2016-10-31 22:18:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '145',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('676', '0', '2016-10-31 22:19:00', '2016-10-31 22:19:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477923371756 | ', 'system/permission', '2',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('677', '0', '2016-10-31 22:19:00', '2016-10-31 22:19:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '35',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('678', '0', '2016-10-31 22:19:00', '2016-10-31 22:19:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '9', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('679', '0', '2016-10-31 22:22:50', '2016-10-31 22:22:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('680', '0', '2016-10-31 22:22:52', '2016-10-31 22:22:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477923771545 | ', 'system/permission', '4',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('681', '0', '2016-10-31 22:22:54', '2016-10-31 22:22:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '27',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('682', '0', '2016-10-31 22:22:54', '2016-10-31 22:22:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('683', '0', '2016-10-31 22:25:04', '2016-10-31 22:25:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('684', '0', '2016-10-31 22:25:07', '2016-10-31 22:25:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477923904667 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('685', '0', '2016-10-31 22:25:07', '2016-10-31 22:25:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '37',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('686', '0', '2016-10-31 22:25:07', '2016-10-31 22:25:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '5', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('687', '0', '2016-10-31 22:25:32', '2016-10-31 22:25:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 字典组列表 | code = data:group:list | description = 字典组列表 | groupId = 6 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '21', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('688', '0', '2016-10-31 22:25:32', '2016-10-31 22:25:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '52',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('689', '0', '2016-10-31 22:26:13', '2016-10-31 22:26:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 新增字典组 | code = data:group:list | description = 新增字典组 | groupId = 6 | ',
   'Result{code=20000, msg=\'该权限分组下编码已存在已存在\', data=}', '6', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('690', '0', '2016-10-31 22:26:24', '2016-10-31 22:26:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.insert',
          'name = 新增字典组 | code = data:group:insert | description = 新增字典组 | groupId = 6 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '15', 'http://localhost:8080/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('691', '0', '2016-10-31 22:26:24', '2016-10-31 22:26:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '30',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('692', '0', '2016-10-31 22:26:29', '2016-10-31 22:26:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477923904670 | ', 'system/user', '1',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('693', '0', '2016-10-31 22:26:29', '2016-10-31 22:26:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '131', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('694', '0', '2016-10-31 22:26:29', '2016-10-31 22:26:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '33',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('695', '0', '2016-10-31 22:26:29', '2016-10-31 22:26:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '150', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('696', '0', '2016-10-31 22:26:31', '2016-10-31 22:26:31', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477923904673 | ', 'system/job', '1',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('697', '0', '2016-10-31 22:26:31', '2016-10-31 22:26:31', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '49', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('698', '0', '2016-10-31 22:26:32', '2016-10-31 22:26:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '75', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('699', '0', '2016-10-31 22:26:32', '2016-10-31 22:26:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '190', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('700', '0', '2016-10-31 22:26:32', '2016-10-31 22:26:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '50', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('701', '0', '2016-10-31 22:26:32', '2016-10-31 22:26:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477923904676 | ', 'system/organization', '1',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('702', '0', '2016-10-31 22:26:32', '2016-10-31 22:26:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '62', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('703', '0', '2016-10-31 22:26:32', '2016-10-31 22:26:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '46', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('704', '0', '2016-10-31 22:26:33', '2016-10-31 22:26:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477923904679 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('705', '0', '2016-10-31 22:26:33', '2016-10-31 22:26:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '226', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('706', '0', '2016-10-31 22:26:33', '2016-10-31 22:26:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '270',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('707', '0', '2016-10-31 22:26:35', '2016-10-31 22:26:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477923904682 | ', 'system/data', '2',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('708', '0', '2016-10-31 22:26:35', '2016-10-31 22:26:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '17', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('709', '0', '2016-10-31 22:26:35', '2016-10-31 22:26:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('710', '0', '2016-10-31 22:26:35', '2016-10-31 22:26:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477923904685 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('711', '0', '2016-10-31 22:26:35', '2016-10-31 22:26:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '11', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('712', '0', '2016-10-31 22:26:58', '2016-10-31 22:26:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://localhost:8080/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('713', '0', '2016-10-31 22:27:00', '2016-10-31 22:27:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477924018863 | ', 'system/user', '1',
   'http://localhost:8080/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('714', '0', '2016-10-31 22:27:00', '2016-10-31 22:27:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '118', 'http://localhost:8080/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('715', '0', '2016-10-31 22:27:00', '2016-10-31 22:27:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '32',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('716', '0', '2016-10-31 22:27:01', '2016-10-31 22:27:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '190', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('717', '0', '2016-10-31 22:27:03', '2016-10-31 22:27:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477924018866 | ', 'system/permission', '1',
   'http://localhost:8080/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('718', '0', '2016-10-31 22:27:03', '2016-10-31 22:27:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '26',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('719', '0', '2016-10-31 22:27:03', '2016-10-31 22:27:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('720', '0', '2016-10-31 22:27:07', '2016-10-31 22:27:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477924018869 | ', 'system/job', '0',
   'http://localhost:8080/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('721', '0', '2016-10-31 22:27:07', '2016-10-31 22:27:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '54', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('722', '0', '2016-10-31 22:27:08', '2016-10-31 22:27:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '161', 'http://localhost:8080/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('723', '0', '2016-10-31 22:27:08', '2016-10-31 22:27:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '236', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('724', '0', '2016-10-31 22:27:08', '2016-10-31 22:27:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '126', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('725', '0', '2016-10-31 22:27:08', '2016-10-31 22:27:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477924018872 | ', 'system/organization', '1',
   'http://localhost:8080/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('726', '0', '2016-10-31 22:27:08', '2016-10-31 22:27:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '41', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('727', '0', '2016-10-31 22:27:08', '2016-10-31 22:27:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '32', 'http://localhost:8080/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('728', '0', '2016-10-31 22:27:09', '2016-10-31 22:27:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477924018875 | ', 'system/role', '1',
   'http://localhost:8080/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('729', '0', '2016-10-31 22:27:09', '2016-10-31 22:27:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '68',
   'http://localhost:8080/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('730', '0', '2016-10-31 22:27:09', '2016-10-31 22:27:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '179', 'http://localhost:8080/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('731', '0', '2016-10-31 22:27:10', '2016-10-31 22:27:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477924018878 | ', 'system/data', '1',
   'http://localhost:8080/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('732', '0', '2016-10-31 22:27:10', '2016-10-31 22:27:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '17', 'http://localhost:8080/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('733', '0', '2016-10-31 22:27:10', '2016-10-31 22:27:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '4', 'http://localhost:8080/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('734', '0', '2016-10-31 22:27:10', '2016-10-31 22:27:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.online', '_ = 1477924018881 | ', 'system/online', '1',
   'http://localhost:8080/system/online',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('735', '0', '2016-10-31 22:27:10', '2016-10-31 22:27:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.onlineList', 'page = 1 | rows = 15 | ',
   'PageInfo{total=1, rows=Page{count=true, pageNum=1, pageSize=15, startRow=0, endRow=15, total=1, pages=1, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '10', 'http://localhost:8080/system/online/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('736', '0', '2016-10-31 22:27:11', '2016-10-31 22:27:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477924018884 | ', 'system/log', '2',
   'http://localhost:8080/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('737', '0', '2016-10-31 22:27:11', '2016-10-31 22:27:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=736, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=736, pages=25, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '18', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('738', '0', '2016-10-31 22:27:15', '2016-10-31 22:27:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 25 | rows = 30 | ',
   'PageInfo{total=737, rows=Page{count=true, pageNum=25, pageSize=30, startRow=720, endRow=750, total=737, pages=25, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '20', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('739', '0', '2016-10-31 22:27:17', '2016-10-31 22:27:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 25 | rows = 30 | ',
   'PageInfo{total=738, rows=Page{count=true, pageNum=25, pageSize=30, startRow=720, endRow=750, total=738, pages=25, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '13', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('740', '0', '2016-10-31 22:27:19', '2016-10-31 22:27:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=739, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=739, pages=25, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '21', 'http://localhost:8080/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('741', '0', '2016-10-31 22:28:59', '2016-10-31 22:28:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924138451 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"abf5e0ed0699630530f3ec63b24c6862\"}',
   '548', 'http://localhost:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('742', '0', '2016-10-31 22:29:09', '2016-10-31 22:29:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924149798 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"273690103a64993a04e70fb9a6633761\"}',
   '110', 'http://localhost:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('743', '0', '2016-10-31 22:29:22', '2016-10-31 22:29:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '112', 'http://localhost:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('744', '0', '2016-10-31 22:29:29', '2016-10-31 22:29:29', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '9', 'http://localhost:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('745', '0', '2016-10-31 22:30:00', '2016-10-31 22:30:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '32', 'http://localhost:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('746', '0', '2016-10-31 22:32:06', '2016-10-31 22:32:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '14', 'http://localhost:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('747', '0', '2016-10-31 22:32:56', '2016-10-31 22:32:56', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '9', 'http://localhost:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('748', '0', '2016-10-31 22:33:51', '2016-10-31 22:33:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924431362 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"7fc55da0601aaa5b09a113f9573a140d\"}',
   '125', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('749', '0', '2016-10-31 22:34:00', '2016-10-31 22:34:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '9', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('750', '0', '2016-10-31 22:35:53', '2016-10-31 22:35:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '8', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('751', '0', '2016-10-31 22:36:16', '2016-10-31 22:36:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '10', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('752', '0', '2016-10-31 22:36:45', '2016-10-31 22:36:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'1\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Sat Oct 29 15:06:05 CST 2016\', updateTime=\'Sat Oct 29 15:06:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '572', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('753', '0', '2016-10-31 22:36:45', '2016-10-31 22:36:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('754', '0', '2016-10-31 22:36:49', '2016-10-31 22:36:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924609262 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"b295597506e266e39211d2e69f6afc1f\"}',
   '103', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('755', '0', '2016-10-31 22:36:51', '2016-10-31 22:36:51', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924611322 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"6f36efdf255cbbed388b9323f88a511f\"}',
   '66', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('756', '0', '2016-10-31 22:37:47', '2016-10-31 22:37:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924667621 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"4ee50b05fea8d907a469bb090b22b137\"}',
   '110', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('757', '0', '2016-10-31 22:37:50', '2016-10-31 22:37:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924670022 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"626b9d3b315ac78061fd1e3ef146b442\"}',
   '100', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('758', '0', '2016-10-31 22:37:59', '2016-10-31 22:37:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '12', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('759', '0', '2016-10-31 22:38:02', '2016-10-31 22:38:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '8', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('760', '0', '2016-10-31 22:38:13', '2016-10-31 22:38:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '7', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('761', '0', '2016-10-31 22:38:26', '2016-10-31 22:38:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '14', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('762', '0', '2016-10-31 22:38:57', '2016-10-31 22:38:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924737299 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"0e64c42e6579d1b8afd92d1981bb9cb4\"}',
   '108', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('763', '0', '2016-10-31 22:39:09', '2016-10-31 22:39:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '7', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('764', '0', '2016-10-31 22:41:52', '2016-10-31 22:41:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.StartCaptcha', 't = 1477924912632 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"8ccd112b2ea7558965e6d783ca7fd441\"}',
   '140', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('765', '0', '2016-10-31 22:43:42', '2016-10-31 22:43:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '9', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('766', '0', '2016-10-31 22:44:37', '2016-10-31 22:44:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '6', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('767', '0', '2016-10-31 22:45:28', '2016-10-31 22:45:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477925127636 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"89dbb1837598d9da0a79ba3d69044c8a\"}',
   '610', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('768', '0', '2016-10-31 22:45:38', '2016-10-31 22:45:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '6', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('769', '0', '2016-10-31 22:46:44', '2016-10-31 22:46:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '14', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('770', '0', '2016-10-31 22:46:53', '2016-10-31 22:46:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '19', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('771', '0', '2016-10-31 22:47:59', '2016-10-31 22:47:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477925278318 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"4af857d4ee621c13d49a88c992685223\"}',
   '454', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('772', '0', '2016-10-31 22:48:03', '2016-10-31 22:48:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477925283069 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"7a46855fdab09e4da2de6c0f99a915e4\"}',
   '95', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('773', '0', '2016-10-31 22:48:13', '2016-10-31 22:48:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '43', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('774', '0', '2016-10-31 22:50:49', '2016-10-31 22:50:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477925448140 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"dba1ced9ee864e360bf95fa1675a6153\"}',
   '310', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('775', '0', '2016-10-31 22:51:02', '2016-10-31 22:51:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=20004, msg=\'验证码错误,请重新刷新并滑动验证码!\', data=}', '15', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('776', '0', '2016-10-31 22:52:27', '2016-10-31 22:52:27', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477925547015 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"632e6eda528de176e485f955dbdd237c\"}',
   '127', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('777', '0', '2016-10-31 22:52:55', '2016-10-31 22:52:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477925574632 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"f0fcee4c0cb89354c8fdb4bf3c78837b\"}',
   '181', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('778', '0', '2016-10-31 22:53:05', '2016-10-31 22:53:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'1\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Sat Oct 29 15:06:05 CST 2016\', updateTime=\'Sat Oct 29 15:06:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '1194', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('779', '0', '2016-10-31 22:53:05', '2016-10-31 22:53:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '6', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('780', '0', '2016-10-31 22:53:14', '2016-10-31 22:53:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477925586354 | ', 'system/user', '49',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('781', '0', '2016-10-31 22:53:17', '2016-10-31 22:53:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '2144', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('782', '0', '2016-10-31 22:53:17', '2016-10-31 22:53:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '1051',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('783', '0', '2016-10-31 22:53:17', '2016-10-31 22:53:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '1244', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('784', '0', '2016-10-31 22:55:17', '2016-10-31 22:55:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.update',
          'id = 1 | loginName = admin | zhName = admin | enName = admin | sex = 1 | birth =  | email =  | phone =  | address =  | permissionIds = 1,2,3,4,5,31,32,33,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,35,36,37,38,44,45,34,39,40,41,42,43 | jobIds = 2 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '234', 'http://127.0.0.1:8086/user/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('785', '0', '2016-10-31 22:55:17', '2016-10-31 22:55:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '351', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('786', '0', '2016-10-31 22:56:15', '2016-10-31 22:56:15', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477925586357 | ', 'system/permission', '4',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('787', '0', '2016-10-31 22:56:16', '2016-10-31 22:56:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '240',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('788', '0', '2016-10-31 22:56:16', '2016-10-31 22:56:16', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '34', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('789', '0', '2016-10-31 23:06:04', '2016-10-31 23:06:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logout', NULL, 'Result{code=10000, msg=\'操作成功\', data=}', '61',
   'http://127.0.0.1:8086/system/logout',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('790', '0', '2016-10-31 23:06:05', '2016-10-31 23:06:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477926365150 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"edd3726bc6637bf0017bb5b2d9569047\"}',
   '143', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('791', '0', '2016-10-31 23:08:49', '2016-10-31 23:08:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477926528572 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"9e2b87855423aa314bbd1dbddf06a71f\"}',
   '303', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('792', '0', '2016-10-31 23:08:55', '2016-10-31 23:08:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'3\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:55:17 CST 2016\', updateTime=\'Mon Oct 31 22:55:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '608', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('793', '0', '2016-10-31 23:08:55', '2016-10-31 23:08:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '22',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('794', '0', '2016-10-31 23:09:22', '2016-10-31 23:09:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477926536522 | ', 'system/user', '60',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('795', '0', '2016-10-31 23:09:23', '2016-10-31 23:09:23', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '565', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('796', '0', '2016-10-31 23:09:23', '2016-10-31 23:09:23', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '443',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('797', '0', '2016-10-31 23:09:24', '2016-10-31 23:09:24', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '343', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('798', '0', '2016-10-31 23:09:42', '2016-10-31 23:09:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477926582180 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"1cd77e356138d07c40b9ace484e4c4f4\"}',
   '140', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('799', '0', '2016-10-31 23:09:44', '2016-10-31 23:09:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477926583931 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"81dfba462dc8b030988661b8758b4b76\"}',
   '97', 'http://localhost:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('800', '0', '2016-10-31 23:09:45', '2016-10-31 23:09:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477926585261 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"56070ef2b08d1dc795974be05a644191\"}',
   '88', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('801', '0', '2016-10-31 23:09:54', '2016-10-31 23:09:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'3\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:55:17 CST 2016\', updateTime=\'Mon Oct 31 22:55:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '288', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('802', '0', '2016-10-31 23:09:54', '2016-10-31 23:09:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '11',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('803', '0', '2016-10-31 23:09:57', '2016-10-31 23:09:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477926594741 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('804', '0', '2016-10-31 23:09:57', '2016-10-31 23:09:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '698', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('805', '0', '2016-10-31 23:09:58', '2016-10-31 23:09:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '104',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('806', '0', '2016-10-31 23:09:58', '2016-10-31 23:09:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '131', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('807', '0', '2016-10-31 23:10:00', '2016-10-31 23:10:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '134', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('808', '0', '2016-10-31 23:10:19', '2016-10-31 23:10:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477926594744 | ', 'system/role', '24',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('809', '0', '2016-10-31 23:10:19', '2016-10-31 23:10:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '81',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('810', '0', '2016-10-31 23:10:19', '2016-10-31 23:10:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '352', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('811', '0', '2016-10-31 23:10:32', '2016-10-31 23:10:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.update', 'id = 2 | name = 管理员 | description = 管理员 | permissionIds = 5 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '45', 'http://127.0.0.1:8086/role/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('812', '0', '2016-10-31 23:10:32', '2016-10-31 23:10:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '155', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('813', '0', '2016-10-31 23:10:36', '2016-10-31 23:10:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477926594747 | ', 'system/job', '3',
   'http://127.0.0.1:8086/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('814', '0', '2016-10-31 23:10:37', '2016-10-31 23:10:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '107', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('815', '0', '2016-10-31 23:10:37', '2016-10-31 23:10:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '228', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('816', '0', '2016-10-31 23:10:37', '2016-10-31 23:10:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '222', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('817', '0', '2016-10-31 23:10:37', '2016-10-31 23:10:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '519', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('818', '0', '2016-10-31 23:12:39', '2016-10-31 23:12:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('819', '0', '2016-10-31 23:13:11', '2016-10-31 23:13:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477926760490 | ', 'system/user', '24',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('820', '0', '2016-10-31 23:13:12', '2016-10-31 23:13:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '773', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('821', '0', '2016-10-31 23:13:13', '2016-10-31 23:13:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '126',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('822', '0', '2016-10-31 23:13:13', '2016-10-31 23:13:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '339', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('823', '0', '2016-10-31 23:14:42', '2016-10-31 23:14:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.update',
          'id = 2 | loginName = admin2 | zhName = admin2管理员 | enName = admin2 | sex = 1 | birth =  | email =  | phone =  | address =  | permissionIds =  | jobIds = 6 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '145', 'http://127.0.0.1:8086/user/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('824', '0', '2016-10-31 23:14:42', '2016-10-31 23:14:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '459', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('825', '0', '2016-10-31 23:15:01', '2016-10-31 23:15:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477926760493 | ', 'system/permission', '4',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('826', '0', '2016-10-31 23:15:02', '2016-10-31 23:15:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '28', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('827', '0', '2016-10-31 23:15:02', '2016-10-31 23:15:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '372',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('828', '0', '2016-10-31 23:15:04', '2016-10-31 23:15:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477926760496 | ', 'system/role', '3',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('829', '0', '2016-10-31 23:15:05', '2016-10-31 23:15:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '239',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('830', '0', '2016-10-31 23:15:05', '2016-10-31 23:15:05', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '392', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('831', '0', '2016-10-31 23:15:53', '2016-10-31 23:15:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477926953573 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"e6d180134394f4e8fe04ddc8c24c52e2\"}',
   '134', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('832', '0', '2016-10-31 23:16:12', '2016-10-31 23:16:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477926972693 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"dadabe8bd809da3a2d349cfceec449df\"}',
   '126', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('833', '0', '2016-10-31 23:16:32', '2016-10-31 23:16:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin2 | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 CST 2016\', updateTime=\'Mon Oct 31 23:14:42 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '67', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('834', '0', '2016-10-31 23:16:32', '2016-10-31 23:16:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '4', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('835', '0', '2016-10-31 23:16:43', '2016-10-31 23:16:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477926992249 | ', 'system/log', '3',
   'http://127.0.0.1:8086/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('836', '0', '2016-10-31 23:16:44', '2016-10-31 23:16:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=835, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=835, pages=28, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '133', 'http://127.0.0.1:8086/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('837', '0', '2016-10-31 23:16:54', '2016-10-31 23:16:54', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477926992254 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('838', '0', '2016-10-31 23:17:04', '2016-10-31 23:17:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('839', '0', '2016-10-31 23:17:08', '2016-10-31 23:17:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927025017 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('840', '0', '2016-10-31 23:18:37', '2016-10-31 23:18:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '248',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('841', '0', '2016-10-31 23:18:45', '2016-10-31 23:18:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('842', '0', '2016-10-31 23:18:47', '2016-10-31 23:18:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927125734 | ', 'system/user', '24',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('843', '0', '2016-10-31 23:18:48', '2016-10-31 23:18:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '755', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('844', '0', '2016-10-31 23:19:03', '2016-10-31 23:19:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927119290 | ', 'system/user', '3',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('845', '0', '2016-10-31 23:19:03', '2016-10-31 23:19:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '241', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('846', '0', '2016-10-31 23:20:28', '2016-10-31 23:20:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '10',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('847', '0', '2016-10-31 23:20:30', '2016-10-31 23:20:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927229125 | ', 'system/user', '4',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('848', '0', '2016-10-31 23:20:31', '2016-10-31 23:20:31', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '618', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('849', '0', '2016-10-31 23:20:35', '2016-10-31 23:20:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('850', '0', '2016-10-31 23:20:36', '2016-10-31 23:20:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927235178 | ', 'system/user', '3',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('851', '0', '2016-10-31 23:20:37', '2016-10-31 23:20:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '261', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('852', '0', '2016-10-31 23:20:42', '2016-10-31 23:20:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('853', '0', '2016-10-31 23:20:45', '2016-10-31 23:20:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927242868 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('854', '0', '2016-10-31 23:20:45', '2016-10-31 23:20:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '256', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('855', '0', '2016-10-31 23:21:30', '2016-10-31 23:21:30', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('856', '0', '2016-10-31 23:21:40', '2016-10-31 23:21:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927229128 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('857', '0', '2016-10-31 23:21:41', '2016-10-31 23:21:41', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '269', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('858', '0', '2016-10-31 23:21:52', '2016-10-31 23:21:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('859', '0', '2016-10-31 23:21:57', '2016-10-31 23:21:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927313084 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('860', '0', '2016-10-31 23:21:57', '2016-10-31 23:21:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '231', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('861', '0', '2016-10-31 23:22:00', '2016-10-31 23:22:00', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '142', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('862', '0', '2016-10-31 23:22:01', '2016-10-31 23:22:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '123', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('863', '0', '2016-10-31 23:22:01', '2016-10-31 23:22:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '110', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('864', '0', '2016-10-31 23:22:02', '2016-10-31 23:22:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '115', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('865', '0', '2016-10-31 23:22:02', '2016-10-31 23:22:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '133', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('866', '0', '2016-10-31 23:22:03', '2016-10-31 23:22:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '117', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('867', '0', '2016-10-31 23:22:03', '2016-10-31 23:22:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '116', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('868', '0', '2016-10-31 23:22:19', '2016-10-31 23:22:19', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('869', '0', '2016-10-31 23:22:21', '2016-10-31 23:22:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927339456 | ', 'system/user', '3',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('870', '0', '2016-10-31 23:22:21', '2016-10-31 23:22:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '146', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('871', '0', '2016-10-31 23:22:26', '2016-10-31 23:22:26', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('872', '0', '2016-10-31 23:22:28', '2016-10-31 23:22:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927346530 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('873', '0', '2016-10-31 23:22:28', '2016-10-31 23:22:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '141', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('874', '0', '2016-10-31 23:22:53', '2016-10-31 23:22:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477927346533 | ', 'system/data', '4',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('875', '0', '2016-10-31 23:22:58', '2016-10-31 23:22:58', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logout', NULL, 'Result{code=10000, msg=\'操作成功\', data=}', '24',
   'http://127.0.0.1:8086/system/logout',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('876', '0', '2016-10-31 23:22:59', '2016-10-31 23:22:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477927379220 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"f62b99817e0684024e8281cad0976ee0\"}',
   '142', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('877', '0', '2016-10-31 23:23:06', '2016-10-31 23:23:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'3\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:55:17 CST 2016\', updateTime=\'Mon Oct 31 22:55:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '487', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('878', '0', '2016-10-31 23:23:06', '2016-10-31 23:23:06', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('879', '0', '2016-10-31 23:23:07', '2016-10-31 23:23:07', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927386721 | ', 'system/user', '3',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('880', '0', '2016-10-31 23:23:08', '2016-10-31 23:23:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '267', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('881', '0', '2016-10-31 23:23:08', '2016-10-31 23:23:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '203',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('882', '0', '2016-10-31 23:23:08', '2016-10-31 23:23:08', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '228', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('883', '0', '2016-10-31 23:23:09', '2016-10-31 23:23:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '110', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('884', '0', '2016-10-31 23:23:09', '2016-10-31 23:23:09', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '89', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('885', '0', '2016-10-31 23:23:10', '2016-10-31 23:23:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '91', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('886', '0', '2016-10-31 23:23:10', '2016-10-31 23:23:10', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '93', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('887', '0', '2016-10-31 23:23:11', '2016-10-31 23:23:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '106', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('888', '0', '2016-10-31 23:23:11', '2016-10-31 23:23:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '107', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('889', '0', '2016-10-31 23:23:12', '2016-10-31 23:23:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '120', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('890', '0', '2016-10-31 23:23:12', '2016-10-31 23:23:12', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '93', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('891', '0', '2016-10-31 23:23:13', '2016-10-31 23:23:13', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '96', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('892', '0', '2016-10-31 23:23:17', '2016-10-31 23:23:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logout', NULL, 'Result{code=10000, msg=\'操作成功\', data=}', '10',
   'http://127.0.0.1:8086/system/logout',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('893', '0', '2016-10-31 23:23:18', '2016-10-31 23:23:18', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477927398093 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"2ca0fe81e21c27b79b4d23f04d27d967\"}',
   '117', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('894', '0', '2016-10-31 23:23:28', '2016-10-31 23:23:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin2 | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 CST 2016\', updateTime=\'Mon Oct 31 23:14:42 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '52', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('895', '0', '2016-10-31 23:23:28', '2016-10-31 23:23:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('896', '0', '2016-10-31 23:23:33', '2016-10-31 23:23:33', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927408401 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('897', '0', '2016-10-31 23:23:34', '2016-10-31 23:23:34', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '158', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('898', '0', '2016-10-31 23:23:43', '2016-10-31 23:23:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('899', '0', '2016-10-31 23:23:44', '2016-10-31 23:23:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927423211 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('900', '0', '2016-10-31 23:23:44', '2016-10-31 23:23:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '160', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('901', '0', '2016-10-31 23:23:57', '2016-10-31 23:23:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '5', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('902', '0', '2016-10-31 23:23:59', '2016-10-31 23:23:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927438091 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('903', '0', '2016-10-31 23:23:59', '2016-10-31 23:23:59', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '158', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('904', '0', '2016-10-31 23:24:28', '2016-10-31 23:24:28', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('905', '0', '2016-10-31 23:24:35', '2016-10-31 23:24:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('906', '0', '2016-10-31 23:24:36', '2016-10-31 23:24:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927475208 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('907', '0', '2016-10-31 23:24:36', '2016-10-31 23:24:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '161', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('908', '0', '2016-10-31 23:24:39', '2016-10-31 23:24:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477927475214 | ', 'system/data', '2',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('909', '0', '2016-10-31 23:24:40', '2016-10-31 23:24:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.log', '_ = 1477927475218 | ', 'system/log', '3',
   'http://127.0.0.1:8086/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('910', '0', '2016-10-31 23:24:41', '2016-10-31 23:24:41', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logList',
          'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=909, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=909, pages=31, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '37', 'http://127.0.0.1:8086/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('911', '0', '2016-10-31 23:24:43', '2016-10-31 23:24:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.logout', NULL, 'Result{code=10000, msg=\'操作成功\', data=}', '10',
   'http://127.0.0.1:8086/system/logout',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('912', '0', '2016-10-31 23:24:44', '2016-10-31 23:24:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477927484167 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"e7529c51ece17dd5a4b3e1b6dcb96bea\"}',
   '124', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('913', '0', '2016-10-31 23:24:52', '2016-10-31 23:24:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'3\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:55:17 CST 2016\', updateTime=\'Mon Oct 31 22:55:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '146', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('914', '0', '2016-10-31 23:24:52', '2016-10-31 23:24:52', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('915', '0', '2016-10-31 23:24:55', '2016-10-31 23:24:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477927438094 | ', 'system/organization',
   '18', 'http://127.0.0.1:8086/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('916', '0', '2016-10-31 23:24:55', '2016-10-31 23:24:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '61', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('917', '0', '2016-10-31 23:24:55', '2016-10-31 23:24:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '72', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('918', '0', '2016-10-31 23:24:57', '2016-10-31 23:24:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477927438097 | ', 'system/permission', '2',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('919', '0', '2016-10-31 23:24:57', '2016-10-31 23:24:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '90',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('920', '0', '2016-10-31 23:24:57', '2016-10-31 23:24:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '9', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('921', '0', '2016-10-31 23:29:21', '2016-10-31 23:29:21', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477927761131 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"e6b76a056c5a40f11b46b647e4f098b2\"}',
   '119', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('922', '0', '2016-10-31 23:30:25', '2016-10-31 23:30:25', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477927824897 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"f8a075880c77fc038f6567739d280b9e\"}',
   '142', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('923', '0', '2016-10-31 23:30:42', '2016-10-31 23:30:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'3\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:55:17 CST 2016\', updateTime=\'Mon Oct 31 22:55:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '133', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('924', '0', '2016-10-31 23:30:43', '2016-10-31 23:30:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('925', '0', '2016-10-31 23:30:45', '2016-10-31 23:30:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927843178 | ', 'system/user', '3',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('926', '0', '2016-10-31 23:30:45', '2016-10-31 23:30:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '167', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('927', '0', '2016-10-31 23:30:46', '2016-10-31 23:30:46', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '124',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('928', '0', '2016-10-31 23:30:46', '2016-10-31 23:30:46', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '192', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('929', '0', '2016-10-31 23:30:48', '2016-10-31 23:30:48', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477927843181 | ', 'system/role', '17',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('930', '0', '2016-10-31 23:30:49', '2016-10-31 23:30:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '122',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('931', '0', '2016-10-31 23:30:49', '2016-10-31 23:30:49', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '248', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('932', '0', '2016-10-31 23:31:17', '2016-10-31 23:31:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.update',
          'id = 2 | name = 管理员 | description = 管理员 | permissionIds = 5,10,15,20,25,30,43 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '94', 'http://127.0.0.1:8086/role/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('933', '0', '2016-10-31 23:31:17', '2016-10-31 23:31:17', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '133', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('934', '0', '2016-10-31 23:31:22', '2016-10-31 23:31:22', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.captcha', 't = 1477927882113 | ',
   '{\"success\":1,\"gt\":\"796c2461adf8051c835e4a758a6091f6\",\"challenge\":\"1208503f6c37fdb720d14e57ee52dc27\"}',
   '119', 'http://127.0.0.1:8086/system/captcha',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('935', '0', '2016-10-31 23:31:32', '2016-10-31 23:31:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.login', 'loginName = admin2 | password = 111111 | platform = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=LoginInfo{id=null, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', jobs=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 CST 2016\', updateTime=\'Mon Oct 31 23:14:42 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}], permissions=[]}}',
   '51', 'http://127.0.0.1:8086/system/login',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('936', '0', '2016-10-31 23:31:32', '2016-10-31 23:31:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('937', '0', '2016-10-31 23:31:35', '2016-10-31 23:31:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.organization', '_ = 1477927843184 | ', 'system/organization', '2',
   'http://127.0.0.1:8086/organization/organization',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('938', '0', '2016-10-31 23:31:35', '2016-10-31 23:31:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '36', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('939', '0', '2016-10-31 23:31:35', '2016-10-31 23:31:35', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '34', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('940', '0', '2016-10-31 23:31:36', '2016-10-31 23:31:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477927843187 | ', 'system/permission', '2',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('941', '0', '2016-10-31 23:31:36', '2016-10-31 23:31:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '54',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('942', '0', '2016-10-31 23:31:36', '2016-10-31 23:31:36', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '13', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('943', '0', '2016-10-31 23:31:37', '2016-10-31 23:31:37', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477927843190 | ', 'system/job', '2',
   'http://127.0.0.1:8086/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('944', '0', '2016-10-31 23:31:38', '2016-10-31 23:31:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '82', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('945', '0', '2016-10-31 23:31:38', '2016-10-31 23:31:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '161', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('946', '0', '2016-10-31 23:31:38', '2016-10-31 23:31:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '128', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('947', '0', '2016-10-31 23:31:38', '2016-10-31 23:31:38', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '331', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('948', '0', '2016-10-31 23:31:42', '2016-10-31 23:31:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927892991 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('949', '0', '2016-10-31 23:31:43', '2016-10-31 23:31:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '262', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('950', '0', '2016-10-31 23:31:43', '2016-10-31 23:31:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '172',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('951', '0', '2016-10-31 23:31:43', '2016-10-31 23:31:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '171', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('952', '0', '2016-10-31 23:32:01', '2016-10-31 23:32:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477927892994 | ', 'system/job', '3',
   'http://127.0.0.1:8086/job/job',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('953', '0', '2016-10-31 23:32:01', '2016-10-31 23:32:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '54', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('954', '0', '2016-10-31 23:32:01', '2016-10-31 23:32:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '109', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('955', '0', '2016-10-31 23:32:01', '2016-10-31 23:32:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '164', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('956', '0', '2016-10-31 23:32:01', '2016-10-31 23:32:01', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '241', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('957', '0', '2016-10-31 23:32:14', '2016-10-31 23:32:14', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('958', '0', '2016-10-31 23:32:39', '2016-10-31 23:32:39', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.job', '_ = 1477927934834 | ', 'system/job', '2',
   'http://127.0.0.1:8086/job/job',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('959', '0', '2016-10-31 23:32:40', '2016-10-31 23:32:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '75', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('960', '0', '2016-10-31 23:32:40', '2016-10-31 23:32:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '113', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('961', '0', '2016-10-31 23:32:40', '2016-10-31 23:32:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '120', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('962', '0', '2016-10-31 23:32:40', '2016-10-31 23:32:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '276', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('963', '0', '2016-10-31 23:32:40', '2016-10-31 23:32:40', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.user', '_ = 1477927934837 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('964', '0', '2016-10-31 23:32:41', '2016-10-31 23:32:41', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.UserController.select',
          'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '172', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('965', '0', '2016-10-31 23:32:41', '2016-10-31 23:32:41', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '84',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('966', '0', '2016-10-31 23:32:41', '2016-10-31 23:32:41', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '77', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('967', '0', '2016-10-31 23:32:43', '2016-10-31 23:32:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477927934840 | ', 'system/data', '2',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('968', '0', '2016-10-31 23:32:44', '2016-10-31 23:32:44', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '61', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('969', '0', '2016-10-31 23:33:02', '2016-10-31 23:33:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477927934843 | ', 'system/permission', '3',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('970', '0', '2016-10-31 23:33:02', '2016-10-31 23:33:02', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '46',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('971', '0', '2016-10-31 23:33:11', '2016-10-31 23:33:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477927843193 | ', 'system/role', '2',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('972', '0', '2016-10-31 23:33:11', '2016-10-31 23:33:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '126', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('973', '0', '2016-10-31 23:33:11', '2016-10-31 23:33:11', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '67',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('974', '0', '2016-10-31 23:33:32', '2016-10-31 23:33:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.update',
          'id = 2 | name = 管理员 | description = 管理员 | permissionIds = 5,10,15,20,25,30,43,38,44 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '57', 'http://127.0.0.1:8086/role/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('975', '0', '2016-10-31 23:33:32', '2016-10-31 23:33:32', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '113', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('976', '0', '2016-10-31 23:33:41', '2016-10-31 23:33:41', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '3', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('977', '0', '2016-10-31 23:33:42', '2016-10-31 23:33:42', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.role', '_ = 1477928021718 | ', 'system/role', '2',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('978', '0', '2016-10-31 23:33:43', '2016-10-31 23:33:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '94',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('979', '0', '2016-10-31 23:33:43', '2016-10-31 23:33:43', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '223', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('980', '0', '2016-10-31 23:33:45', '2016-10-31 23:33:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477928021721 | ', 'system/data', '2',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('981', '0', '2016-10-31 23:33:45', '2016-10-31 23:33:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '22', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('982', '0', '2016-10-31 23:33:45', '2016-10-31 23:33:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '9', 'http://127.0.0.1:8086/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('983', '0', '2016-10-31 23:33:55', '2016-10-31 23:33:55', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('984', '0', '2016-10-31 23:33:57', '2016-10-31 23:33:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477928035838 | ', 'system/permission', '2',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('985', '0', '2016-10-31 23:33:57', '2016-10-31 23:33:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '48',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('986', '0', '2016-10-31 23:33:57', '2016-10-31 23:33:57', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '7', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('987', '0', '2016-10-31 23:34:03', '2016-10-31 23:34:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477928035841 | ', 'system/data', '2',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('988', '0', '2016-10-31 23:34:03', '2016-10-31 23:34:03', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '17', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('989', '0', '2016-10-31 23:34:04', '2016-10-31 23:34:04', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '8', 'http://127.0.0.1:8086/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('990', '0', '2016-10-31 23:34:45', '2016-10-31 23:34:45', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.data', '_ = 1477927843196 | ', 'system/data', '2',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('991', '0', '2016-10-31 23:34:46', '2016-10-31 23:34:46', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '16', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('992', '0', '2016-10-31 23:34:46', '2016-10-31 23:34:46', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '9', 'http://127.0.0.1:8086/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('993', '0', '2016-10-31 23:34:47', '2016-10-31 23:34:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477927843199 | ', 'system/permission', '2',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('994', '0', '2016-10-31 23:34:47', '2016-10-31 23:34:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '42',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('995', '0', '2016-10-31 23:34:47', '2016-10-31 23:34:47', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '7', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('996', '0', '2016-10-31 23:35:50', '2016-10-31 23:35:50', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.SystemController.index', NULL, 'system/index', '2', 'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('997', '0', '2016-10-31 23:35:53', '2016-10-31 23:35:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.permission', '_ = 1477928150442 | ', 'system/permission', '2',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('998', '0', '2016-10-31 23:35:53', '2016-10-31 23:35:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '42',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('999', '0', '2016-10-31 23:35:53', '2016-10-31 23:35:53', '0', '0', '1', '127.0.0.1', NULL,
          'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '14', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1000', '0', '2016-10-31 23:35:56', '2016-10-31 23:35:56', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.update',
           'id = 1 | name = 新增 | code = user:insert | description = 新增用户 | groupId = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '26', 'http://127.0.0.1:8086/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1001', '0', '2016-10-31 23:35:56', '2016-10-31 23:35:56', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '40',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1002', '0', '2016-10-31 23:35:59', '2016-10-31 23:35:59', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.update',
           'id = 5 | name = 列表 | code = user:list | description = 查询用户列表 | groupId = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '27', 'http://127.0.0.1:8086/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1003', '0', '2016-10-31 23:35:59', '2016-10-31 23:35:59', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '46',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1004', '0', '2016-10-31 23:36:04', '2016-10-31 23:36:04', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.update',
           'id = 32 | name = 禁用 | code = user:forbidden | description = 禁用用户 | groupId = 1 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '23', 'http://127.0.0.1:8086/permission/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1005', '0', '2016-10-31 23:36:04', '2016-10-31 23:36:04', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '42',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1006', '0', '2016-10-31 23:37:06', '2016-10-31 23:37:06', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '3',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1007', '0', '2016-10-31 23:37:09', '2016-10-31 23:37:09', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '27', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1008', '0', '2016-10-31 23:37:10', '2016-10-31 23:37:10', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '30', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1009', '0', '2016-10-31 23:39:08', '2016-10-31 23:39:08', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1010', '0', '2016-10-31 23:39:09', '2016-10-31 23:39:09', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.data', '_ = 1477928348796 | ', 'system/data', '2',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1011', '0', '2016-10-31 23:39:09', '2016-10-31 23:39:09', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '34', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1012', '0', '2016-10-31 23:39:10', '2016-10-31 23:39:10', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '51', 'http://127.0.0.1:8086/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1013', '0', '2016-10-31 23:44:00', '2016-10-31 23:44:00', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '5',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1014', '0', '2016-10-31 23:44:05', '2016-10-31 23:44:05', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.job', '_ = 1477928641744 | ', 'system/job', '2',
   'http://127.0.0.1:8086/job/job',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1015', '0', '2016-10-31 23:44:05', '2016-10-31 23:44:05', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '69', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1016', '0', '2016-10-31 23:44:06', '2016-10-31 23:44:06', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '207', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1017', '0', '2016-10-31 23:44:06', '2016-10-31 23:44:06', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '449', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1018', '0', '2016-10-31 23:44:06', '2016-10-31 23:44:06', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '604', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1019', '0', '2016-10-31 23:44:07', '2016-10-31 23:44:07', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.role', '_ = 1477928641747 | ', 'system/role', '2',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1020', '0', '2016-10-31 23:44:07', '2016-10-31 23:44:07', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '92',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1021', '0', '2016-10-31 23:44:08', '2016-10-31 23:44:08', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '326', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1022', '0', '2016-10-31 23:44:28', '2016-10-31 23:44:28', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1023', '0', '2016-10-31 23:44:31', '2016-10-31 23:44:31', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.role', '_ = 1477928150445 | ', 'system/role', '2',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1024', '0', '2016-10-31 23:44:31', '2016-10-31 23:44:31', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '164', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1025', '0', '2016-10-31 23:44:31', '2016-10-31 23:44:31', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '89',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1026', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:42', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.update',
           'id = 2 | name = 管理员 | description = 管理员 | permissionIds = 5,10,15,20,25,30,43,38,44,36 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '56', 'http://127.0.0.1:8086/role/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1027', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:42', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '147', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1028', '0', '2016-10-31 23:44:43', '2016-10-31 23:44:43', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1029', '0', '2016-10-31 23:44:54', '2016-10-31 23:44:54', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.update',
           'id = 2 | name = 管理员 | description = 管理员 | permissionIds = 5,10,15,20,25,30,43,38,44,36,34 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '54', 'http://127.0.0.1:8086/role/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1030', '0', '2016-10-31 23:44:54', '2016-10-31 23:44:54', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '146', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1031', '0', '2016-10-31 23:44:57', '2016-10-31 23:44:57', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '3',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1032', '0', '2016-10-31 23:44:59', '2016-10-31 23:44:59', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.ip', '_ = 1477928697365 | ', 'system/ip', '3',
   'http://127.0.0.1:8086/system/ip',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1033', '0', '2016-10-31 23:45:00', '2016-10-31 23:45:00', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.ipSelect', 'page = 1 | rows = 30 | ',
   'PageInfo{total=0, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=0, pages=0, countSignal=true, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '18', 'http://127.0.0.1:8086/system/ip/list',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1034', '0', '2016-10-31 23:45:01', '2016-10-31 23:45:01', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1035', '0', '2016-10-31 23:45:21', '2016-10-31 23:45:21', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1036', '0', '2016-10-31 23:45:23', '2016-10-31 23:45:23', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1037', '0', '2016-10-31 23:45:28', '2016-10-31 23:45:28', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.user', '_ = 1477928723743 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1038', '0', '2016-10-31 23:45:29', '2016-10-31 23:45:29', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.select',
           'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '163', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1039', '0', '2016-10-31 23:45:29', '2016-10-31 23:45:29', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '530',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1040', '0', '2016-10-31 23:45:30', '2016-10-31 23:45:30', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '228', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1041', '0', '2016-10-31 23:45:30', '2016-10-31 23:45:30', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.job', '_ = 1477928723746 | ', 'system/job', '2',
   'http://127.0.0.1:8086/job/job',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1042', '0', '2016-10-31 23:45:30', '2016-10-31 23:45:30', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '107', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1043', '0', '2016-10-31 23:45:30', '2016-10-31 23:45:30', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.OrganizationController.select', NULL,
   'PageInfo{total=7, rows=[SysOrganizationTree{id=1, name=\'系统\', fullName=\'系统\', description=\'系统\', isFinal=1, parentId=0, rank=0, createTime=Sat Oct 29 14:21:13 CST 2016, updateTime=Sat Oct 29 14:21:13 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=2, name=\'xxx集团\', fullName=\'xxx集团\', description=\'xxx集团\', isFinal=1, parentId=1, rank=0, createTime=Sat Oct 29 14:21:34 CST 2016, updateTime=Sat Oct 29 15:00:28 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=3, name=\'xxx深圳分公司\', fullName=\'xxx深圳分公司\', description=\'xxx深圳分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:26:27 CST 2016, updateTime=Sat Oct 29 14:26:27 CST 2016, createBy=0, updateBy=0, status=1, children=[SysOrganizationTree{id=5, name=\'财务部\', fullName=\'xxx深圳分公司财务部\', description=\'xxx深圳分公司财务部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:27:42 CST 2016, updateTime=Sat Oct 29 14:27:42 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=6, name=\'研发部\', fullName=\'xxx深圳分公司研发部\', description=\'xxx深圳分公司研发部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:38 CST 2016, updateTime=Sat Oct 29 14:28:38 CST 2016, createBy=0, updateBy=0, status=1, children=[]}, SysOrganizationTree{id=7, name=\'市场部\', fullName=\'xxx深圳分公司市场部\', description=\'xxx深圳分公司市场部\', isFinal=1, parentId=3, rank=0, createTime=Sat Oct 29 14:28:49 CST 2016, updateTime=Sat Oct 29 14:28:49 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}, SysOrganizationTree{id=4, name=\'xxx长沙分公司\', fullName=\'xxx长沙分公司\', description=\'xxx长沙分公司\', isFinal=1, parentId=2, rank=0, createTime=Sat Oct 29 14:27:18 CST 2016, updateTime=Sat Oct 29 14:27:18 CST 2016, createBy=0, updateBy=0, status=1, children=[]}]}]}]}',
   '92', 'http://127.0.0.1:8086/organization/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1044', '0', '2016-10-31 23:45:30', '2016-10-31 23:45:30', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '194', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1045', '0', '2016-10-31 23:45:30', '2016-10-31 23:45:30', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '390', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1046', '0', '2016-10-31 23:45:40', '2016-10-31 23:45:40', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '3',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1047', '0', '2016-10-31 23:47:32', '2016-10-31 23:47:32', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.data', '_ = 1477928740608 | ', 'system/data', '3',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1048', '0', '2016-10-31 23:47:32', '2016-10-31 23:47:32', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '26', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1049', '0', '2016-10-31 23:47:33', '2016-10-31 23:47:33', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '11', 'http://127.0.0.1:8086/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1050', '0', '2016-10-31 23:47:34', '2016-10-31 23:47:34', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.permission', '_ = 1477928740611 | ', 'system/permission', '3',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1051', '0', '2016-10-31 23:47:34', '2016-10-31 23:47:34', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '47',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1052', '0', '2016-10-31 23:47:34', '2016-10-31 23:47:34', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '8', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1053', '0', '2016-10-31 23:47:47', '2016-10-31 23:47:47', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.insertGroup', 'name = 日志 | description = 日志 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '32', 'http://127.0.0.1:8086/permission/group/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1054', '0', '2016-10-31 23:47:48', '2016-10-31 23:47:48', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '360',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1055', '0', '2016-10-31 23:47:51', '2016-10-31 23:47:51', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1056', '0', '2016-10-31 23:47:53', '2016-10-31 23:47:53', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.permission', '_ = 1477928871961 | ', 'system/permission', '2',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1057', '0', '2016-10-31 23:47:53', '2016-10-31 23:47:53', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '56',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1058', '0', '2016-10-31 23:47:54', '2016-10-31 23:47:54', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'9\', name=\'日志\', description=\'日志\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 23:47:47 CST 2016\', updateTime=\'Mon Oct 31 23:47:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '21', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1059', '0', '2016-10-31 23:48:03', '2016-10-31 23:48:03', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.log', '_ = 1477928871964 | ', 'system/log', '2',
   'http://127.0.0.1:8086/system/log',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1060', '0', '2016-10-31 23:48:03', '2016-10-31 23:48:03', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.logList',
           'method =  | url =  | param =  | result =  | page = 1 | rows = 30 | ',
   'PageInfo{total=1059, rows=Page{count=true, pageNum=1, pageSize=30, startRow=0, endRow=30, total=1059, pages=36, countSignal=false, orderBy=\'null\', orderByOnly=false, reasonable=false, pageSizeZero=false}}',
   '20', 'http://127.0.0.1:8086/system/log/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1061', '0', '2016-10-31 23:48:28', '2016-10-31 23:48:28', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.data', '_ = 1477928871967 | ', 'system/data', '2',
   'http://127.0.0.1:8086/system/data',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1062', '0', '2016-10-31 23:48:29', '2016-10-31 23:48:29', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataList', 'page = 1 | rows = 25 | ',
   'PageInfo{total=3, rows=[SysDataItemDto{id=1, description=\'geetest_id\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'796c2461adf8051c835e4a758a6091f6\', keyName=\'geetest_id\', isFinal=1, rank=0, createTime=Mon Oct 31 22:08:48 CST 2016, updateTime=Mon Oct 31 22:08:48 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=2, description=\'geetest_key\', sysDataGroupId=1, sysDataGroupName=\'极限验证\', keyValue=\'0edad631bed761ab039d8391dd3103ff\', keyName=\'geetest_key\', isFinal=1, rank=0, createTime=Mon Oct 31 22:09:19 CST 2016, updateTime=Mon Oct 31 22:09:19 CST 2016, createBy=0, updateBy=0, status=1}, SysDataItemDto{id=3, description=\'是否输出错误日志详情\', sysDataGroupId=2, sysDataGroupName=\'日志\', keyValue=\'true\', keyName=\'error_detail\', isFinal=1, rank=0, createTime=Mon Oct 31 22:10:21 CST 2016, updateTime=Mon Oct 31 22:10:21 CST 2016, createBy=0, updateBy=0, status=1}]}',
   '17', 'http://127.0.0.1:8086/system/data/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1063', '0', '2016-10-31 23:48:29', '2016-10-31 23:48:29', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.dataGroupList', NULL,
   '[SysDataGroup{id=\'1\', description=\'极限验证\', parentId=\'0\', name=\'极限验证\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:08:28 CST 2016\', updateTime=\'Mon Oct 31 22:08:28 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysDataGroup{id=\'2\', description=\'日志输出控制\', parentId=\'0\', name=\'日志\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 22:09:38 CST 2016\', updateTime=\'Mon Oct 31 22:09:38 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '90', 'http://127.0.0.1:8086/system/dataGroup/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1064', '0', '2016-10-31 23:48:43', '2016-10-31 23:48:43', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.insert',
           'name = 列表 | code = log:list | description = 列表 | groupId = 9 | ',
   'Result{code=10000, msg=\'操作成功\', data=1}', '27', 'http://127.0.0.1:8086/permission/insert',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1065', '0', '2016-10-31 23:48:43', '2016-10-31 23:48:43', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '57',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1066', '0', '2016-10-31 23:48:46', '2016-10-31 23:48:46', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.user', '_ = 1477928871970 | ', 'system/user', '3',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1067', '0', '2016-10-31 23:48:46', '2016-10-31 23:48:46', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.select',
           'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '202', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1068', '0', '2016-10-31 23:48:46', '2016-10-31 23:48:46', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '93',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1069', '0', '2016-10-31 23:48:47', '2016-10-31 23:48:47', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '217', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1070', '0', '2016-10-31 23:48:56', '2016-10-31 23:48:56', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '2',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1071', '0', '2016-10-31 23:48:58', '2016-10-31 23:48:58', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.role', '_ = 1477928936536 | ', 'system/role', '3',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1072', '0', '2016-10-31 23:48:58', '2016-10-31 23:48:58', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '175', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1073', '0', '2016-10-31 23:48:58', '2016-10-31 23:48:58', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '88',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1074', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.update',
           'id = 1 | name = 超级管理员 | description = 超级管理员 | permissionIds = 1,2,3,4,5,31,32,33,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,35,36,37,38,44,45,34,39,40,41,42,43,46 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '116', 'http://127.0.0.1:8086/role/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1075', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '166', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1076', '0', '2016-10-31 23:49:06', '2016-10-31 23:49:06', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.user', '_ = 1477928936539 | ', 'system/user', '2',
   'http://127.0.0.1:8086/user/user',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1077', '0', '2016-10-31 23:49:06', '2016-10-31 23:49:06', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.select',
           'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ', 'data is too long',
   '278', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1078', '0', '2016-10-31 23:49:07', '2016-10-31 23:49:07', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '210',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1079', '0', '2016-10-31 23:49:07', '2016-10-31 23:49:07', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.JobController.select', NULL,
   'PageInfo{total=6, rows=[SysRoleOrganizationTree{id=1, sysOrganizationId=0, sysRoleId=0, parentId=0, name=\'系统\', fullName=\'系统\', description=\'系统\', rank=0, createTime=Sat Oct 29 14:53:47 CST 2016, updateTime=Sat Oct 29 14:53:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=null, sysOrganizationName=\'null\', sysRoleName=\'null\', parentName=\'null\', children=[SysRoleOrganizationTree{id=2, sysOrganizationId=2, sysRoleId=1, parentId=1, name=\'系统超级管理员\', fullName=\'系统超级管理员\', description=\'系统超级管理员\', rank=0, createTime=Sat Oct 29 14:54:22 CST 2016, updateTime=Sat Oct 29 14:54:22 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'超级管理员\', parentName=\'null\', children=[SysRoleOrganizationTree{id=6, sysOrganizationId=2, sysRoleId=2, parentId=2, name=\'系统管理员\', fullName=\'系统管理员\', description=\'系统管理员\', rank=0, createTime=Sat Oct 29 15:07:01 CST 2016, updateTime=Sat Oct 29 15:07:01 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'管理员\', parentName=\'null\', children=[]}]}, SysRoleOrganizationTree{id=3, sysOrganizationId=2, sysRoleId=5, parentId=1, name=\'集团总经理\', fullName=\'集团总经理\', description=\'集团总经理\', rank=0, createTime=Sat Oct 29 15:01:06 CST 2016, updateTime=Sat Oct 29 15:01:06 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx集团\', sysRoleName=\'集团总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=4, sysOrganizationId=3, sysRoleId=3, parentId=3, name=\'深圳分公司总经理\', fullName=\'xxx深圳分公司总经理\', description=\'xxx深圳分公司总经理\', rank=0, createTime=Sat Oct 29 15:01:47 CST 2016, updateTime=Sat Oct 29 15:01:47 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'xxx深圳分公司\', sysRoleName=\'分公司总经理\', parentName=\'null\', children=[SysRoleOrganizationTree{id=5, sysOrganizationId=6, sysRoleId=4, parentId=4, name=\'xxx深圳分公司研发部经理\', fullName=\'xxx深圳分公司研发部经理\', description=\'xxx深圳分公司研发部经理\', rank=0, createTime=Sat Oct 29 15:02:56 CST 2016, updateTime=Sat Oct 29 15:02:56 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, sysOrganizationName=\'研发部\', sysRoleName=\'分公司部门经理\', parentName=\'null\', children=[]}]}]}]}]}',
   '77', 'http://127.0.0.1:8086/job/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1080', '0', '2016-10-31 23:49:14', '2016-10-31 23:49:14', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.update',
           'id = 1 | loginName = admin | zhName = admin | enName = admin | sex = 1 | birth =  | email =  | phone =  | address =  | permissionIds =  | jobIds = 2 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '43', 'http://127.0.0.1:8086/user/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1081', '0', '2016-10-31 23:49:14', '2016-10-31 23:49:14', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.UserController.select',
           'loginName =  | zhName =  | email =  | phone =  | address =  | page = 1 | rows = 15 | ',
   'PageInfo{total=2, rows=[SysUserDto{id=1, loginName=\'admin\', zhName=\'admin\', enName=\'admin\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:06:05 CST 2016, updateTime=Sat Oct 29 15:06:05 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'7\', sysUserId=\'1\', sysRoleOrganizationId=\'2\', rank=\'0\', createTime=\'Mon Oct 31 23:49:14 CST 2016\', updateTime=\'Mon Oct 31 23:49:14 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}]}, SysUserDto{id=2, loginName=\'admin2\', zhName=\'admin2管理员\', enName=\'admin2\', sex=1, birth=\'null\', email=\'null\', phone=\'null\', address=\'null\', password=\'\', passwordSalt=\'\', rank=0, createTime=Sat Oct 29 15:07:39 CST 2016, updateTime=Sat Oct 29 15:07:39 CST 2016, createBy=0, updateBy=0, status=1, isFinal=1, permissions=[], userRoleOrganizations=[SysUserRoleOrganization{id=\'6\', sysUserId=\'2\', sysRoleOrganizationId=\'6\', rank=\'0\', createTime=\'Mon Oct 31 23:14:42 CST 2016\', updateTime=\'Mon Oct 31 23:14:42 CST 2016\', createBy=\'0\', updateBy=\'0\', status=\'1\', isFinal=1}]}]}',
   '20', 'http://127.0.0.1:8086/user/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1082', '0', '2016-10-31 23:49:52', '2016-10-31 23:49:52', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '8',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1083', '0', '2016-10-31 23:50:01', '2016-10-31 23:50:01', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '11',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1084', '0', '2016-10-31 23:50:08', '2016-10-31 23:50:08', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.role', '_ = 1477928993653 | ', 'system/role', '4',
   'http://127.0.0.1:8086/role/role',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1085', '0', '2016-10-31 23:50:11', '2016-10-31 23:50:11', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '1734',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1086', '0', '2016-10-31 23:50:11', '2016-10-31 23:50:11', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '2371', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1087', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.update',
           'id = 2 | name = 管理员 | description = 管理员 | permissionIds = 5,10,15,20,25,30,43,38,44,36,34,46 | ',
   'Result{code=10000, msg=\'操作成功\', data=}', '139', 'http://127.0.0.1:8086/role/update',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1088', '0', '2016-10-31 23:50:18', '2016-10-31 23:50:18', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.RoleController.select', NULL,
   'PageInfo{total=5, rows=[SysRole{id=\'1\', description=\'超级管理员\', name=\'超级管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:18:43 CST 2016\', updateTime=\'Sat Oct 29 14:18:43 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'2\', description=\'管理员\', name=\'管理员\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:19:05 CST 2016\', updateTime=\'Sat Oct 29 14:19:05 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'3\', description=\'分公司总经理\', name=\'分公司总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:36:24 CST 2016\', updateTime=\'Sat Oct 29 14:36:24 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'4\', description=\'分公司部门经理\', name=\'分公司部门经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:37:46 CST 2016\', updateTime=\'Sat Oct 29 14:37:46 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysRole{id=\'5\', description=\'集团总经理\', name=\'集团总经理\', rank=\'0\', isFinal=\'1\', createTime=\'Sat Oct 29 14:59:17 CST 2016\', updateTime=\'Sat Oct 29 14:59:17 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]}',
   '744', 'http://127.0.0.1:8086/role/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1089', '0', '2016-10-31 23:50:19', '2016-10-31 23:50:19', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.SystemController.index', NULL, 'system/index', '5',
   'http://127.0.0.1:8086/system/index',
   'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1090', '0', '2016-10-31 23:50:51', '2016-10-31 23:50:51', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.permission', '_ = 1477928993656 | ', 'system/permission', '3',
   'http://127.0.0.1:8086/permission/permission',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1091', '0', '2016-10-31 23:50:51', '2016-10-31 23:50:51', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.select', NULL, 'data is too long', '263',
   'http://127.0.0.1:8086/permission/select',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');
INSERT INTO `sys_log` VALUES
  ('1092', '0', '2016-10-31 23:50:51', '2016-10-31 23:50:51', '0', '0', '1', '127.0.0.1', NULL,
           'com.hunt.controller.PermissionController.selectGroup', NULL,
   '[SysPermissionGroup{id=\'1\', name=\'用户管理\', description=\'用户数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'2\', name=\'权限管理\', description=\'权限数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'3\', name=\'角色管理\', description=\'角色数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'4\', name=\'组织机构管理\', description=\'组织机构数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'5\', name=\'职位管理\', description=\'职位数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'6\', name=\'字典管理\', description=\'字典数据增删改查\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Sat Oct 29 11:43:55 CST 2016\', updateTime=\'Sat Oct 29 11:43:55 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'7\', name=\'数据库\', description=\'数据库监控\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:31:01 CST 2016\', updateTime=\'Mon Oct 31 21:31:01 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'8\', name=\'安全\', description=\'安全\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 21:43:47 CST 2016\', updateTime=\'Mon Oct 31 21:43:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}, SysPermissionGroup{id=\'9\', name=\'日志\', description=\'日志\', parentId=\'0\', isFinal=\'2\', rank=\'0\', createTime=\'Mon Oct 31 23:47:47 CST 2016\', updateTime=\'Mon Oct 31 23:47:47 CST 2016\', createBy=\'0\', updateBy=\'0\', status=1}]',
   '23', 'http://127.0.0.1:8086/permission/group/list',
   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36');

-- ----------------------------
-- Table structure for `sys_login_status`
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_status`;
CREATE TABLE `sys_login_status` (
  `id`                  BIGINT(20) NOT NULL AUTO_INCREMENT
  COMMENT '主键',
  `sys_user_id`         BIGINT(20)          DEFAULT NULL
  COMMENT '用户id',
  `session_id`          VARCHAR(256)        DEFAULT NULL
  COMMENT 'session id',
  `session_expires`     DATETIME            DEFAULT NULL
  COMMENT 'session过期时间',
  `sys_user_login_name` VARCHAR(256)        DEFAULT NULL
  COMMENT '登录名',
  `sys_user_zh_name`    VARCHAR(256)        DEFAULT NULL
  COMMENT '中文名',
  `last_login_time`     DATETIME            DEFAULT NULL
  COMMENT '上一次登录时间',
  `platform`            TINYINT(4)          DEFAULT NULL
  COMMENT '登录平台 1:web 2:android 3:ios',
  `rank`                BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`         DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`         DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`           BIGINT(20)          DEFAULT '0'
  COMMENT '创建人',
  `update_by`           BIGINT(20)          DEFAULT '0'
  COMMENT '更热人',
  `status`              TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_login_status
-- ----------------------------
INSERT INTO `sys_login_status` VALUES
  ('1', '1', 'shiro-session-3899310f-ffbd-4e31-8a48-8757dd3ee76a', '2016-11-30 21:28:07', 'admin', 'admin', NULL, '1',
        '0', '2016-10-31 21:28:07', '2016-10-31 21:28:07', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('2', '1', 'shiro-session-2ddf3787-909a-477c-846c-262e8eff01c8', '2016-11-30 22:36:45', 'admin', 'admin',
        '2016-10-31 21:28:07', '1', '0', '2016-10-31 22:36:45', '2016-10-31 22:36:45', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('3', '1', 'shiro-session-55fc131f-65d4-49f6-98dc-4a5154a31cdb', '2016-11-30 22:53:05', 'admin', 'admin',
        '2016-10-31 22:36:45', '1', '0', '2016-10-31 22:53:05', '2016-10-31 22:53:05', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('4', '1', 'shiro-session-dca16dbf-c520-4fcd-99d7-d86d08781093', '2016-11-30 23:08:56', 'admin', 'admin',
        '2016-10-31 22:53:05', '1', '0', '2016-10-31 23:08:55', '2016-10-31 23:08:55', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('5', '1', 'shiro-session-dca16dbf-c520-4fcd-99d7-d86d08781093', '2016-11-30 23:09:54', 'admin', 'admin',
        '2016-10-31 23:08:55', '1', '0', '2016-10-31 23:09:54', '2016-10-31 23:09:54', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('6', '2', 'shiro-session-dca16dbf-c520-4fcd-99d7-d86d08781093', '2016-11-30 23:16:32', 'admin2', 'admin2管理员', NULL,
        '1', '0', '2016-10-31 23:16:32', '2016-10-31 23:16:32', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('7', '1', 'shiro-session-33214fe2-99c4-4130-9223-ed4bdea6aafc', '2016-11-30 23:23:06', 'admin', 'admin',
        '2016-10-31 23:09:54', '1', '0', '2016-10-31 23:23:06', '2016-10-31 23:23:06', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('8', '2', 'shiro-session-4d6e2ae1-e848-447e-8aa9-39137eab5516', '2016-11-30 23:23:28', 'admin2', 'admin2管理员',
        '2016-10-31 23:16:32', '1', '0', '2016-10-31 23:23:28', '2016-10-31 23:23:28', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('9', '1', 'shiro-session-d2124a54-7270-4709-b057-504a2cf84505', '2016-11-30 23:24:53', 'admin', 'admin',
        '2016-10-31 23:23:06', '1', '0', '2016-10-31 23:24:52', '2016-10-31 23:24:52', '0', '0', '2');
INSERT INTO `sys_login_status` VALUES
  ('10', '1', 'shiro-session-fe5fcb09-2972-421c-ae6e-154698ae6989', '2016-11-30 23:30:43', 'admin', 'admin',
         '2016-10-31 23:24:52', '1', '0', '2016-10-31 23:30:42', '2016-10-31 23:30:42', '0', '0', '1');
INSERT INTO `sys_login_status` VALUES
  ('11', '2', 'shiro-session-b7fa75be-39ce-43cc-b3f3-7664e7754042', '2016-11-30 23:31:33', 'admin2', 'admin2管理员',
         '2016-10-31 23:23:28', '1', '0', '2016-10-31 23:31:32', '2016-10-31 23:31:32', '0', '0', '1');

-- ----------------------------
-- Table structure for `sys_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(256)        DEFAULT NULL
  COMMENT '名称',
  `description` VARCHAR(1024)       DEFAULT NULL
  COMMENT '描述',
  `is_final`    INT(11)             DEFAULT '1'
  COMMENT '是否可删除',
  `parent_id`   BIGINT(20)          DEFAULT '0',
  `rank`        BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time` DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time` DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`      TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  `full_name`   VARCHAR(256)        DEFAULT NULL
  COMMENT '全称',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization`
VALUES ('1', '系统', '系统', '2', '0', '0', '2016-10-29 14:21:13', '2016-10-31 23:51:20', '0', '0', '1', '系统');
INSERT INTO `sys_organization`
VALUES ('2', 'xxx集团', 'xxx集团', '2', '1', '0', '2016-10-29 14:21:34', '2016-10-31 23:51:20', '0', '0', '1', 'xxx集团');
INSERT INTO `sys_organization` VALUES
  ('3', 'xxx深圳分公司', 'xxx深圳分公司', '2', '2', '0', '2016-10-29 14:26:27', '2016-10-31 23:51:21', '0', '0', '1', 'xxx深圳分公司');
INSERT INTO `sys_organization` VALUES
  ('4', 'xxx长沙分公司', 'xxx长沙分公司', '2', '2', '0', '2016-10-29 14:27:18', '2016-10-31 23:51:22', '0', '0', '1', 'xxx长沙分公司');
INSERT INTO `sys_organization` VALUES
  ('5', '财务部', 'xxx深圳分公司财务部', '2', '3', '0', '2016-10-29 14:27:42', '2016-10-31 23:51:23', '0', '0', '1',
   'xxx深圳分公司财务部');
INSERT INTO `sys_organization` VALUES
  ('6', '研发部', 'xxx深圳分公司研发部', '2', '3', '0', '2016-10-29 14:28:38', '2016-10-31 23:51:24', '0', '0', '1',
   'xxx深圳分公司研发部');
INSERT INTO `sys_organization` VALUES
  ('7', '市场部', 'xxx深圳分公司市场部', '2', '3', '0', '2016-10-29 14:28:49', '2016-10-31 23:51:24', '0', '0', '1',
   'xxx深圳分公司市场部');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id`                      BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name`                    VARCHAR(256)        DEFAULT NULL
  COMMENT '名称',
  `description`             VARCHAR(256)        DEFAULT NULL
  COMMENT '描述',
  `code`                    VARCHAR(256)        DEFAULT NULL
  COMMENT '编码',
  `sys_permission_group_id` BIGINT(20)          DEFAULT NULL
  COMMENT '分组id',
  `is_final`                INT(11)             DEFAULT '1'
  COMMENT '是否可删除',
  `rank`                    BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`             DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`             DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`               BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`               BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`                  TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 47
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission`
VALUES ('1', '新增', '新增用户', 'user:insert', '1', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('2', '删除', '删除用户', 'user:delete', '1', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('3', '更新', '更新用户', 'user:update', '1', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('4', '查询', '查询用户', 'user:select', '1', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('5', '列表', '查询用户列表', 'user:list', '1', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('6', '新增', '新增权限', 'permission:insert', '2', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('7', '删除', '删除权限', 'permission:delete', '2', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('8', '更新', '更新权限', 'permission:update', '2', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('9', '查询', '查询权限', 'permission:select', '2', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('10', '列表', '查询权限列表', 'permission:list', '2', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('11', '新增', '新增角色', 'role:insert', '3', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('12', '删除', '删除角色', 'role:delete', '3', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('13', '更新', '更新角色', 'role:update', '3', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('14', '查询', '查询角色', 'role:select', '3', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('15', '列表', '查询角色列表', 'role:list', '3', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('16', '新增', '新增组织机构', 'organization:insert', '4', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission` VALUES
  ('17', '删除', '删除组织机构', 'organization:delete', '4', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission` VALUES
  ('18', '更新', '更新组织机构', 'organization:update', '4', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission` VALUES
  ('19', '查询', '查询组织机构', 'organization:select', '4', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission` VALUES
  ('20', '列表', '查询组织机构列表', 'organization:list', '4', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission`
VALUES ('21', '新增', '新增职位', 'job:insert', '5', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('22', '删除', '删除职位', 'job:delete', '5', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('23', '更新', '更新职位', 'job:update', '5', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('24', '查询', '查询职位', 'job:select', '5', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('25', '列表', '查询职位列表', 'job:list', '5', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('26', '新增', '新增字典', 'data:insert', '6', '2', '0', '2016-10-29 11:45:09', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('27', '删除', '删除字典', 'data:delete', '6', '2', '0', '2016-10-29 11:46:08', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('28', '更新', '更新字典', 'data:update', '6', '2', '0', '2016-10-29 11:46:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('29', '查询', '查询字典', 'data:select', '6', '2', '0', '2016-10-29 11:46:57', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('30', '列表', '查询字典列表', 'data:list', '6', '2', '0', '2016-10-29 11:47:20', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('31', '启用', '启用用户', 'user:enable', '1', '2', '0', '2016-10-29 11:58:15', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('32', '禁用', '禁用用户', 'user:forbidden', '1', '2', '0', '2016-10-29 11:58:45', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('33', '密码', '修改密码', 'user:updatePassword', '1', '2', '0', '2016-10-29 12:00:01', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission` VALUES
  ('34', '查看数据库监控', '查看数据库监控', 'db:select', '7', '2', '0', '2016-10-31 21:31:34', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('35', '下线', '下线用户', 'user:loginout', '1', '2', '0', '2016-10-31 21:32:45', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('36', '用户在线列表', '用户在线列表', 'user:loginStatu:list', '1', '2', '0', '2016-10-31 21:33:26', '2016-10-31 23:51:47', '0',
         '0', '1');
INSERT INTO `sys_permission` VALUES
  ('37', '新建权限组', '新建权限组', 'permission:group:insert', '2', '2', '0', '2016-10-31 21:34:12', '2016-10-31 23:51:47', '0',
         '0', '1');
INSERT INTO `sys_permission` VALUES
  ('38', '权限组列表', '权限组列表', 'permission:group:list', '2', '2', '0', '2016-10-31 21:35:10', '2016-10-31 23:51:47', '0',
         '0', '1');
INSERT INTO `sys_permission`
VALUES ('39', '新增', '新增IP', 'ip:insert', '8', '2', '0', '2016-10-31 21:44:18', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('40', '更新', '更新ip', 'ip:update', '8', '2', '0', '2016-10-31 21:44:44', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('41', '删除', '删除ip', 'ip:delete', '8', '2', '0', '2016-10-31 21:44:59', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('42', '查看', '查看ip', 'ip:select', '8', '2', '0', '2016-10-31 21:45:14', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission`
VALUES ('43', '列表', 'ip列表', 'ip:list', '8', '2', '0', '2016-10-31 21:45:37', '2016-10-31 23:51:47', '0', '0', '1');
INSERT INTO `sys_permission` VALUES
  ('44', '字典组列表', '字典组列表', 'data:group:list', '6', '2', '0', '2016-10-31 22:25:32', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission` VALUES
  ('45', '新增字典组', '新增字典组', 'data:group:insert', '6', '2', '0', '2016-10-31 22:26:24', '2016-10-31 23:51:47', '0', '0',
   '1');
INSERT INTO `sys_permission`
VALUES ('46', '列表', '列表', 'log:list', '9', '2', '0', '2016-10-31 23:48:43', '2016-10-31 23:51:47', '0', '0', '1');

-- ----------------------------
-- Table structure for `sys_permission_group`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_group`;
CREATE TABLE `sys_permission_group` (
  `id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(256)        DEFAULT NULL
  COMMENT '名称',
  `description` VARCHAR(256)        DEFAULT NULL
  COMMENT '描述',
  `parent_id`   BIGINT(20)          DEFAULT '0'
  COMMENT '父级id',
  `is_final`    INT(11)             DEFAULT '1'
  COMMENT '是否可删除',
  `rank`        BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time` DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time` DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`      TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_permission_group
-- ----------------------------
INSERT INTO `sys_permission_group`
VALUES ('1', '用户管理', '用户数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('2', '权限管理', '权限数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('3', '角色管理', '角色数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('4', '组织机构管理', '组织机构数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('5', '职位管理', '职位数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('6', '字典管理', '字典数据增删改查', '0', '2', '0', '2016-10-29 11:43:55', '2016-10-29 11:43:55', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('7', '数据库', '数据库监控', '0', '2', '0', '2016-10-31 21:31:01', '2016-10-31 21:31:01', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('8', '安全', '安全', '0', '2', '0', '2016-10-31 21:43:47', '2016-10-31 21:43:47', '0', '0', '1');
INSERT INTO `sys_permission_group`
VALUES ('9', '日志', '日志', '0', '2', '0', '2016-10-31 23:47:47', '2016-10-31 23:47:47', '0', '0', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(1024)       DEFAULT NULL,
  `name`        VARCHAR(256)        DEFAULT NULL,
  `rank`        BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `is_final`    INT(11)             DEFAULT '1'
  COMMENT '是否可删除',
  `create_time` DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time` DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`   BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`      TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES ('1', '超级管理员', '超级管理员', '0', '2', '2016-10-29 14:18:43', '2016-10-31 23:51:57', '0', '0', '1');
INSERT INTO `sys_role`
VALUES ('2', '管理员', '管理员', '0', '2', '2016-10-29 14:19:05', '2016-10-31 23:51:57', '0', '0', '1');
INSERT INTO `sys_role`
VALUES ('3', '分公司总经理', '分公司总经理', '0', '2', '2016-10-29 14:36:24', '2016-10-31 23:51:58', '0', '0', '1');
INSERT INTO `sys_role`
VALUES ('4', '分公司部门经理', '分公司部门经理', '0', '2', '2016-10-29 14:37:46', '2016-10-31 23:51:59', '0', '0', '1');
INSERT INTO `sys_role`
VALUES ('5', '集团总经理', '集团总经理', '0', '2', '2016-10-29 14:59:17', '2016-10-31 23:51:59', '0', '0', '1');

-- ----------------------------
-- Table structure for `sys_role_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_organization`;
CREATE TABLE `sys_role_organization` (
  `id`                  BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sys_organization_id` BIGINT(20)          DEFAULT NULL
  COMMENT '组织id',
  `sys_role_id`         BIGINT(20)          DEFAULT NULL
  COMMENT '角色id',
  `parent_id`           BIGINT(20)          DEFAULT NULL
  COMMENT '父级id',
  `name`                VARCHAR(256)        DEFAULT NULL,
  `full_name`           VARCHAR(256)        DEFAULT NULL,
  `description`         VARCHAR(256)        DEFAULT NULL,
  `rank`                BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`         DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`         DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`           BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`           BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`              TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  `is_final`            TINYINT(4)          DEFAULT NULL
  COMMENT '是否能修改',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_role_organization
-- ----------------------------
INSERT INTO `sys_role_organization`
VALUES ('1', '0', '0', '0', '系统', '系统', '系统', '0', '2016-10-29 14:53:47', '2016-10-31 23:52:09', '0', '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES
  ('2', '2', '1', '1', '系统超级管理员', '系统超级管理员', '系统超级管理员', '0', '2016-10-29 14:54:22', '2016-10-31 23:52:09', '0', '0',
   '1', '2');
INSERT INTO `sys_role_organization` VALUES
  ('3', '2', '5', '1', '集团总经理', '集团总经理', '集团总经理', '0', '2016-10-29 15:01:06', '2016-10-31 23:52:10', '0', '0', '1',
   '2');
INSERT INTO `sys_role_organization` VALUES
  ('4', '3', '3', '3', '深圳分公司总经理', 'xxx深圳分公司总经理', 'xxx深圳分公司总经理', '0', '2016-10-29 15:01:47', '2016-10-31 23:52:11', '0',
   '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES
  ('5', '6', '4', '4', 'xxx深圳分公司研发部经理', 'xxx深圳分公司研发部经理', 'xxx深圳分公司研发部经理', '0', '2016-10-29 15:02:56',
        '2016-10-31 23:52:11', '0', '0', '1', '2');
INSERT INTO `sys_role_organization` VALUES
  ('6', '2', '2', '2', '系统管理员', '系统管理员', '系统管理员', '0', '2016-10-29 15:07:01', '2016-10-31 23:52:12', '0', '0', '1',
   '2');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id`                BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sys_permission_id` BIGINT(20)          DEFAULT NULL
  COMMENT '权限id',
  `sys_role_id`       BIGINT(20)          DEFAULT NULL
  COMMENT '角色id',
  `rank`              BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`       DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`       DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`         BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`         BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`            TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 205
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission`
VALUES ('1', '1', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('2', '2', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('3', '3', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('4', '4', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('5', '5', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('6', '31', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('7', '32', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('8', '33', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('9', '6', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('10', '7', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('11', '8', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('12', '9', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('13', '10', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('14', '11', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('15', '12', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('16', '13', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('17', '14', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('18', '15', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('19', '16', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('20', '17', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('21', '18', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('22', '19', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('23', '20', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('24', '21', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('25', '22', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('26', '23', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('27', '24', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('28', '25', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('29', '26', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('30', '27', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('31', '28', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('32', '29', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('33', '30', '1', '0', '2016-10-29 14:18:43', '2016-10-31 23:49:03', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('34', '1', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('35', '3', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('36', '4', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('37', '5', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('38', '31', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('39', '32', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('40', '33', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('41', '6', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('42', '8', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('43', '9', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('44', '10', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('45', '11', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('46', '13', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('47', '14', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('48', '15', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('49', '16', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('50', '18', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('51', '19', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('52', '20', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('53', '21', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('54', '23', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('55', '24', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('56', '25', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('57', '26', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('58', '28', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('59', '29', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('60', '30', '2', '0', '2016-10-29 14:19:05', '2016-10-31 23:10:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('61', '5', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('62', '9', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('63', '10', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('64', '14', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('65', '15', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('66', '19', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('67', '20', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('68', '24', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('69', '25', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('70', '29', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('71', '30', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('72', '4', '3', '0', '2016-10-29 14:36:24', '2016-10-29 14:37:16', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('73', '5', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('74', '9', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('75', '10', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('76', '14', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('77', '15', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('78', '19', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('79', '20', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('80', '24', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('81', '25', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('82', '29', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('83', '30', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('84', '4', '3', '0', '2016-10-29 14:37:16', '2016-10-29 14:37:16', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('85', '25', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('86', '24', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('87', '4', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('88', '5', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('89', '9', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('90', '10', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('91', '14', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('92', '15', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('93', '19', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('94', '20', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('95', '29', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('96', '30', '4', '0', '2016-10-29 14:37:46', '2016-10-29 14:37:46', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('97', '4', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('98', '5', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('99', '9', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('100', '10', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('101', '14', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('102', '15', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('103', '20', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('104', '19', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('105', '24', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('106', '25', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('107', '29', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('108', '30', '5', '0', '2016-10-29 14:59:17', '2016-10-29 14:59:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('109', '5', '2', '0', '2016-10-31 23:10:32', '2016-10-31 23:31:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('110', '5', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('111', '10', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('112', '15', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('113', '20', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('114', '25', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('115', '30', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('116', '43', '2', '0', '2016-10-31 23:31:17', '2016-10-31 23:33:32', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('117', '5', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('118', '10', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('119', '15', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('120', '20', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('121', '25', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('122', '30', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('123', '43', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('124', '38', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('125', '44', '2', '0', '2016-10-31 23:33:32', '2016-10-31 23:44:42', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('126', '5', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('127', '10', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('128', '15', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('129', '20', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('130', '25', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('131', '30', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('132', '43', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('133', '38', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('134', '44', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('135', '36', '2', '0', '2016-10-31 23:44:42', '2016-10-31 23:44:54', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('136', '5', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('137', '10', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('138', '15', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('139', '20', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('140', '25', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('141', '30', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('142', '43', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('143', '38', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('144', '44', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('145', '36', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('146', '34', '2', '0', '2016-10-31 23:44:54', '2016-10-31 23:50:17', '0', '0', '2');
INSERT INTO `sys_role_permission`
VALUES ('147', '1', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('148', '2', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('149', '3', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('150', '4', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('151', '5', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('152', '31', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('153', '32', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('154', '33', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('155', '6', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('156', '7', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('157', '8', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('158', '9', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('159', '10', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('160', '11', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('161', '12', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('162', '13', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('163', '14', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('164', '15', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('165', '16', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('166', '17', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('167', '18', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('168', '19', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('169', '20', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('170', '21', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('171', '22', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('172', '23', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('173', '24', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('174', '25', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('175', '26', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('176', '27', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('177', '28', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('178', '29', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('179', '30', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('180', '35', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('181', '36', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('182', '37', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('183', '38', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('184', '44', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('185', '45', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('186', '34', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('187', '39', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('188', '40', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('189', '41', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('190', '42', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('191', '43', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('192', '46', '1', '0', '2016-10-31 23:49:03', '2016-10-31 23:49:03', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('193', '5', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('194', '10', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('195', '15', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('196', '20', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('197', '25', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('198', '30', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('199', '43', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('200', '38', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('201', '44', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('202', '36', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('203', '34', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');
INSERT INTO `sys_role_permission`
VALUES ('204', '46', '2', '0', '2016-10-31 23:50:17', '2016-10-31 23:50:17', '0', '0', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id`            BIGINT(20) NOT NULL AUTO_INCREMENT,
  `login_name`    VARCHAR(256)        DEFAULT NULL
  COMMENT '登陆名',
  `zh_name`       VARCHAR(256)        DEFAULT NULL
  COMMENT '中文名',
  `en_name`       VARCHAR(256)        DEFAULT NULL
  COMMENT '英文名',
  `sex`           INT(11)             DEFAULT '0'
  COMMENT '性别',
  `birth`         VARCHAR(256)        DEFAULT NULL
  COMMENT '生日',
  `email`         VARCHAR(256)        DEFAULT NULL
  COMMENT '邮箱',
  `phone`         VARCHAR(256)        DEFAULT NULL
  COMMENT '电话',
  `address`       VARCHAR(1024)       DEFAULT NULL
  COMMENT '地址',
  `password`      VARCHAR(256)        DEFAULT NULL
  COMMENT '密码',
  `password_salt` VARCHAR(256)        DEFAULT NULL
  COMMENT '密码盐',
  `rank`          BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`   DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`   DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`     BIGINT(20)          DEFAULT '0'
  COMMENT '创建人',
  `update_by`     BIGINT(20)          DEFAULT '0'
  COMMENT '更热人',
  `status`        TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除,3:禁用账号',
  `is_final`      TINYINT(4)          DEFAULT NULL
  COMMENT '是否能修改',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES
  ('1', 'admin', 'admin', 'admin', '1', NULL, NULL, NULL, NULL, 'f893d078cee0c79c90e8747e1df8f54b',
        '0e1e5f9114dc4d60a7ea9e13c60bdff8', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:29', '0', '0', '1', '2');
INSERT INTO `sys_user` VALUES
  ('2', 'admin2', 'admin2管理员', 'admin2', '1', NULL, NULL, NULL, NULL, '2f38e9c59827c9d457a2d82d38ba4e37',
        'b80407eb849f4cd88c89c3e59f97b089', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:30', '0', '0', '1', '2');

-- ----------------------------
-- Table structure for `sys_user_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_permission`;
CREATE TABLE `sys_user_permission` (
  `id`                BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id`       BIGINT(20)          DEFAULT NULL,
  `sys_permission_id` BIGINT(20)          DEFAULT NULL,
  `is_final`          INT(11)             DEFAULT '1',
  `rank`              BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`       DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`       DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`         BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`         BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`            TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 112
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_user_permission
-- ----------------------------
INSERT INTO `sys_user_permission`
VALUES ('1', '1', '1', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('2', '1', '2', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('3', '1', '3', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('4', '1', '4', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('5', '1', '5', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('6', '1', '31', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('7', '1', '32', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('8', '1', '33', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('9', '1', '6', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('10', '1', '7', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('11', '1', '8', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('12', '1', '9', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('13', '1', '10', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('14', '1', '11', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('15', '1', '12', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('16', '1', '13', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('17', '1', '14', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('18', '1', '15', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('19', '1', '16', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('20', '1', '17', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('21', '1', '18', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('22', '1', '19', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('23', '1', '20', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('24', '1', '21', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('25', '1', '22', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('26', '1', '23', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('27', '1', '24', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('28', '1', '25', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('29', '1', '26', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('30', '1', '27', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('31', '1', '28', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('32', '1', '29', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('33', '1', '30', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('34', '2', '1', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('35', '2', '2', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('36', '2', '3', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('37', '2', '4', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('38', '2', '5', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('39', '2', '31', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('40', '2', '32', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('41', '2', '33', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('42', '2', '6', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('43', '2', '7', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('44', '2', '8', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('45', '2', '9', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('46', '2', '10', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('47', '2', '11', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('48', '2', '12', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('49', '2', '13', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('50', '2', '14', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('51', '2', '15', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('52', '2', '16', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('53', '2', '17', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('54', '2', '18', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('55', '2', '19', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('56', '2', '20', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('57', '2', '21', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('58', '2', '22', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('59', '2', '23', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('60', '2', '24', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('61', '2', '25', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('62', '2', '26', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('63', '2', '27', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('64', '2', '28', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('65', '2', '29', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('66', '2', '30', '2', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('67', '1', '1', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('68', '1', '2', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('69', '1', '3', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('70', '1', '4', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('71', '1', '5', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('72', '1', '31', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('73', '1', '32', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('74', '1', '33', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('75', '1', '6', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('76', '1', '7', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('77', '1', '8', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('78', '1', '9', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('79', '1', '10', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('80', '1', '11', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('81', '1', '12', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('82', '1', '13', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('83', '1', '14', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('84', '1', '15', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('85', '1', '16', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('86', '1', '17', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('87', '1', '18', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('88', '1', '19', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('89', '1', '20', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('90', '1', '21', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('91', '1', '22', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('92', '1', '23', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('93', '1', '24', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('94', '1', '25', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('95', '1', '26', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('96', '1', '27', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('97', '1', '28', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('98', '1', '29', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('99', '1', '30', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('100', '1', '35', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('101', '1', '36', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('102', '1', '37', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('103', '1', '38', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('104', '1', '44', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('105', '1', '45', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('106', '1', '34', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('107', '1', '39', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('108', '1', '40', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('109', '1', '41', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('110', '1', '42', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');
INSERT INTO `sys_user_permission`
VALUES ('111', '1', '43', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:48', '0', '0', '2');

-- ----------------------------
-- Table structure for `sys_user_role_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_organization`;
CREATE TABLE `sys_user_role_organization` (
  `id`                       BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id`              BIGINT(20)          DEFAULT NULL,
  `sys_role_organization_id` BIGINT(20)          DEFAULT NULL,
  `rank`                     BIGINT(20)          DEFAULT '0'
  COMMENT '排序',
  `create_time`              DATETIME            DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  `update_time`              DATETIME            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by`                BIGINT(20)          DEFAULT '0'
  COMMENT '创建人id',
  `update_by`                BIGINT(20)          DEFAULT '0'
  COMMENT '更新人id',
  `status`                   TINYINT(4)          DEFAULT '1'
  COMMENT '数据状态,1:正常,2:删除',
  `is_final`                 TINYINT(4)          DEFAULT NULL
  COMMENT '是否能修改',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sys_user_role_organization
-- ----------------------------
INSERT INTO `sys_user_role_organization`
VALUES ('1', '1', '2', '0', '2016-10-29 15:06:05', '2016-10-31 23:53:54', '0', '0', '2', '2');
INSERT INTO `sys_user_role_organization`
VALUES ('2', '2', '6', '0', '2016-10-29 15:07:39', '2016-10-31 23:53:54', '0', '0', '2', '2');
INSERT INTO `sys_user_role_organization`
VALUES ('3', '1', '2', '0', '2016-10-31 22:55:17', '2016-10-31 23:53:54', '0', '0', '2', '2');
INSERT INTO `sys_user_role_organization`
VALUES ('6', '2', '6', '0', '2016-10-31 23:14:42', '2016-10-31 23:53:54', '0', '0', '1', '2');
INSERT INTO `sys_user_role_organization`
VALUES ('7', '1', '2', '0', '2016-10-31 23:49:14', '2016-10-31 23:53:54', '0', '0', '1', '2');
