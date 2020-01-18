<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功提示</title>
<link rel="stylesheet" href="/assets/css/amazeui.min.css">
<script src="/assets/js/jquery.min.js"></script>
<script type="text/javascript">
	//自动跳转
	function countDown(secs, surl) {
		var jumpTo = document.getElementById('jumpTo');
		jumpTo.innerHTML = secs;
		if (--secs > 0) {
			setTimeout("countDown(" + secs + ",'" + surl + "')", 1000);
		} else {
			location.href = surl;
			-ma
		}
	}
</script>
</head>
<body>
	<div class="am-margin-xl">
		<h1 class="am-text-success am-text-center">${requestScope.message}</h1>
		<div class="am-text-center"><img src="/assets/i/imgs/dance.gif"/></div>
		<p class="am-text-center">
		<a id="jump" href="${requestScope.url}"><span id="jumpTo">3</span>秒后系统会自动跳转，也可点击本处直接跳</a>
		</p>
		<script type="text/javascript">
			countDown(3, $("#jump").attr("href"));
		</script>
	</div>
</body>
</html>
