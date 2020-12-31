<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="${pageContext.request.contextPath }/framework/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="css/font-awesome.min.css" type="text/javascript"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootsnav.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/normalize.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/css.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath }/framework/jquery-2.0.2.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/framework/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/framework/bootsnav.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.js"
	type="text/javascript"></script>
<!--[if IE]><script src="js/html5.js"></script><![endif]-->
<title>ACGFAN 控制台登录</title>

</head>

<body class="logobg_style">
	<div id="large-header" class="large-header login-page">
		<canvas id="demo-canvas" width="1590" height="711"></canvas>
		<div class="login-form">
			<div class="login-content">
				<h1 class="title_name">ACGFAN 后台登录</h1>
				<c:if test="${!empty  requestScope.loginerror}">

					<div class="title_name">
						<font style="color: red;"> ${  requestScope.loginerror} </font>
					</div>

				</c:if>
				<form method="post" role="form" id="form_login"
					class="login_padding"
					action="${pageContext.request.contextPath }/login">

					<div class="form-group clearfix">

						<div class="input-group">
							<div class="input-group-addon">
								<i class="icon_user"></i>
							</div>

							<input type="text" class="form-control" name="name" id="name"
								placeholder="管理员账户" autocomplete="off"
								value="${requestScope.name }">
						</div>



					</div>

					<div class="form-group clearfix">

						<div class="input-group">
							<div class="input-group-addon">
								<i class="icon_password"></i>
							</div>

							<input type="password" class="form-control" name="password"
								id="password" placeholder="密码" autocomplete="off">
						</div>

					</div>
					<div style="text-align: left;">
						<input type="checkbox" name="rememberMe"> <span
							style="margin-left: 5%"> 记住我</span>
					</div>
					<!-- <div class=" textright">
						<a href="#" class="forget">忘记密码？</a>
					</div> -->
					<div class="tishi"></div>
					<div class="form-group">
						<a href="javascript:;" type="submit"
							class="btn btn-danger btn-block btn-login" onClick="cliLogin()">
							<i class="fa fa-sign-in"></i> 登录
						</a>
					</div>
					<!-- <div class=" textright">
						<a href="registered.html" class="forget">立即注册</a>
					</div> -->
					<!-- Implemented in v1.1.4 -->
					<div class="form-group"></div>




				</form>
			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath }/TweenLite/TweenLite.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/TweenLite/EasePack.min.js"></script>
	<script src="${pageContext.request.contextPath }/TweenLite/rAF.js"></script>
	<script src="${pageContext.request.contextPath }/TweenLite/demo-1.js"></script>
</body>

</html>