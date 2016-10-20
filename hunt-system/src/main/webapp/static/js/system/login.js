$(document).ready(function () {
    var captcha;

    handlerEmbed = function (captchaObj) {
        captchaObj.appendTo("#embed-captcha");
        captcha = captchaObj;
    };
    $.ajax({
        url: "/system/captcha?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                product: "embed",
                offline: !data.success
            }, handlerEmbed);
        }
    });
    $("#login").dialog({

        title: '系统登录',
        closable: false,
        width: 500,
        height: 450,
        cache: false,
        modal: true,
        resizable: false,
        draggable: false,
        buttons: [
            {
                text: '登录',
                width: 100,
                handler: function () {
                    if (!$("#username").validatebox("isValid")) {
                        $("#username").focus();
                    } else if (!$("#password").validatebox("isValid")) {
                        $("#password").focus();
                    } else if (!captcha.getValidate()) {
                        common_tool.messager_show("请刷新并滑动验证码!")
                    } else {
                        $.ajax({
                            url: "/system/login",
                            type: "post",
                            dataType: "json",
                            data: {
                                loginName: $("#username").val(),
                                password: $("#password").val(),
                                platform: 1,
                                // geetest_challenge: $("input[name='geetest_challenge']").val(),
                                // geetest_validate: $("input[name='geetest_validate']").val(),
                                // geetest_seccode: $("input[name='geetest_seccode']").val(),
                            },
                            success: function (data) {
                                if (data.code == 10000) {
                                    location.href = "/system/index";
                                } else if (data.code == 20001) {
                                    $("#username").focus();
                                } else if (data.code == 20003) {
                                    $("#password").focus();
                                }
                                else {
                                    common_tool.messager_show(data.msg)
                                }
                            }
                        })
                    }
                }
            },
        ],
    });

    $('#username').validatebox({
        required: true,
        missingMessage: '请输入账号',
    });
    $('#password').validatebox({
        required: true,
        validType: 'length[6, 30]',
        missingMessage: '请输入密码',
        invalidMessage: '请输入6-30位密码',
    });
    if (!$("#username").validatebox("isValid")) {
        $("#username").focus();
    } else if (!$("#password").validatebox("isValid")) {
        $("#password").focus();
    }


});