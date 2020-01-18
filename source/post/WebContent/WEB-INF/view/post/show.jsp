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
<title></title>
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

a {
	cursor: pointer;
}

.form-hid {
	display: none;
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
		nowpage = getUrlParam("nowpage");
		if (nowpage == undefined) {
			nowpage = 0;
		}
		$("input[name=nowpage]").val(nowpage);
		$("#review_form").submit(function() {
			if ($.trim($("textarea[name=content]").val()) == "") {
				return false;
			}
		});
		$(".form-hid").submit(
				function() {
					if ($.trim($(this).children(".am-input-group").children(
							"input[name=content]").val()) == "")
						return false;
					return true;
				});
		/*
		$(".form-hid input[name=content]").blur(function(){
			$(this).parents(".form-hid").hide();
		});
		 */
	});

	//to_ip表示回复指向的ip
	//id表示所在评论的id
	function response(to_ip, id) {
		$(".form-hid").hide();
		//修改表单数据
		$("#review_form" + id + " input[name=content]").val(
				"【To " + to_ip + "】");
		$("#review_form" + id + " > input[name=to_ip]").val(to_ip);
		$("#review_form" + id).show()
		$("#review_form" + id + " input[name=content]").focus();
	}
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
	}
</script>
</head>
<body>

	<div class="am-container am-margin-vertical-xl">
		<p>
			<a href="list.action">返回帖子列表</a>
		</p>
		<article class="am-article">
			<div class="am-article-hd">
				<h1 class="am-article-title">${requestScope.show.title}</h1>
				<div class="am-g am-article-meta am-padding-0">
					<div class="am-u-sm-3 am-padding-0">发布IP：${requestScope.show.post_ip}</div>
					<div class="am-u-sm-3 am-padding-0">创建时间：${requestScope.show.create_time}</div>
					<div class="am-u-sm-3 am-padding-0">大名：${requestScope.show.username}</div>
					<div class="am-u-sm-3 am-padding-0">累计评价：${requestScope.show.count_review}</div>

				</div>
			</div>
			<article class="am-margin-vertical">${requestScope.show.content}</article>
		</article>
	</div>
	<hr>

	<div class="am-container am-margin-vertical-xl">
		<div id="posts_list">
			<ul class="am-list am-list-static am-list-border">
				<c:forEach items="${list}" var="list" varStatus="num">
					<li>
						<p class="am-padding-horizontal-sm am-text-lg">${list.content}</p>

						<c:forEach items="${list.responses}" var="list2" varStatus="num">
							<p class="am-text-sm">${list2.ip}${list2.content}【${list2.create_time}】<a
									class="a-hid" onclick="response('${list2.ip}','${list.id}')">回复</a>
							</p>
						</c:forEach>

						<form class="am-form form-hid" id="review_form${list.id}"
							method="post" action="response.action">
							<div class="am-input-group">
								<input type="text" name="content"
									class="am-form-field am-input-sm"> <span
									class="am-input-group-btn">
									<button class="am-btn am-btn-sm am-btn-default" type="submit">确认</button>
								</span>
							</div>
							<input type="hidden" name="to_ip" value="${list.ip}" /> <input
								type="hidden" name="review_id" value="${list.id}" /> <input
								type="hidden" name="post_id" value="${requestScope.show.id}" />
							<input type="hidden" name="nowpage"
								value="${requestScope.nowpage}" />
						</form> <br>
						<div class="am-g am-text-xs">
							<div class="am-u-sm-3">创建时间：${list.create_time}</div>
							<div class="am-u-sm-3">来自IP：${list.ip}</div>
							<div class="am-u-sm-3">回复数：${list.count_response}</div>
							<div class="am-u-sm-3">
								<a onclick="response('${list.ip}','${list.id}')">回复</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div class="page am-margin-vertical-lg">
			页面：
			<c:forEach items="${page}" var="page">
				<a href="show.action?id=${requestScope.show.id}&nowpage=${page}">${page+1}</a>&nbsp;
			</c:forEach>
		</div>
	</div>

	<hr>
	<div class="am-container am-margin-vertical-xl">
		<form name="review_form" id="review_form" method="post"
			action="review.action">
			<textarea name="content" rows="10" style="width: 100%;"></textarea>
			<button class="am-fr am-btn am-btn-primary">评论</button>
			<input type="hidden" name="post_id" value="${requestScope.show.id}" />
		</form>
	</div>

</body>
</html>
