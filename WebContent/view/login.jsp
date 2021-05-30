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
    <link href="h-ui/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="h-ui/js/H-ui.js"></script>
    <script type="text/javascript" src="h-ui/lib/icheck/jquery.icheck.min.js"></script>

    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

    <script type="text/javascript">
        $(function () {
            //点击图片切换验证码
            $("#vcodeImg").click(function () {
                this.src = "CpachaServlet?method=loginCapcha&t=" + new Date().getTime();
            });

            //登录
            $("#submitBtn").click(function () {
                var data = $("#form").serialize();
                $.ajax({
                    type: "post",
                    url: "LoginServlet?method=Login",
                    data: data,
                    dataType: "text", //返回数据类型
                    success: function (msg) {
                        if ("vcodeError" == msg) {
                            $.messager.alert("消息提醒", "验证码错误!", "warning");
                            $("#vcodeImg").click();//切换验证码
                            $("input[name='vcode']").val("");//清空验证码输入框
                        } else if ("loginError" == msg) {
                            $.messager.alert("消息提醒", "用户名或密码错误!", "warning");
                            $("#vcodeImg").click();//切换验证码
                            $("input[name='vcode']").val("");//清空验证码输入框
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
<div class="loginWraper">
    <div id="loginform" class="loginBox" style=" background-color: #4d4d4d">
        <form id="form" class="form form-horizontal" method="post">
            <div class="row cl">
                <label class="form-label col-3">
                    <svg t="1622388124769" class="icon" viewBox="0 0 1024 1024" version="1.1"
                         xmlns="http://www.w3.org/2000/svg" p-id="7052" width="30" height="30">
                        <path d="M524.6 156.6c-235.9 0-427.2 191.2-427.2 427.2S288.6 1011 524.6 1011s427.2-191.2 427.2-427.2-191.3-427.2-427.2-427.2z"
                              fill="#47E2C4" p-id="7053"></path>
                        <path d="M701.2 861.8c-3.4 0-6.9-1.4-9.4-4-5-5.2-4.8-13.5 0.4-18.4 19.8-18.9 37.8-39.9 53.6-62.4 5.8-8.3 11.4-16.9 16.5-25.6 3.7-6.2 11.7-8.2 17.9-4.5 6.2 3.7 8.2 11.7 4.5 17.9-5.5 9.2-11.4 18.4-17.5 27.1-16.7 23.9-35.8 46.1-56.9 66.3-2.6 2.4-5.8 3.6-9.1 3.6z m100.2-146.4c-1.7 0-3.3-0.3-5-1-6.7-2.8-9.9-10.4-7.1-17 4.6-11.2 8.8-22.8 12.4-34.5 2.1-6.9 9.4-10.7 16.3-8.6 6.9 2.1 10.7 9.4 8.6 16.3-3.9 12.3-8.3 24.6-13.2 36.6-2.1 5.2-6.9 8.2-12 8.2z"
                              fill="#FFFFFF" p-id="7054"></path>
                        <path d="M709.4 105.6a2.5 13.1 0 1 0 5 0 2.5 13.1 0 1 0-5 0Z" fill="#E61F19" p-id="7055"></path>
                        <path d="M698.326635 109.679019a13.1 2.5 60 1 0 4.330127-2.5 13.1 2.5 60 1 0-4.330127 2.5Z"
                              fill="#E61F19" p-id="7056"></path>
                        <path d="M690.863321 118.748135a13.1 2.5 30 1 0 2.5-4.330127 13.1 2.5 30 1 0-2.5 4.330127Z"
                              fill="#E61F19" p-id="7057"></path>
                        <path d="M675.8 127.9a13.1 2.5 0 1 0 26.2 0 13.1 2.5 0 1 0-26.2 0Z" fill="#E61F19"
                              p-id="7058"></path>
                        <path d="M680.36029 145.83949a2.5 13.1 60 1 0 22.689865-13.1 2.5 13.1 60 1 0-22.689865 13.1Z"
                              fill="#E61F19" p-id="7059"></path>
                        <path d="M693.235297 159.113466a2.5 13.1 30 1 0 13.1-22.689865 2.5 13.1 30 1 0-13.1 22.689865Z"
                              fill="#E61F19" p-id="7060"></path>
                        <path d="M708.6 151a2.5 13.1 0 1 0 5 0 2.5 13.1 0 1 0-5 0Z" fill="#E61F19" p-id="7061"></path>
                        <path d="M720.314528 149.375833a13.1 2.5 60 1 0 4.330127-2.5 13.1 2.5 60 1 0-4.330127 2.5Z"
                              fill="#E61F19" p-id="7062"></path>
                        <path d="M729.683306 142.073547a13.1 2.5 30 1 0 2.5-4.330127 13.1 2.5 30 1 0-2.5 4.330127Z"
                              fill="#E61F19" p-id="7063"></path>
                        <path d="M721.1 128.7a13.1 2.5 0 1 0 26.2 0 13.1 2.5 0 1 0-26.2 0Z" fill="#E61F19"
                              p-id="7064"></path>
                        <path d="M720.038708 123.832947a2.5 13.1 60 1 0 22.689866-13.1 2.5 13.1 60 1 0-22.689866 13.1Z"
                              fill="#E61F19" p-id="7065"></path>
                        <path d="M716.697311 120.256878a2.5 13.1 30 1 0 13.1-22.689866 2.5 13.1 30 1 0-13.1 22.689866Z"
                              fill="#E61F19" p-id="7066"></path>
                        <path d="M795.5 28.2m-15.9 0a15.9 15.9 0 1 0 31.8 0 15.9 15.9 0 1 0-31.8 0Z" fill="#2C65AF"
                              p-id="7067"></path>
                        <path d="M561.9 93.8c-2.5 0-4.4-2-4.4-4.4V40.7c0-2.5 2-4.4 4.4-4.4 2.5 0 4.4 2 4.4 4.4v48.8c0.1 2.4-1.9 4.3-4.4 4.3z"
                              fill="#2C65AF" p-id="7068"></path>
                        <path d="M586.3 69.5h-48.8c-2.5 0-4.4-2-4.4-4.4 0-2.5 2-4.4 4.4-4.4h48.8c2.5 0 4.4 2 4.4 4.4 0 2.4-1.9 4.4-4.4 4.4z"
                              fill="#2C65AF" p-id="7069"></path>
                        <path d="M942.5 239.9c-6.1-2.6-12.6-1.1-14.6 3.3l-37.6 87.3c-1.9 4.5 1.5 10.2 7.6 12.9 6.1 2.6 12.6 1.1 14.6-3.3l37.6-87.3c1.9-4.5-1.5-10.2-7.6-12.9z"
                              fill="#DAB647" p-id="7070"></path>
                        <path d="M868.4 269.3c-2.6 6.1-1.1 12.6 3.3 14.6l87.3 37.6c4.5 1.9 10.2-1.5 12.9-7.6 2.6-6.1 1.1-12.6-3.3-14.6l-87.3-37.6c-4.5-1.9-10.3 1.5-12.9 7.6z"
                              fill="#DAB647" p-id="7071"></path>
                        <path d="M879.7 173.5c-22.3 0-40.5-18-40.5-40s18.2-40 40.5-40 40.5 18 40.5 40-18.2 40-40.5 40z m0-69.6c-16.4 0-29.8 13.2-29.8 29.4s13.4 29.4 29.8 29.4 29.8-13.2 29.8-29.4-13.4-29.4-29.8-29.4z"
                              fill="#E62A52" p-id="7072"></path>
                        <path d="M468.3 1024c-59.4 0-117.1-11.6-171.4-34.6-52.4-22.2-99.5-53.9-139.9-94.3-40.4-40.4-72.1-87.5-94.3-139.9-23-54.4-34.7-112-34.7-171.5s11.6-117.1 34.6-171.3c22.2-52.5 53.9-99.5 94.3-139.9s87.5-72.1 139.9-94.3c54.3-23 111.9-34.6 171.4-34.6s117.1 11.6 171.4 34.6c52.4 22.2 99.5 53.9 139.9 94.3 40.4 40.4 72.1 87.5 94.3 139.9 23 54.3 34.6 111.9 34.6 171.4s-11.6 117.1-34.6 171.4c-22.2 52.4-53.9 99.5-94.3 139.9-40.4 40.4-87.5 72.1-139.9 94.3-54.2 23-111.9 34.6-171.3 34.6z m0-854.4c-228.4 0-414.2 185.8-414.2 414.1s185.8 414.1 414.1 414.1S882.3 812 882.3 583.7c0.1-228.3-185.7-414.1-414-414.1z"
                              fill="" p-id="7073"></path>
                        <path d="M561.9 443.4c0 25.9 21 46.9 46.9 46.9s46.9-21 46.9-46.9-21-46.9-46.9-46.9-46.9 21-46.9 46.9z"
                              fill="" p-id="7074"></path>
                        <path d="M608.9 503.4c-33.1 0-60-26.9-60-60s26.9-60 60-60 60 26.9 60 60c-0.1 33.1-27 60-60 60z m0-93.8c-18.7 0-33.9 15.2-33.9 33.9s15.2 33.9 33.9 33.9 33.9-15.2 33.9-33.9c-0.1-18.8-15.3-33.9-33.9-33.9z"
                              fill="" p-id="7075"></path>
                        <path d="M280.8 443.4c0 25.9 21 46.9 46.9 46.9s46.9-21 46.9-46.9-21-46.9-46.9-46.9-46.9 21-46.9 46.9z"
                              fill="" p-id="7076"></path>
                        <path d="M327.7 503.4c-33.1 0-60-26.9-60-60s26.9-60 60-60 60 26.9 60 60-27 60-60 60z m0-93.8c-18.7 0-33.9 15.2-33.9 33.9s15.2 33.9 33.9 33.9 33.9-15.2 33.9-33.9c0-18.8-15.2-33.9-33.9-33.9z"
                              fill="" p-id="7077"></path>
                        <path d="M468.3 771c90.5 0 166-64.3 183.4-149.6 4-19.4-10.9-37.6-30.7-37.6H315.6c-19.8 0-34.7 18.2-30.7 37.6C302.2 706.8 377.8 771 468.3 771z"
                              fill="#FCE438" p-id="7078"></path>
                        <path d="M468.3 784.1c-23.7 0-46.9-4.1-68.9-12.2-21.3-7.8-41-19.1-58.6-33.6-35.3-29.1-59.7-69.7-68.7-114.3-2.7-13.1 0.7-26.6 9.1-36.9 8.5-10.4 21-16.3 34.4-16.3H621c13.4 0 25.9 6 34.4 16.3s11.8 23.8 9.1 36.9c-9.1 44.6-33.5 85.1-68.8 114.3-17.5 14.5-37.3 25.8-58.6 33.6-22 8.1-45.2 12.2-68.8 12.2zM315.6 596.9c-5.5 0-10.7 2.5-14.1 6.7-3.5 4.3-4.9 9.8-3.8 15.2C314.1 699.5 385.8 758 468.3 758c82.4 0 154.2-58.5 170.6-139.2 1.1-5.4-0.3-10.9-3.8-15.2s-8.7-6.7-14.2-6.7H315.6z"
                              fill="" p-id="7079"></path>
                    </svg>
                </label>
                <%--                    <i class="Hui-iconfont">&#xe60d;</i>--%>
                <div class="formControls col-8">
                    <input id="acc" name="account" type="text" placeholder="账户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-3">
                    <svg t="1622388030869" class="icon" viewBox="0 0 1024 1024" version="1.1"
                         xmlns="http://www.w3.org/2000/svg" p-id="3002" width="30" height="30">
                        <path d="M305.110204 495.804082c-10.971429 0-19.853061-8.881633-19.853061-19.853062V341.681633C285.257143 216.816327 387.134694 114.938776 512 114.938776c89.338776 0 170.840816 52.767347 206.889796 134.791836 13.061224 29.257143 19.330612 60.081633 19.330612 91.951021 0 10.971429-8.881633 19.853061-19.853061 19.853061-10.971429 0-19.853061-8.881633-19.853061-19.853061 0-26.122449-5.22449-51.722449-16.195919-75.755102-29.257143-67.918367-96.653061-111.281633-170.318367-111.281633-102.922449 0-187.036735 83.591837-187.036735 187.036735v134.269387c0 10.971429-8.881633 19.853061-19.853061 19.853062z"
                              fill="#3D2A03" p-id="3003"></path>
                        <path d="M762.253061 909.061224H261.746939c-43.885714 0-79.412245-35.526531-79.412245-79.412244v-294.138776c0-43.885714 35.526531-79.412245 79.412245-79.412245H762.77551c43.885714 0 79.412245 35.526531 79.412245 79.412245v294.138776c-0.522449 43.885714-36.04898 79.412245-79.934694 79.412244z"
                              fill="#F2CB51" p-id="3004"></path>
                        <path d="M509.387755 813.453061c-30.82449 0-55.902041-25.077551-55.902041-55.902041v-42.840816c-21.420408-17.240816-33.436735-43.363265-33.436734-71.053061 0-50.677551 41.273469-91.95102 91.95102-91.951021s91.95102 41.273469 91.95102 91.951021c0 30.302041-14.628571 57.991837-38.661224 75.232653v39.183673c0 30.302041-25.077551 55.379592-55.902041 55.379592z"
                              fill="#E5404F" p-id="3005"></path>
                    </svg>
                </label>
                <%--                <i class="Hui-iconfont">&#xe60e;</i>--%>
                <div class="formControls col-8">
                    <input id="psd" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-3">
                    <svg t="1622388228125" class="icon" viewBox="0 0 1024 1024" version="1.1"
                         xmlns="http://www.w3.org/2000/svg" p-id="2418" width="30" height="30">
                        <path d="M522.854 33.884L902.47 164.732c14.1 4.85 23.54 18.113 23.54 33.011v402.218c-10.714 238.49-386.18 383.703-402.118 389.764A34.91 34.91 0 0 1 511.505 992c-4.217 0-8.439-0.767-12.387-2.275C483.147 983.664 107.648 838.452 97 601.502V197.743c0-14.898 9.442-28.16 23.503-33.011L500.121 33.884a35.24 35.24 0 0 1 22.733 0z m243.984 299.804c-29.29-29.29-76.777-29.29-106.066 0L459.246 535.213l-95.46-95.46c-29.289-29.289-76.776-29.289-106.065 0-29.29 29.29-29.29 76.777 0 106.067l148.492 148.492c14.645 14.645 33.839 21.967 53.033 21.967l1.152-0.009c18.808-0.287 37.53-7.606 51.881-21.958l254.559-254.558c29.289-29.29 29.289-76.777 0-106.066z"
                              fill="#1296db" p-id="2419" data-spm-anchor-id="a313x.7781069.0.i0"
                              class="selected"></path>
                    </svg>
                </label>
                <div class="formControls col-8">
                    <input class="input-text size-L" name="vcode" type="text" placeholder="请输入验证码"
                           style="width: 200px;">
                    <img title="点击图片切换验证码" id="vcodeImg" src="CpachaServlet?method=loginCapcha">
                </div>
            </div>

            <div class="mt-20 skin-minimal" style="text-align: center;">
                <div class="radio-box">
                    <input type="radio" id="radio-2" name="type" checked value="2"/>
                    <label for="radio-1"><font color="#f0f8ff">学生</font></label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="radio-3" name="type" value="3"/>
                    <label for="radio-2"><font color="#f0f8ff">教师</font>></label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="radio-1" name="type" value="1"/>
                    <label for="radio-3"><font color="#f0f8ff">辅导员</font></label>
                </div>
            </div>

            <div class="row">
                <div class="formControls col-8 col-offset-3">
                    <input id="submitBtn" type="button" class="btn btn-success radius size-L"
                           value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>