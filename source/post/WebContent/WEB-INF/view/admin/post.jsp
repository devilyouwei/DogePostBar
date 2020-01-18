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
<title>吧主在此，有什么事？</title>
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
<script>
	$(function() {
		$(".select_all").change(function() {
			$("input[name=post_id]").prop("checked", $(this).prop("checked"));
		});
		$("#delforever").submit(function() {
			return confirm("确实要删除选中项？删除后不可恢复，你可以选择改变状态，以便恢复帖子");
		});

	});
</script>
</head>

<body>
	<div class="am-container am-margin-vertical-xl">

		<h1 class="am-text-center am-text-success">放肆，吧主在此！</h1>
		<h2 class="am-g am-margin-vertical">
			<span class="am-u-sm-6 am-text-left"><a href="/">回首页</a></span> <span
				class="am-u-sm-6 am-text-right"><a href="logout.action">下线</a></span>
		</h2>
		<form action="delforever.action" method="post" id="delforever"
			class="am-margin-vertical-xl">
			<table class="am-table am-table-striped am-table-hover">
				<tr>
					<th><input type="checkbox" class="select_all" />&nbsp;ID</th>
					<th>标题</th>
					<th>创建时间</th>
					<th>发布IP</th>
					<th>大名</th>
					<th>评论数</th>
					<th>状态</th>
				</tr>

				<c:forEach items="${list}" var="list" varStatus="num">
					<tr>
						<td><input type="checkbox" name="post_id" value="${list.id }" />&nbsp;${list.id}</td>
						<td>${list.title}</td>
						<td>${list.create_time}</td>
						<td>${list.post_ip}</td>
						<td>${list.username}</td>
						<td>${list.count_review}</td>
						<td><a
							href="delete.action?id=${list.id}&nowpage=${requestScope.nowpage}"><c:choose>
									<c:when test="${list.is_del==1}">已删除</c:when>
									<c:otherwise>可见</c:otherwise>
								</c:choose></a>&nbsp;&nbsp; <a
							href="top.action?id=${list.id}&nowpage=${requestScope.nowpage}"><c:choose>
									<c:when test="${list.sort==1}">非置顶</c:when>
									<c:otherwise>已置顶</c:otherwise>
								</c:choose></a>
					</tr>
				</c:forEach>

			</table>
			<button class="am-btn am-btn-sm am-btn-danger" id="delall">删除选中</button>
			<input type="hidden" name="nowpage" value="${requestScope.nowpage}" />
		</form>
		<div class="page am-margin-vertical-lg">
			页面：
			<c:forEach items="${page}" var="page">
				<a href="post.action?nowpage=${page}">${page+1}</a>&nbsp;
			</c:forEach>
		</div>

	</div>
</body>
</html>