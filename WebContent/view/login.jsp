<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>
    <link href="h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="h-ui/css/H-ui.login.css" rel="stylesheet" type="text/css"/>
    <link href="h-ui/lib/icheck/icheck.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="h-ui/js/H-ui.js"></script>
    <script type="text/javascript" src="h-ui/lib/icheck/jquery.icheck.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

    <script type="text/javascript">
        $(function () {
            // 点击图片切换验证码
            $("#vcodeImg").click(function () {
                this.src = "CpachaServlet?method=loginCapcha&t=" + new Date().getTime();
            });

            // 登录
            $("#submitBtn").click(function () {
                var data = $("#form").serialize();
                $.ajax({
                    type: "post",
                    url: "LoginServlet?method=Login",
                    data: data,
                    // 返回数据类型
                    dataType: "text",
                    success: function (msg) {
                        if ("vcodeError" == msg) {
                            $.messager.alert("消息提醒", "验证码错误!", "warning");
                            // 切换验证码
                            $("#vcodeImg").click();
                            // 清空验证码输入框
                            $("input[name='vcode']").val("");
                        } else if ("loginError" == msg) {
                            $.messager.alert("消息提醒", "用户名或密码错误!", "warning");
                            // 切换验证码
                            $("#vcodeImg").click();
                            // 清空验证码输入框
                            $("input[name='vcode']").val("");
                        } else if ("loginSuccess" == msg) {
                            window.location.href = "SystemServlet?method=toAdminView";
                        } else {
                            alert(msg);
                        }
                    }

                });
            });

            //设置复选框
            $(".skin-minimal input").iCheck({
                radioClass: 'iradio-blue',
                increaseArea: '25%'
            });
        })
    </script>
    <title>登录|学生学籍管理系统</title>
    <meta name="keywords" content="学生信息管理系统">
</head>
<body>

<div class="header" style="padding: 0;">
    <h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">
        学生学籍管理系统</h2>
</div>
<div>
    <div id="loginform" class="loginBox" style=" background-color: #ffffff; box-shadow: 2px 2px 10px #909090">
        <form id="form" class="form form-horizontal" method="post">
            <%--账号--%>
            <div class="row cl">
                <div class="inputrow">
                    <span>
                        <input class="gate" id="acc" name="account" type="text" placeholder="请输入您的账号"/><label
                            for="acc">账户</label>
                    </span>
                </div>
            </div>

            <%--密码--%>
            <div class="row cl">
                <div class="inputrow">
                    <span>
                        <input class="gate" id="psd" name="password" type="password" placeholder="请输入您的密码"/><label
                            for="psd">密码</label>
                    </span>
                </div>
            </div>

            <%--验证码--%>
            <div class="row cl">
                <div class="inputrow">
                        <span>
                            <input class="gate" name="vcode" type="text" placeholder="请输入下方验证码"/><label
                                for="acc">验证码</label>
                        </span>
                </div>
                <img title="点击图片切换验证码" id="vcodeImg" src="CpachaServlet?method=loginCapcha">
            </div>

            <div class="mt-20 skin-minimal" style="text-align: center;">
                <div class="radio-box">
                    <input type="radio" id="radio-2" name="type" checked value="2"/>
                    <label for="radio-1"><font color="#454646">学生</font></label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="radio-3" name="type" value="3"/>
                    <label for="radio-2"><font color="#454646">教师</font></label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="radio-1" name="type" value="1"/>
                    <label for="radio-3"><font color="#454646">管理员</font></label>
                </div>
            </div>

            <div class="row">
                <div class="formControls col-8 col-offset-3">
                    <input id="sinInBtn" type="button"
                           class="btn btn-secondary radius size-L"
                           value="&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;"
                           onclick="javascript:alert('初始账号/密码都为学/工号，若无法登陆请联系管理员！')">
                    <input id="submitBtn" type="button"
                           class="btn btn-success radius size-L"
                           value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div id="footer">
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    <p>© 2021 <a href="">AUST</a> | <a href="mailto:kangzhang51@gmail.com">联系管理员</a></p>
    <span id="busuanzi_container_site_uv">本站访客数<span id="busuanzi_value_site_uv"></span>人次</span> |
    <span id="busuanzi_container_site_pv">本站总访问量<span id="busuanzi_value_site_pv"></span>次</span>
</div>
<script src="https://passport.zhihuishu.com/assets/js/three/three.min.js" type="text/javascript"></script>
<script src="h-ui/js/wallbgcanvas.js" type="text/javascript"></script>
</body>
</html>