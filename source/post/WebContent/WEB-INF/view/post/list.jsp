<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>万狗奔腾的doge贴吧(⊙_⊙?)</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="/assets/i/favicon.png">
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed"
	href="/assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileImage"
	content="/assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">
<link rel="stylesheet" href="/assets/css/amazeui.min.css">
<link rel="stylesheet" href="/assets/css/app.css">
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="/assets/js/amazeui.min.js"></script>
<link rel="stylesheet" href="/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="/kindeditor/plugins/code/prettify.js"></script>


<style>
#error {
	display: none;
}
.img1{
	width:100px;
}
</style>
<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content"]', {
			cssPath : '/kindeditor/plugins/code/prettify.css',
			uploadJson : '/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterBlur : function() {
				this.sync()
			},
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});

	$(function() {
		$("#post_form").submit(function() {
			if ($.trim($("input[name=title]").val()) == "") {
				$("#error").text("写上标题啊喂！！").fadeIn(300).fadeOut(2500);
				return false;
			}
			if ($.trim($("textarea[name=content]").val()) == "") {
				$("#error").text("没有内容吗？？").fadeIn(300).fadeOut(2500);
				return false;
			}
			
		});
	});
</script>
</head>
<body>
	<div class="am-container">
		<div class="am-g">
			<div class="am-u-sm-10">
				<h2><img class="img1" src="/assets/i/imgs/logo.jpg"/><span class="am-text-xl">的贴吧</span><img class="img2" src="/assets/i/imgs/pao.gif"/></h2>
			</div>
				
			<div class="am-u-sm-2 am-text-right am-padding-vertical">
				<a href="/">返回首页</a>
			</div>
		</div>

		<p>${requestScope.message}</p>
		<form action="add.action" method="post"
			class="am-form am-margin-vertical" name="post_form" id="post_form">
			<input type="text" name="title" placeholder="有什么话题就说吧"
				class="am-margin-vertical-sm" />
			<textarea rows="10" name="content" style="visibility: hidden;"></textarea>

			<div class="am-g am-padding-0 am-margin-vertical-sm">
				<div class="am-u-lg-8 am-padding-0 am-padding-right-sm">
					<div class="am-alert-danger am-padding-xs" id="error"></div>
				</div>
				<div class="am-u-lg-4 am-padding-0 am-margin-0">
					<div class="am-input-group">
						<input type="text" name="username" placeholder="发帖留名"
							class="am-form-field" /> <span class="am-input-group-btn">
							<button type="submit" class="am-btn am-btn-primary am-btn-lg">发帖</button>
						</span>
					</div>
				</div>
			</div>



		</form>

	</div>


	<div class="am-container am-margin-vertical-xl">

		<h2>累计发帖：${requestScope.count_post}</h2>
		<div id="posts_list">
			<ul class="am-list am-list-static am-list-border">
				<c:forEach items="${list}" var="list" varStatus="num">
					<li><a href="show.action?id=${list.id}" style="font-weight:bold"><c:if
								test="${list.sort==0}">
								<font class="am-text-danger">置顶</font>
							</c:if>${list.title}</a>
						<p class="am-padding-horizontal-sm am-text-truncate am-text-sm">${list.content}</p>
						<div class="am-g am-text-xs am-margin-top-lg am-text-default">
							<div class="am-u-sm-3">创建时间：${list.create_time}</div>
							<div class="am-u-sm-3">发布ip：${list.post_ip}</div>
							<div class="am-u-sm-3">大名：${list.username}</div>
							<div class="am-u-sm-3">评论数：${list.count_review}</div>
						</div></li>
				</c:forEach>
			</ul>
		</div>

		<div class="page am-margin-vertical-lg">
			页面：
			<c:forEach items="${page}" var="page">
				<a href="list.action?nowpage=${page}">${page+1}</a>&nbsp;
			</c:forEach>
		</div>
	</div>

	<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1"
		id="doge-loading">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">正在载入...</div>
			<div class="am-modal-bd">
				<span class="am-icon-spinner am-icon-spin"></span>
			</div>
		</div>
	</div>
</body>
</html>
