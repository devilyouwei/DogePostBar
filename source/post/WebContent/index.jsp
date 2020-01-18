<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Doge的贴吧</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
</head>
<body>
	<div class="am-container">
		<h1 class="am-margin am-text-center">突然出现的Doge</h1>
		<p class="am-alert am-alert-primary">
			自制了一个精简版的贴吧，只能在科技园局域网ip访问，只可以发帖，发评论以及回复！</p>
		<!--
			<p class="am-alert am-alert-primary">
			
			</p>
			-->
		<div class="am-text-center">
			<img src="/assets/i/imgs/myface.gif" />
			<p>
				<a href="user/list.action"
					class="am-text-center am-btn am-btn-xl am-btn-danger am-radius">进入贴吧</a>
				<a href="admin/login.action"
					class="am-text-center am-btn am-btn-xl am-btn-danger am-radius">管理员上线</a>
			</p>
		</div>
	</div>
</body>
</html>