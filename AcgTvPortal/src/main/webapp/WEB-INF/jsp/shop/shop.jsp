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
<title>周边商城</title>
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
/*
			 * Description : 周边页面
			 * Time : 2016 / 11 / 21
			 * Author : li
			 * */

/*通用样式, 消除默认外边距, 以body元素为基准*/
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
	height: 100%;
	background-color: rgb(248, 248, 248);
}
/*  ----------------------------------------------------------------*/
/*轮播部分*/
.lunbo {
	height: 400px;
	width: 100%;
	vertical-align: middle;
	display: table;
	width: auto;
	margin-left: auto;
	margin-right: auto;
}
/*  ----------------------------------------------------------------*/
/*menu bar 菜单部分*/
.menu {
	padding: 10px 0px;
	margin: 10px 0px;
	display: table;
	width: auto;
	margin-left: auto;
	margin-right: auto;
}
/*  ----------------------------------------------------------------*/
/*goods 商品部分*/
.goods {
	/*background-color: aquamarine;*/
	display: table;
	width: auto;
	margin-left: auto;
	margin-right: auto;
}

.goods_border {
	border: 1px solid gray;
}

.goods_img {
	padding-left: 15px;
}

.goods_p1 {
	height: 30px;
	font-size: 16px;
	padding-bottom: 2px;
	padding-left: 8px
}

.goods_p2 {
	padding-top: 15px;
	color: red;
	padding-left: 8px;
}

.goods_p3 {
	color: darkgray;
	font-size: 14px;
	padding-left: 8px;
}

p {
	color: black;
}
/*  ----------------------------------------------------------------*/
</style>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->

	<!-- 商城主站部分 [[ -->
	<!--        轮播部分                   -->
	<div id="myCarousel" class="carousel slide hidden-xs" style="margin-top: -22px;">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">

			<c:forEach items="${requestScope.list }" var="g" varStatus="current">

				<c:if test="${ current.index==0}">

					<li data-target="#myCarousel" data-slide-to="${current.index }" class="active"></li>

				</c:if>

				<c:if test="${ current.index!=0}">

					<li data-target="#myCarousel" data-slide-to="${current.index }"></li>

				</c:if>


			</c:forEach>



		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">

			<c:forEach items="${requestScope.list }" var="g" varStatus="current">

				<c:if test="${ current.index==0}">


					<div class="item active">
						<a href="${ g.buySrc }" target="_blank">
							<img src="${pageContext.request.contextPath }/static/${g.photoSrc }" style="width: 100%">
						</a>

					</div>

				</c:if>
				<c:if test="${ current.index!=0}">



					<div class="item" style="text-align: center;">
						<a href="${ g.buySrc }" target="_blank">
							<img src="${pageContext.request.contextPath }/static/${g.photoSrc }" style="width: 100%">
						</a>
					</div>


				</c:if>



			</c:forEach>



		</div>
		<!-- 轮播（Carousel）导航 -->
		<!-- 		<a class="carousel-control left" href="#myCarousel"
		data-slide="prev">
		</a>
		<a class="carousel-control right" href="#myCarousel"
		data-slide="next">
		</a> -->
	</div>
	<script type="text/javascript">
		$('.carousel').carousel({
			interval : 3000
		})
	</script>
	<br>
	<br>
	<!--       goods 商品部分                   -->

	<c:forEach items="${requestScope.listgoods }" var="g" varStatus="status">
		<c:if test="${status.count % 4 == 1}">
			<div class="goods">
		</c:if>
		<div class="col-md-3">
			<a href="${pageContext.request.contextPath }/detail/${g.id}" target="_blank">

				<div class="row goods_img">
					<img src="${pageContext.request.contextPath }/static/${g.photoDesc}" class="img-rounded" />
				</div>
			</a>

			<hr width="100%" style="border: 1px solid gainsboro;" />
			<div class="row" style="text-align: center;">
				<a href="${pageContext.request.contextPath }/detail/${g.id}" target="_blank">
					<p class="goods_p1">${g.name}</p>
				</a>
			</div>
			<div class="row" style="margin-top: -25px; text-align: center;">
				<p class="goods_p2">
					<strong>
						<fmt:formatNumber value="${g.price}" type="currency" pattern="¥.00"></fmt:formatNumber>
					</strong>
				</p>
			</div>
			<div class="row">
				<p class="goods_p3" style="font-size: 12px; text-align: center;">
					市场价
					<fmt:formatNumber value="${g.price*1.2}" type="currency" pattern="¥.00"></fmt:formatNumber>
				</p>
			</div>
		</div>
		<c:if test="${status.count % 4 == 0}">
			</div>
		</c:if>
	</c:forEach>


	<!-- 商城主站部分 ]] -->

	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->
	<jsp:include page="../common/friend_link.jsp"></jsp:include>
	<!-- 友情链接部分 ]] -->
</body>
</html>