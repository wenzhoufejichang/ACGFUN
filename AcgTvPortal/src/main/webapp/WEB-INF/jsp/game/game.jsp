<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/46833/582d7e08f629d8136ca2db97.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入logo使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/46833/582d7e08f629d8136ca2db97.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入类型标题使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/582db26ff629d8136ca2dbc5.css' rel='stylesheet' type='text/css' />
 --><!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/584044bff629d80748ce1c7d.css' rel='stylesheet' type='text/css' /> -->
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>
<title>游戏中心</title>
<style type="text/css">
#moreGame a {
	color: grey;
}

#moreGame a:hover {
	color: skyblue;
}
</style>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->

	<!--轮播-->
	<div id="myCarousel" class="carousel slide" style="margin-top: -20px;">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">


			<c:forEach items="${requestScope.list }" var="g" varStatus="current">

				<c:if test="${current.index==0 }">

					<li data-target="#myCarousel" data-slide-to="${current.index }" class="active"></li>
				</c:if>
				<c:if test="${current.index!=0 }">

					<li data-target="#myCarousel" data-slide-to="${current.index }"></li>
				</c:if>

			</c:forEach>


		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">


			<c:forEach items="${requestScope.list }" var="g" varStatus="current">

				<c:if test="${current.index==0 }">

					<div class="item active">
						<img src="${pageContext.request.contextPath }/static/${g.src}" alt="First slide">
					</div>
				</c:if>
				<c:if test="${current.index!=0 }">

					<div class="item ">
						<img src="${pageContext.request.contextPath }/static/${g.src}" alt="First slide">
					</div>
				</c:if>

			</c:forEach>
		</div>
	</div>
	<br />
	<br />
	<br />
	<script type="text/javascript">
		$('.carousel').carousel({
			interval : 3000
		})
	</script>
	<!--轮播结束-->
	<!--第三部分-->

	<c:forEach items="${requestScope.games }" var="g" varStatus="status">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<img src="${pageContext.request.contextPath }/${g.src}" class="img-responsive" alt="Responsive image" />
			</div>
			<div class="col-md-2">
				<span style="color: grey; font-size: 18px; font-weight: bold;"> ${g.name} </span>
				<br />
				<br />
				<div style="background-color: lightseagreen; height: 2px; width: 200px;"></div>
				<br />
				<p style="color: grey;">${g.title}</p>
				<br />
				<br />
			</div>
		</div>
		<br>
	</c:forEach>


	<!--第三部分结束-->
	<br />
	<br />
	<br />
	<!--各种游戏-->

	<div class="row" id="moreGame">
		<div class="col-md-2 col-md-offset-2" style="border: 1px solid; border-color: darkgray;">
			<div class="row" style="background-color: lightgray; padding: 5px 0px 5px 8px;">
				<b style="font-size: 20dp;">手机游戏</b>
			</div>
			<div class="row" style="padding: 3px 0px 3px 8px; height: 350px;">
				<p style="color: orange;">新游推荐</p>
				<c:forEach items="${requestScope.iGameintroduces1 }" var="i">
					<a href="javascript:void(0)">${i.name }</a>
					<br />
				</c:forEach>
			</div>
		</div>
		<div class="col-md-4" style="border: 1px solid; border-color: darkgray; margin-left: -1px; margin-right: -1px;">
			<div class="row" style="background-color: lightgray; padding: 5px 0px 5px 8px; height: 30.5px;">
				<b style="font-size: 20dp;"></b>
			</div>
			<div class="row" style="padding: 3px 0px 3px 8px; height: 350px;">
				<p style="color: orange;">热门推荐</p>
				<div class="row">
					<c:forEach items="${requestScope.iGameintroduces2 }" var="i" varStatus="status">
						<c:if test="${status.count % (requestScope.intro2size/2)  == 1}">
							<div class="col-md-6">
						</c:if>
						<a href="javascript:void(0)">${i.name }</a>
						<br />
						<c:if test="${status.count % (requestScope.intro2size/2) == 0}">
				</div>
				</c:if>
				</c:forEach>
			</div>

		</div>
	</div>
	<div class="col-md-2" style="border: 1px solid; border-color: darkgray;">
		<div class="row" style="background-color: lightgray; padding: 5px 0px 5px 8px;">
			<b style="font-size: 20dp;">网页游戏</b>
		</div>
		<div class="row" style="padding: 3px 0px 3px 8px; height: 350px;">
			<p style="color: orange;">网游推荐</p>
			<c:forEach items="${requestScope.iGameintroduces3 }" var="i">
				<a href="javascript:void(0)">${i.name }</a>
				<br />
			</c:forEach>
		</div>
	</div>

	</div>
	<!--各种游戏结束-->
	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->
	<jsp:include page="../common/friend_link.jsp"></jsp:include>
	<!-- 友情链接部分 ]] -->
</body>
</html>