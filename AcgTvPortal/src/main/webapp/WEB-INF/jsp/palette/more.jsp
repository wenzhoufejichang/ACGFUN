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
	<div class="container" style="border: 1px solid; border-color: #DDDDDD;">
		<div class="row" style="background-color: #F5F5F5; border-bottom: 1px solid; border-color: #DDDDDD;">
			<h4 style="margin-left: 20px;">${requestScope.paletteType.typeName }</h4>
		</div>
		<div style="background-color: #FFFFFF; padding-top: 20px;">
			<c:forEach items="${requestScope.list }" var="p" varStatus="status">
				<c:if test="${status.count % 6 == 1}">
					<div class="row">
				</c:if>
				<div class="col-lg-2 col-md-2 col-xs-4">
					<div class="thumbnail">
						<a href="${pageContext.request.contextPath }/palette-detail-show/${p.id }" target="_blank">
							<img src="${pageContext.request.contextPath }/static/${p.src}" datasrc="holder.js/100%x180" />
						</a>

						<div class="caption"style="text-align: center;">
							<a href="${pageContext.request.contextPath }/palette-detail-show/${p.id }" target="_blank"> ${p.name} </a>

							<div>${p.userId.username }</div>
						</div>
					</div>
				</div>
				<c:if test="${status.count % 6 == 0}">
		</div>
		</c:if>
		</c:forEach>

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