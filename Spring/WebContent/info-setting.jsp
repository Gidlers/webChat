<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>WebChat | 个人设置</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="static/plugins/amaze/css/amazeui.min.css">
    <link rel="stylesheet" href="static/plugins/amaze/css/admin.css">
    <link rel="stylesheet" href="static/plugins/contextjs/css/context.standalone.css">
    <script src="static/plugins/jquery/jquery-2.1.4.min.js"></script>
    <script src="static/plugins/amaze/js/amazeui.min.js"></script>
    <script src="static/plugins/amaze/js/app.js"></script>
    <script src="static/plugins/layer/layer.js"></script>
    <script src="static/plugins/laypage/laypage.js"></script>
    <script src="static/plugins/contextjs/js/context.js"></script>
</head>
<body>
<header class="am-topbar admin-header">
    <div class="am-topbar-brand">
        <i class="am-icon-weixin"></i> <strong>WebChat</strong> <small>网页聊天室</small>
    </div>
    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>
    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    ${sessionScope.username } <span class="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="${ctx}/${userid}"><span class="am-icon-user"></span> 资料</a></li>
                    <li><a href="${ctx}/${userid}/config"><span class="am-icon-cog"></span> 设置</a></li>
                    <li><a href="${ctx}/user/logout"><span class="am-icon-power-off"></span> 注销</a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>
<div class="am-cf admin-main">
    <!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="index.jsp"><span class="am-icon-commenting"></span> 聊天</a></li>
            <li><a href="/Spring/getUserInfo" class="am-cf"><span class="am-icon-book"></span> 个人信息<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-cogs"></span> 设置 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
                    <li><a href="info-setting.jsp"><span class="am-icon-group"></span> 个人设置</a></li>
                    <li><a href="user_space.jsp"><span class="am-icon-cog"></span>心情动态</a></li>                 
                </ul>
            </li>
           <li><a href="friend.jsp"><span class="am-icon-globe"></span>好友动态</a></li>        
            <li><a href="log.html"><span class="am-icon-inbox"></span> 系统日志<span class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
            <li><a href="login.html"><span class="am-icon-sign-out"></span> 注销</a></li>
        </ul>
        <div class="am-panel am-panel-default admin-sidebar-panel">
            <div class="am-panel-bd">
                <p><span class="am-icon-tag"></span> Welcome</p>
                <p>欢迎使用WebChat聊天室~</p>
            </div>
        </div>
    </div>
