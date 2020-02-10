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

	<!-- 图片轮播[[ -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top: -25px;">

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">

			<c:forEach items="${requestScope.list}" var="palette" varStatus="current">

				<c:if test="${current.index==0 }">

					<div class="item active">
						<img src="${pageContext.request.contextPath }/static/${palette.src}" class="img-responsive" alt="Responsive image" />
					</div>

				</c:if>
				<c:if test="${current.index!=0 }">
					<div class="item">
						<img src="${pageContext.request.contextPath }/static/${palette.src}" class="img-responsive" alt="Responsive image">
					</div>

				</c:if>

			</c:forEach>



		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- 图片轮播 ]] -->

	<div class="container" style="margin-top: 25px; border-top-style: solid; border-top-width: 1px; border-top-color: lightgray;">
		<div class="row">

			<!-- 图片展示[[ -->
			<div class="col-lg-9 col-md-9">
				<!-- 最新作品[[ -->
				<div style="margin-top: 25px; border-style: solid; border-width: 1px; border-color: lightgray; padding: 25px; padding-top: 10px; padding-bottom: 7px;">
					<div class="row">
						<h4 class="col-lg-10 col-md-10 col-xs-8">
							最新作品
							<small style="color: lightgray;"> New </small>
						</h4>
					</div>
					<c:forEach items="${requestScope.lastest }" var="p" varStatus="status" begin="0" end="7">
						<c:if test="${status.count % 4 == 1}">
							<div class="row">
						</c:if>
						<div class="col-lg-3 col-md-3 col-xs-6">
							<a href="${pageContext.request.contextPath }/palette-detail-show/${p.id }" class="thumbnail" target="_blank">
								<img src="${pageContext.request.contextPath }/static/${p.src }" datasrc="holder.js/100%x180" />
								<div class="caption">
									<h5 class="text-center">${p.name }</h5>
								</div>
							</a>
						</div>
						<c:if test="${status.count % 4 == 0}">
				</div>
				</c:if>
				</c:forEach>
			</div>

			<!-- ]]最新作品 -->

			<!-- 热门标签[[ -->
			<div style="margin-top: 25px; border-style: solid; border-width: 1px; border-color: lightgray; padding: 25px; padding-top: 10px; padding-bottom: 7px;">
				<div class="row">
					<h4 class="col-lg-11 col-md-11 col-xs-9">
						热门标签
						<small style="color: lightgray"> Hot </small>
					</h4>
				</div>

				<div class="row" style="padding-top: 15px;">
					<c:forEach items="${requestScope.map['流行'].list }" var="p" varStatus="status" begin="0" end="3">
						<div class="col-lg-3 col-md-3 col-xs-6">
							<a href="${pageContext.request.contextPath }/palette-detail-show/${p.id }" class="thumbnail" target="_blank">
								<img src="${pageContext.request.contextPath }/static/${p.src }" datasrc="holder.js/100%x180" />
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="row" style="padding-bottom: 15px; border-bottom-style: solid; border-bottom-width: 1px; border-color: lightgray;">
					<a href="${pageContext.request.contextPath }/palette-more-show/${requestScope.map['流行'].id}" target="_blank">
						<button type="button" class="btn btn-default btn-block" id="typeBtn1">
							${requestScope.map["流行"].typeName}
							<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</a>
				</div>
				<div class="row" style="padding-top: 15px;">
					<c:forEach items="${requestScope.map['热门'].list }" var="p" varStatus="status" begin="0" end="3">
						<div class="col-lg-3 col-md-3 col-xs-6">
							<a href="${pageContext.request.contextPath }/palette-detail-show/${p.id }" class="thumbnail" target="_blank">
								<img src="${pageContext.request.contextPath }/static/${p.src }" datasrc="holder.js/100%x180" />
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="row" style="padding-bottom: 15px; border-bottom-style: solid; border-bottom-width: 1px; border-color: lightgray;">
					<a href="${pageContext.request.contextPath }/palette-more-show/${requestScope.map['热门'].id}" target="_blank">
						<button type="button" class="btn btn-default btn-block">
							${requestScope.map['热门'].typeName}
							<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</a>
				</div>
				<div class="row" style="padding-top: 15px;">
					<c:forEach items="${requestScope.map['精品'].list }" var="p" varStatus="status" begin="0" end="3">
						<div class="col-lg-3 col-md-3 col-xs-6">
							<a href="${pageContext.request.contextPath }/palette-detail-show/${p.id }" class="thumbnail" target="_blank">
								<img src="${pageContext.request.contextPath }/static/${p.src }" datasrc="holder.js/100%x180" />
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="row" style="padding-bottom: 15px;">
					<a href="${pageContext.request.contextPath }/palette-more-show/${requestScope.map['精品'].id}" target="_blank">
						<button type="button" class="btn btn-default btn-block">
							${requestScope.map['精品'].typeName}
							<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</a>
				</div>
			</div>
			<!-- ]]热门标签 -->
		</div>
		<!-- ]]图片展示 -->

		<!-- 排行榜[[ -->
		<div class="col-lg-3 col-md-3">

			<div class="row" style="margin-top: 25px; border-bottom-style: solid; border-bottom-color: lightgray; border-bottom-width: 1px;">
				<h4 id="introduce">推荐作品</h4>
			</div>

			<c:forEach items="${requestScope.recommend }" var="r" varStatus="status">
				<div class="row" style="background: #eee; border-radius: 5px; margin-top: 15px;">
					<div class="col-lg-4 col-md-4" style="margin-top: 10px;">
						<a href="${pageContext.request.contextPath }/palette-detail-show/${r.paletteId.id }" target="_blank">
							<img src="${pageContext.request.contextPath }/static/${r.paletteId.src}" datasrc="holder.js/100%x180" class="img-responsive" alt="Responsive image" />
						</a>
					</div>
					<div class="col-lg-8 col-md-8">
						<a href="${pageContext.request.contextPath }/palette-detail-show/${r.paletteId.id }" target="_blank">
							<h5 class="text-left" style="color: black;">${r.paletteId.name}</h5>
						</a>

						<h5 class="text-center" style="color: black;">${r.paletteId.userId.username}</h5>

						<a href="${pageContext.request.contextPath }/palette-detail-show/${r.paletteId.id }" target="_blank">
							<h3 class="text-right" style="color: black;">${status.count}</h3>
						</a>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- ]]排行榜 -->
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