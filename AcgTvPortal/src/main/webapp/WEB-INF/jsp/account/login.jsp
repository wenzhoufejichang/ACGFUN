<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<!-- 引入Title图标 -->
<link href="${pageContext.request.contextPath }/static/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<!-- 声明页面信息与字符编码集 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 声明移动端响应式布局-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入Bootstrap框架样式部分-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/framework/bootstrap.min.css" />
<!-- 引入该页面对应样式表 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/index.css" />
<!-- 引入logo使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/46833/582d7e08f629d8136ca2db97.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入类型标题使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/582db26ff629d8136ca2dbc5.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>
<title>用户登录</title>
<style type="text/css">
body {
	background-color: rgb(251, 251, 251);
}

button {
	margin-left: 20px;
}
</style>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->
	<br>
	<br>
	<!-- 登录主题内容 [[ -->
	<form action="${pageContext.request.contextPath }/account-login-execute" method="post">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<img src="${pageContext.request.contextPath }/static/photo/account/account_background.png" alt="" class="img-responsive" />
				</div>
				<div class="col-lg-4 col-md-6 col-lg-offset-1">
					<br>
					<br>
					<br>
					<br>
					<c:if test="${!empty  requestScope.loginerror}">

						<div style="position: absolute;">
							<font style="color: red;"> ${  requestScope.loginerror} </font>
						</div>

					</c:if>

					<h3>
						<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>
						登录
						<span style="font-weight: bold;" class="css716dd981b5489">ACGFUN</span>

					</h3>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</div>
							<input class="form-control" type="text" placeholder="请输入用户名" id="usernameInput" name="username" value="${requestScope.name }">
							<!--用户名存在显示-->
							<c:if test="${!empty requestScope.username }">
								<font style="color: red;"> ${requestScope.username } </font>
							</c:if>
							<span class="glyphicon glyphicon-ok form-control-feedback" style="display: none" id="existName"></span>
							<!--用户名不存在显示-->
							<span class="glyphicon glyphicon-remove form-control-feedback" style="display: none" id="noExistName"></span>
						</div>
						<br>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="glyphicon glyphicon-lock"></i>
							</div>
							<input class="form-control" type="password" placeholder="请输入密码" name="password" id="passwordInput">
							<c:if test="${!empty requestScope.password }">
								<font style="color: red;"> ${requestScope.password } </font>
							</c:if>
						</div>
					</div>
					<a type="button" class="btn btn-default pull-right" id="registerBtn" style="margin-left: 20px" href="${pageContext.request.contextPath }/account-question-show">&nbsp;&nbsp;注册&nbsp;&nbsp;</a>
					<button type="submit" class="btn btn-default pull-right" style="background-color: #f36c60; color: white;" id="loginBtn">&nbsp;&nbsp;登录&nbsp;&nbsp;</button>

				</div>

			</div>

		</div>
	</form>
	<!-- 登录主题内容 ]] -->

	<!-- 管理员登录模态框 [[ -->
	<!-- Large modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm" id="myModal" style="display: none;">Admin Login</button>

	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<h2 style="text-align: center;">Admin Login</h2>
				<form role="form" action="admin-login" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">
							&nbsp;&nbsp;
							<i class="glyphicon glyphicon-briefcase"></i>
							Admin
						</label>
						<input type="text" class="form-control" id="" placeholder="请输入管理员名" name="username">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							&nbsp;&nbsp;
							<i class="glyphicon glyphicon-lock"></i>
							Password
						</label>
						<input type="password" class="form-control" id="" placeholder="请输入管理员密码" name="password">
					</div>
					<br>
					<button type="submit" class="btn btn-default center-block">登录</button>
					<br>
				</form>
			</div>
		</div>
	</div>
	<!-- 管理员登录模态框 ]] -->

	<script type="text/javascript">
		$("#usernameInput")
				.change(
						function() {
							var val = $(this).val();
							val = $.trim(val);
							$(this).val(val);
							if (val == "$admin") {
								$("#existName").css("display", "none");
								$("#noExistName").css("display", "none");
								$("#usernameInput").val("");
								$("#myModal").click();
								return;
							}
							var url = "${pageContext.request.contextPath}/account-username-ajax";
							var args = {
								"username" : val,
								"time" : new Date()
							};
							$.post(url, args, function(data) {
								if (data == 1) {
									$("#existName").css("display", "inline");
									$("#noExistName").css("display", "none");
								} else if (data == -1) {
									$("#existName").css("display", "none");
									$("#noExistName").css("display", "inline");
								} else if (data == 0) {
									$("#existName").css("display", "none");
									$("#noExistName").css("display", "none");
								}
							});
						});
		$("#loginBtn").on(
				"click",
				function() {
					if ($("#usernameInput").val() == ""
							|| $("#passwordInput").val() == "") {
						alert("用户名或密码不能为空,请检查后重试!");
						return false;
					}
				})
	</script>
</body>
</html>