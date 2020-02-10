<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/583304a6f629d816742d34f6.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>
<title>画友</title>
<style type="text/css">
.register_bar {
	width: 100%;
	height: 300px;
	background-color: orange;
	margin-top: -21px;
	background:
		url(${pageContext.request.contextPath}/static/photo/account/register_bar.png)
		no-repeat center center;
	background-size: cover;
}

td p {
	margin-left: 40px;
}

td h4 {
	margin-left: 30px;
}

#introduce {
	color: #f36c60;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->

	<!-- 网站主体 [[ -->

	<div class="container" style="background-color: rgb(245, 245, 245);">
		<div class="row" style="margin-bottom: 50px;">
			<!--用户信息[[-->
			<div class="col-lg-1 col-md-1 col-sm-2 col-xs-3" style="margin-right: 50px;">
				<div class="row">

					<img src="${pageContext.request.contextPath }/${requestScope.palette.userId.icon}" class="img-circle col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center" alt="Responsive image" />

					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="row">
							<br />
						</div>
						<div class="row">

							<h5 class="text-center">${requestScope.palette.userId.username}</h5>

						</div>
					</div>
				</div>
			</div>
			<!--]]用户信息-->

			<!--作品信息[[-->
			<div class="col-lg-10 col-md-10 col-sm-9 col-xs-7">
				<div class="row">
					<h3 class="text-center">${requestScope.palette.name}</h3>
				</div>
				<div class="row text-center" style="background-color: white;">
					<h6>
						&nbsp; TAG:${requestScope.palette.paletteType.typeName} &nbsp;&nbsp; / &nbsp;&nbsp;
						<span class="glyphicon glyphicon-time"></span>
						<fmt:formatDate value="${requestScope.palette.createTime}" pattern="yyyy-MM-dd hh:mm:ss" />
						&nbsp;&nbsp;
					</h6>
				</div>
			</div>
			<!--]]作品信息-->
		</div>
		<div class="row" style="border: 1px solid; border-color: rgb(221, 221, 221); margin-bottom: 50px;">
			<!--图片展示[[-->
			<div class="row" style="background-color: rgb(251, 251, 251); padding-top: 40px; padding-bottom: 40px; margin-left: 0px; margin-right: 0px;">
				<div class="col-lg-3 col-md-3 col-xs-3" style="padding: 0px;"></div>
				<img src="${pageContext.request.contextPath }/static/${requestScope.palette.src}" class="col-md-6 col-xs-6 text-center" alt="Responsive image" style="padding: 0px;" />
				<div class="col-lg-3 col-md-3 col-xs-3" style="padding: 0px;"></div>
			</div>
			<!--]]图片展示-->
		</div>
	</div>

	<!-- 网站主体 ]] -->

	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->
	<jsp:include page="../common/friend_link.jsp"></jsp:include>
	<!-- 友情链接部分 ]] -->
</body>
</html>