<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
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
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/46833/582d7e08f629d8136ca2db97.css' rel='stylesheet' type='text/css' /> -->
<!-- 引入类型标题使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/582db26ff629d8136ca2dbc5.css' rel='stylesheet' type='text/css' />
<link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/584044bff629d80748ce1c7d.css' rel='stylesheet' type='text/css' / -->
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>

<title>ACGFUN,让我们一起搞事情!~</title>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->


	<!-- 主站bar图 [[ -->
	<jsp:include page="../common/index_bar.jsp" />
	<!-- 主站bar图 ]] -->



	<!-- 视频分类导航栏 [[ -->
	<div class="container-fluid" style="background-color: white; color: red;">
		<jsp:include page="../common/video_navigation_bar.jsp" />
	</div>

	<!-- 视频分类导航栏 ]] -->
	<br>
	<!-- 视频展示区 [[ -->
	<div class="container">
		<div class="row">
			<!-- 视频轮播图 [[ -->
			<!-- 大屏轮播图 -->
			<div class="col-lg-6 visible-lg">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<c:forEach items="${requestScope.indexShows}" var="indexshow" varStatus="current">
							<c:if test="${current.index == 0}">
								<li data-target="#carousel-example-generic" data-slide-to="${current.index}" class="active"></li>
							</c:if>
							<c:if test="${ current.index!=0}">

								<li data-target="#carousel-example-generic" data-slide-to="${current.index}"></li>
							</c:if>


						</c:forEach>



					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">

						<c:forEach items="${requestScope.indexShows}" var="indexshow" varStatus="current">
							<c:if test="${current.index == 0}">
								<div class="item active">
									<a href="javascript:void(0)">
										<img src="${pageContext.request.contextPath }/${indexshow.src}" alt="${indexshow.title}">
									</a>
									<div class="carousel-caption">
										<p>${indexshow.title}</p>
									</div>
								</div>
							</c:if>
							<c:if test="${ current.index!=0}">

								<div class="item">
									<a href="javascript:void(0)">
										<img src="${pageContext.request.contextPath }/${indexshow.src}" alt="${indexshow.title}">
									</a>
									<div class="carousel-caption">
										<p>${indexshow.title}</p>
									</div>
								</div>
							</c:if>
						</c:forEach>

					</div>
				</div>
			</div>
			<!-- 小屏轮播图 -->
			<div class="col-md-6 col-md-offset-3 hidden-lg">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">

						<c:forEach items="${requestScope.indexShows}" var="indexshow" varStatus="current">

							<c:if test="${current.index == 0}">
								<li data-target="#carousel-example-generic" data-slide-to="${current.index}" class="active"></li>
							</c:if>
							<c:if test="${current.index != 0}">
								<li data-target="#carousel-example-generic" data-slide-to="${current.index}"></li>
							</c:if>



						</c:forEach>


					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${requestScope.indexShows}" var="indexshow" varStatus="current">
							<c:if test="${current.index == 0}">
								<div class="item active">
									<a href="javascript:void(0)">
										<img src="${pageContext.request.contextPath }/${indexshow.src}" alt="${indexshow.title}">
									</a>
									<div class="carousel-caption">
										<p>${indexshow.title}</p>
									</div>
								</div>
							</c:if>
							<c:if test="${ current.index!=0}">

								<div class="item">
									<a href="javascript:void(0)">
										<img src="${pageContext.request.contextPath }/${indexshow.src}" alt="${indexshow.title}">
									</a>
									<div class="carousel-caption">
										<p>${indexshow.title}</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<br>
			</div>
			<!-- 视频轮播图 ]] -->
			<div class="col-lg-6 col-md-12 hidden-xs">
				<div class="row">
					<c:forEach items="${requestScope.videos}" begin="0" end="2" var="video">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<a href="index-play-show/${video.id }">
								<div class="topPhoto" style="background-image: url(${pageContext.request.contextPath}/${video.src })"></div>
							</a>
						</div>
					</c:forEach>
				</div>
				<br />
				<div class="row">
					<c:forEach items="${requestScope.videos}" begin="3" end="5" var="video">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<a href="index-play-show/${video.id }">
								<div class="topPhoto" style="background-image: url(${pageContext.request.contextPath}/${video.src })"></div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 visible-xs">
				<br>
				<div class="row">
					<c:forEach items="${requestScope.videos}" begin="0" end="1" var="video">
						<div class="col-xs-6">
							<a href="index-play-show/${video.id }">
								<div class="topPhoto" style="background-image: url(${pageContext.request.contextPath}/${video.src })"></div>
							</a>
						</div>
					</c:forEach>



				</div>
				<br>
				<div class="row">

					<c:forEach items="${requestScope.videos}" begin="4" end="5" var="video">
						<div class="col-xs-6">
							<a href="index-play-show/${video.id }">
								<div class="topPhoto" style="background-image: url(${pageContext.request.contextPath}/${video.src })"></div>
							</a>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('.carousel').carousel({
				interval : 3000
			})
		</script>
		<!-- 视频展示区 ]] -->

		<!-- 视频主体1 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[0].typeName }</h3>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['1']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="${pageContext.request.contextPath }/index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['1']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体1 ]] -->

		<!-- 视频主体2 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[1].typeName }</h3>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['2']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['2']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体2 ]] -->

		<!-- 视频主体3 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[2].typeName }</h3>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['3']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['3']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体3 ]] -->

		<!-- 视频主体4 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[3].typeName }</h3>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['4']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['4']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体4 ]] -->

		<!-- 视频主体5 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[4].typeName }</h3>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['5']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['5']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体5 ]] -->

		<!-- 视频主体6 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[5].typeName }</h3>

		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['6']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['6']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体6 ]] -->

		<!-- 视频主体7 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[6].typeName }</h3>

		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['7']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['7']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体7 ]] -->

		<!-- 视频主体8 [[ -->
		<div class="container" style="border-bottom: 1px solid #dddddd">
			<h3 class="css76035d43b5489" style="color: #f36c60; font-weight: bold;">
				<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>${sessionScope.videoTypes[7].typeName }</h3>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<c:forEach items="${requestScope.map['8']}" var="video" varStatus="current" begin="0" end="3">

					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<c:forEach items="${requestScope.map['8']}" var="video" begin="4" end="7">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<a href="index-play-show/${video.id }" class="thumbnail">
							<img src="${pageContext.request.contextPath }/${video.src}">
							<div class="caption">
								<p class="text-center">${video.name }</p>
								<p class="text-center" style="color: grey; font-size: 2px;">
									<fmt:formatDate value="${video.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 视频主体8 ]] -->
	</div>
	<!-- 友情链接部分 [[ -->
	<jsp:include page="../common/friend_link.jsp"></jsp:include>
	<!-- 友情链接部分 ]] -->
</body>
</html>