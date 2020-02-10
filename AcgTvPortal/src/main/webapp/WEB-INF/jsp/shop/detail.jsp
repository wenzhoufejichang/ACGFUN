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

<script type="text/javascript">
	$(function() {
		$("#delete").click(function() {
			var number = $("#number").val();

			if (number == 1) {

				return false;
			} else {

				number--;
				$("#number").val(number);
			}
		});
		$("#add").click(function() {
			var number = $("#number").val();
			number++;
			$("#number").val(number);

		});
	});
</script>
<title>商品详情</title>
<style type="text/css">
.question_bar {
	width: 100%;
	height: 300px;
	background-color: orange;
	margin-top: -21px;
	background: url(photo/account/question_bar.png) no-repeat center center;
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
	background-color: #EEEEEB;
}
/*  ----------------------------------------------------------------*/

/*商品详情部分*/
#de_bg {
	background-color: white;
}

.detail_layout {
	display: table;
	width: auto;
	margin-left: auto;
	margin-right: auto;
}

.detail_p1 {
	font-size: 25px;
	font-weight: 100;
	padding-bottom: 40px;
	padding-top: 40px;
}

.detail_p2 {
	font-size: 30px;
	font-weight: 100;
	color: red;
	vertical-align: bottom;
}

.detail_p3 {
	font-weight: 100;
	color: gray;
	padding-left: 10px;
	padding-top: 15px;
	vertical-align: bottom;
}

.buy {
	padding-top: 160px;
}

.detail_p4 {
	font-weight: 100;
	color: black;
	font-size: 20px;
	padding-left: 60px;
	padding-top: 30px;
	padding-bottom: 1px;
	/*	vertical-align: bottom;*/
}
/*  ----------------------------------------------------------------*/
</style>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->






	<!--goods detail界面-->
	<div id="de_bg">
		<div class="row ">
			<div class="col-md-6 detail_layout">
				<img src="${pageContext.request.contextPath }/static/${good.photoDesc}">
			</div>

			<div class="col-md-6 detail_layout">
				<div class="row detail_p1">
					<p>${good.name}</p>
				</div>
				<div class="row">
					<div class="col-md-2">
						<p class="detail_p3">价格：</p>
					</div>
					<div class="col-md-3">
						<p class="detail_p2">
							<fmt:formatNumber value="${good.price}" type="currency" pattern="¥.00"></fmt:formatNumber>
						</p>
					</div>
					<div class="col-md-6 detail_p3">
						<strike>
							市场价:
							<fmt:formatNumber value="${good.price*1.2}" type="currency" pattern="¥.00"></fmt:formatNumber>
						</strike>
					</div>
				</div>
				<hr />
				<div class="row" style="margin-top: 50px;">
					<div class="col-md-2">
						<p class="detail_p3">数量</p>
					</div>

					<div class="col-md-6" style="margin-top: 8px;">
						<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="delete">
									<i class="glyphicon glyphicon-minus""></i>
								</button>
							</span>
							<input type="number" class="form-control" value="1" id="number">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="add">
									<i class="glyphicon glyphicon-plus""></i>
								</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<div class="row buy">
					<div class="col-md-4">
						<button type="button" class="btn btn-danger">立即购买</button>
					</div>
					<div class="col-md-4">
						<button type="button" class="btn btn-default">放入购物车</button>
					</div>
				</div>
			</div>
		</div>

		<!--商品详情-->
		<div class="row detail_p4">
			<p>商品详情</p>
		</div>
		<hr />
		<div class="detail_layout" style="text-align: center;">
			<img src="${pageContext.request.contextPath }/static/photo/shop/img_detail/goods_detail.jpg" />
		</div>






		<br>
		<br>
		<br>
		<!-- 友情链接部分 [[ -->
		<jsp:include page="../common/friend_link.jsp"></jsp:include>
		<!-- 友情链接部分 ]] -->
</body>
</html>