</div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人设置</strong> / <small>form</small></div>
        </div>

        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab1">基本信息</a></li>
                <li><a href="#tab2">修改头像</a></li>
                <li><a href="#tab3">修改密码</a></li>
            </ul>

            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1"> 
                    <form class="am-form am-form-horizontal" id="information-form" action="/Spring/update" method="post" data-am-validator>
                        <div class="am-form-group">
                            <label for="userid" class="am-u-sm-2 am-form-label">用户名</label>
                            <div class="am-u-sm-10">
                                <input type="text" id="userid" name="userid" value="${user.userid }" disabled>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="nickname" class="am-u-sm-2 am-form-label">昵称</label>
                            <div class="am-u-sm-10">
                                <input type="text" id="nickname" name="nickname" value="${user.nickname }" required placeholder="这里输入你的昵称...">
                            </div>
                        </div>
                  		<div class="am-form-group">
                            <label for="sex" class="am-u-sm-2 am-form-label">验证信息</label>
                            <div class="am-u-sm-10">
                            	<input type="radio" name="checktype" checked="checked" value="1">允许加好友                            	<input type="radio" name="checktype" value="2">需要验证                            	<input type="radio" name="checktype" value="3">拒绝加好友
                            </div> 
                        </div>
                        <div class="am-form-group">
                            <label for="sex" class="am-u-sm-2 am-form-label">性别</label>
                            <div class="am-u-sm-10">
                                <select id="sex" name="sex" data-am-selected>
                                    <option selected></option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div> 
                        </div>
                        <div class="am-form-group">
                            <label for="age" class="am-u-sm-2 am-form-label">年龄</label>
                            <div class="am-u-sm-10">
                                <input type="number" id="age" name="age" min="1" max="100" value="${user.age}" placeholder="这里输入你的年龄...">
                            </div>
                        </div>
                        <div class="am-form-group" style="height:50px;">
                            <label for="profile" class="am-u-sm-2 am-form-label">个性签名</label>
                            <div class="am-u-sm-10">
                                <textarea class="" id="profile" name="profile" rows="4" placeholder="这里可以写下你的个性签名...">${user.profile }</textarea>
                            </div> 
                        </div>
                        <div class="am-form-group">
                            <div class="am-u-sm-10 am-u-sm-offset-2">
                                <button type="submit" class="am-btn am-round am-btn-success"><span class="am-icon-send"></span>提交</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="am-tab-panel am-fade" id="tab2">
                    <form class="am-form am-form-horizontal" action="/Spring/upload" enctype="multipart/form-data" method="post" onSubmit="return checkFileType();" style="text-align: center;">
                        <div style="text-align: center;margin-bottom: 10px">
                            <img class="am-circle" src="/headimages/${user.profilehead }" width="140" height="140" alt="Amayadream"/>
                        </div>
                        <div class="am-form-group am-form-file"  >
                            <button type="button" class="am-btn am-btn-secondary am-btn-sm">
                                <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
                            <input id="file" type="file" name="file" multiple>
                        </div>
                        <div id="file-list"></div>
                        <button type="submit" class="am-btn am-round am-btn-success"><span class="am-icon-upload"></span> 上传头像</button>
                        <script>
                            $(function() {
                                $('#file').on('change', function() {
                                    var fileNames = '';
                                    $.each(this.files, function() {
                                        fileNames += '<span class="am-badge">' + this.name + '</span> ';
                                    });
                                    $('#file-list').html(fileNames);
                                });
                            });
                        </script>
                    </form>
                </div>

                <div class="am-tab-panel am-fade" id="tab3">
                    <form class="am-form am-form-horizontal" data-am-validator action="/Spring/pass" method="post">
                        <div class="am-form-group">
                            <label for="password1" class="am-u-sm-2 am-form-label">原密码</label>
                            <div class="am-u-sm-10">
                                <input type="password" id="password1" name="oldpass" required placeholder="请输入原密码...">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="password2" class="am-u-sm-2 am-form-label">新密码</label>
                            <div class="am-u-sm-10">
                                <input type="password" id="password2" name="newpass" required placeholder="请输入新密码...">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="password3" class="am-u-sm-2 am-form-label">确认新密码</label>
                            <div class="am-u-sm-10">
                                <input type="password" id="password3" data-equal-to="#password2" required placeholder="请确认新密码...">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <div class="am-u-sm-10 am-u-sm-offset-2">
                                <button type="submit" class="am-btn am-round am-btn-success"><span class="am-icon-send"></span> 提交修改</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- content end -->
</div>
<a href="#" class="am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}">
    <span class="am-icon-btn am-icon-th-list"></span>
</a>
<footer style="text-align: center">
    <hr>
<p class="am-padding-left">© 2016 <a href="http://www.qianchengzhidao.com">oracle北京实训基地</a>. </p>
</footer>
</body>
<script type="text/javascript">
 	var chval='${user.checktype}';
 	if(chval=='1'){
 		document.getElemeneByName('checktype')[1].checked=true;
 	}
 	if(chval=='0'){
 		document.getElemeneByName('checktype')[0].checked=true;
 	}
 	if(chval=='2'){
 		document.getElemeneByName('checktype')[2].checked=true;
 	}
 	var sex='${user.sex}';
 	if(sex=='男'){
 		document.getElemeneById('sex')[1].selected=true;
 	}
 	if(sex=='女'){
 		document.getElemeneById('sex')[2].selected=true;
 	}
 </script>
</html>
