<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员-登陆</title>
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
	<div class="am-container am-margin-vertical-xl">
		<form action="dologin.action" method="post" name="login_form"
			id="login_form" class="am-form">
			<h1 class="am-text-center">管理员上线</h1>
			<p class="am-text-danger">${requestScope.message }</p>
			<label for="username">username:</label><input type="text"
				name="username" id="username" />
			<p></p>
			<label for="password">password:</label><input type="password"
				name="password" id="password" />
			<p></p>
			<input type="submit" name="sub_form" id="sub_form" value="Sign in"
				class="am-btn am-btn-primary am-btn-block" />
		</form>
	</div>

</body>
</html>