<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebChat | 关于</title>
    <link rel="stylesheet" href="static/plugins/amaze/css/amazeui.min.css">
    <link rel="stylesheet" href="static/plugins/amaze/css/admin.css">
    <link rel="stylesheet" href="static/plugins/contextjs/css/context.standalone.css">
    <script src="static/plugins/jquery/jquery-2.1.4.min.js"></script>
    <script src="static/plugins/amaze/js/amazeui.min.js"></script>
    <script src="static/plugins/amaze/js/app.js"></script>
    <script src="static/plugins/layer/layer.js"></script>
    <script src="static/plugins/laypage/laypage.js"></script>
    <script src="static/plugins/contextjs/js/context.js"></script>
	<link rel="stylesheet" type="text/css" href="static/layui/css/layui.css">
	<script type="text/javascript" src="static/layui/layui.js"></script> 
	<script type="text/javascript">
		layui.use(['upload'],function(){
			var upload = layui.upload,
			$=layui.$;
			upload.render({
				   elem: '#test2',
				   url: '/Spring/upspaceimage',
				   multiple: true,
				   accept:'images',
				   exts:'jpg|png|gif|bmp|jpeg',
				   size:2048,
				   before: function(obj){
				      //预读本地文件示例，不支持ie8
				      obj.preview(function(index, file, result){
				        $('#demo2').append('<img width="80px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img upload-img">')
				      });
				    }
				    ,done: function(res){ 
				      $("#saveform").append("<input type='text' name='pics' value='"+res.imgurl+"'>")
				    }
				  });
		})
		
		
		
		//分页	
		function changepages(npage){
			
			location.href="/Spring/doReadSpaceList?nowpage="+npage;
    	}
	</script>	
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
                    ${user.nickname } <span class="am-icon-caret-down"></span>
                </a>
            </li>
        </ul>
    </div>
</header>
<div class="am-cf admin-main" style="height:400px;">
<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="index.jsp"><span class="am-icon-commenting"></span> 聊天</a></li>
            <li><a href="/Spring/getUserInfo" class="am-cf"><span class="am-icon-book"></span> 个人信息<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-cogs"></span> 设置 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
                    <li><a href="/Spring/infoSetting"><span class="am-icon-group"></span> 个人设置</a></li>
                    <li><a href="/Spring/doReadSpaceList"><span class="am-icon-cog"></span>心情动态</a></li>                 
                </ul>
            </li>
           <li><a href="/Spring/dofriend"><span class="am-icon-globe"></span>好友动态</a></li>        
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
    <div class="admin-content" style="height:450px;">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人空间</strong> / <small>about</small></div>
        </div>
        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab1">发表动态</a></li>
                <li><a href="#tab2">动态列表</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                    <hr>
                    <blockquote>
                          <form class="am-form am-form-horizontal" id="saveform" action="/Spring/addspace" method="post" data-am-validator>
						<div class="layui-upload" style="padding-left:30px;">
							<table>
							<tr>
							<td width="650px">
							<blockquote class="layui-elem-quote layui-quote-nm"	style="margin-top: 10px;">
							预览图：
							<div class="layui-upload-list" id="demo2"></div>
							</blockquote>
							</td>
							<td><button type="button" class="am-btn am-round am-btn-success" id="test2" >添加图片</button></td>
							</tr>
							</table>
						</div>		
						  <div class="am-form-group" style="height:50px;">
                            <label for="profile" class="am-u-sm-2 am-form-label">个性签名</label>
                            <div class="am-u-sm-10">
                                <textarea class="" id="profile" name="content" rows="4" placeholder="这里可以写下你的个性签名...">生命不息，奋斗不止</textarea>
                            </div> 
                       	 </div>
	
                        <div class="am-form-group">
                            <div class="am-u-sm-10 am-u-sm-offset-2">
                                <button type="submit" class="am-btn am-round am-btn-success"><span class="am-icon-send"></span> 提交</button>
                            </div>
                        </div>
						</form>
                    </blockquote>
                </div>

                <div class="am-tab-panel am-fade am-in am-scrollable-vertical" style="height:300px;"  id="tab2">
                    <hr>
             
                    <blockquote>
                   <ul class="am-comments-list am-comments-list-flip" id="chat">        
                 <c:forEach var="space" items="${spacelist }">
                <li class="am-comment am-comment-primary">
                <a href="#link-to-user-home">
                	<img width="48" height="48" class="am-comment-avatar" alt="" src="/Spring/headimages/${user.profilehead }"></a>
                <div class="am-comment-main">
                <header class="am-comment-hd">
                <div class="am-comment-meta"> 
                <a class="am-comment-author" href="#link-to-user">${user.nickname }</a> 发表于
                <time>${space.createdate }</time><a href="javascript:showReplyDiv(${space.id })">回复${space.nickname }</a></div>
                </header>
                <div class="am-comment-bd"> <p>${space.content }</p>
                	<c:forEach var="imgpath" items="${space.picList }">
					<img width="48" height="48" style="border:solid 1px #666;"  alt="" src="/Spring/space_images/${imgpath }"/>
					</c:forEach>
				</div>
					<!--回复列表-->
					<ul class="am-comments-list am-comments-list-flip" id="chat">
						<c:forEach var="reply" items="${space.replyList }">
						<li class="am-comment">
						<img width="48" height="48" class="am-comment-avatar" alt="" src="/Spring/headimages/${user.profilehead }"">
						<div class="am-comment-main">
							<div class="am-comment-meta">   
							<a class="am-comment-author" href="#link-to-user">${reply.nickname }</a> 回复于<time>${reply.createdate }</time>
							<a href="javascript:showReplyDiv()">回复${reply.nickname }</a></div>
							${reply.content }</div>
						</li> 			   
						</c:forEach> 				
					</ul>

					<!--回复列表-->
                </div>
		
				</li> 
				</c:forEach>                        
                </ul>      
                    </blockquote>           
					<a href="javascript:changepages(1)">首页</a>|
					<a href="javascript:changepages(${backpage })">上一页</a>|
					<a href="javascript:changepages(${nextpage })">下一页</a>|
					<a href="javascript:changepages(${pagecount })">尾页</a>(${nowpage}/${pagecount})
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
</html>