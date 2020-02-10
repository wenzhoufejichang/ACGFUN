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
		$("input[type='radio']")
				.change(
						function() {
							$("label span").removeClass("label-primary");
							$("label span").addClass("label-info");
							$($(this).next(".label")[0]).removeClass(
									'label-info');
							$($(this).next(".label")[0]).addClass(
									'label-primary');
							var value = ${requestScope.search.currentpage	};
								
						
							

							$
									.get(
											"${pageContext.request.contextPath }/index-search-execute",
											{
												"page" : value,
												"row" : $(
														$("#myform input[type='hidden']")[0])
														.val(),

												"search" : $(
														$("#myform input[type='text']")[0])
														.val(),
												isajax : true,
												"videotype" : $(this).val()

											},
											function(data) {
												String
												context = '';
												context222 = '';

												$("#xxxxx").empty();
												//alert(${requestScope.search.totalpage });
												//{"id":3,"createTime":"2016-12-01 10:19:17","name":"祝你有<font  style='color: red;'>一</font>天能和你重要的人重逢","src":"photo/index/index_t1/av3.png","videoType":1}
												$
														.each(
																data.list,
																function(i, n) {

																	// 0 1 2 3 
																	if (i % 4 == 0) {
																		context += "<div class='row'>"
																	}
																	context += "<div class='col-lg-3 col-md-3 col-sm-3'>"
																			+ "<a href='index-play-show/"
																			+ n.id
																			+ "' class='thumbnail'>"
																			+ "<img src='${pageContext.request.contextPath }/"+n.src+"'>"
																			+ "<div class='caption'>"
																			+ "<p class='text-center'>"
																			+ n.name
																			+ "</p>"
																			+ "<p class='text-center' style='color: grey; font-size: 2px;'>"
																			+ n.createTime
																			+ "</p>"
																			+ "</div>"
																			+ "</a>"
																			+ "</div>"

																	if (i % 4 == 3) {
																		context += '</div>';
																	}

																});
												$("#content").empty();
												$("#content").html(context);
												if (data.currentpage == 1) {
													context222 += "<li class='disabled'><span><span aria-hidden='true'>&laquo;</span></span></li>"
												} else {
													let number = parseInt(data.currentpage) - 1;
													context222 += "<li><a href='javascript:void(0)' aria-label='Previous'  onclick='goss("
															+ number
															+ ")'><span aria-hidden='true'>&laquo;</span></a></li>"
												}
												for (let i = 1; i <= data.totalpage; i++) {

													if (i == data.currentpage) {
														context222 += "<li class='active'><a href='javascript:void(0)'>"
																+ i
																+ " <span class='sr-only'>(current)</span></a></li>"
													} else {

														context222 += "<li ><a href='javascript:void(0)'  onclick='goss("
																+ i
																+ ")'>"
																+ i
																+ " <span class='sr-only'>(current)</span></a></li>"

													}
												}

												if (data.currentpage == data.totalpage) {
													context222 += "<li class='disabled'><span><span aria-hidden='true'>&raquo;</span></span></li>"
												} else {
													let number = parseInt(data.currentpage) + 1;
													context222 += "<li><a href='javascript:void(0)' aria-label='Previous' onclick='goss("
															+ number
															+ ")'><span aria-hidden='true'>&raquo;</span></a></li>"
												}
												$("#xxxxx").html(context222);

												let address = "index-search-execute?";

												address += "search="
														+ data.search + "&";
												let row = $(
														$("#myform input[type='hidden']")[0])
														.val();
												address += "row=" + row + "&";
												address += "page="
														+ data.currentpage;
												window.history.replaceState(
														null, null, address);

											}, "json");

						});
	});

	function goss(value) {
		//$($("#myform input[type='hidden']")[1]).val(value);
		//
		//let va = window.location.href;

		$
				.get(
						"${pageContext.request.contextPath }/index-search-execute",
						{
							"page" : value,
							"row" : $($("#myform input[type='hidden']")[0])
									.val(),

							"search" : $($("#myform input[type='text']")[0])
									.val(),
							"isajax" : 1,
							"videotype" : $("input:checked").val()

						},
						function(data) {
							String
							context = '';
							context222 = '';

							//alert(${requestScope.search.totalpage });
							//{"id":3,"createTime":"2016-12-01 10:19:17","name":"祝你有<font  style='color: red;'>一</font>天能和你重要的人重逢","src":"photo/index/index_t1/av3.png","videoType":1}
							$
									.each(
											data.list,
											function(i, n) {

												// 0 1 2 3 
												if (i % 4 == 0) {
													context += "<div class='row'>"
												}
												context += "<div class='col-lg-3 col-md-3 col-sm-3'>"
														+ "<a href='index-play-show/"
														+ n.id
														+ "' class='thumbnail'>"
														+ "<img src='${pageContext.request.contextPath }/"+n.src+"'>"
														+ "<div class='caption'>"
														+ "<p class='text-center'>"
														+ n.name
														+ "</p>"
														+ "<p class='text-center' style='color: grey; font-size: 2px;'>"
														+ n.createTime
														+ "</p>"
														+ "</div>"
														+ "</a>"
														+ "</div>"

												if (i % 4 == 3) {
													context += '</div>';
												}

											});
							$("#content").empty();
							$("#content").html(context);
							if (data.currentpage == 1) {
								context222 += "<li class='disabled'><span><span aria-hidden='true'>&laquo;</span></span></li>"
							} else {
								let number = parseInt(data.currentpage) - 1;
								context222 += "<li><a href='javascript:void(0)' aria-label='Previous'  onclick='goss("
										+ number
										+ ")'><span aria-hidden='true'>&laquo;</span></a></li>"
							}
							for (let i = 1; i <= data.totalpage; i++) {

								if (i == data.currentpage) {
									context222 += "<li class='active'><a href='javascript:void(0)'>"
											+ i
											+ " <span class='sr-only'>(current)</span></a></li>"
								} else {

									context222 += "<li ><a href='javascript:void(0)'  onclick='goss("
											+ i
											+ ")'>"
											+ i
											+ " <span class='sr-only'>(current)</span></a></li>"

								}
							}

							if (data.currentpage == data.totalpage) {
								context222 += "<li class='disabled'><span><span aria-hidden='true'>&raquo;</span></span></li>"
							} else {
								let number = parseInt(data.currentpage) + 1;
								context222 += "<li><a href='javascript:void(0)' aria-label='Previous' onclick='goss("
										+ number
										+ ")'><span aria-hidden='true'>&raquo;</span></a></li>"
							}
							$("#xxxxx").empty();
							$("#xxxxx").html(context222);

							let address = "index-search-execute?";
							//address+=search=一&row=4&page=3

							address += "search=" + data.search + "&";
							let row = $($("#myform input[type='hidden']")[0])
									.val();
							address += "row=" + row + "&";
							address += "page=" + data.currentpage;
							window.history.replaceState(null, null, address);

						}, "json");

	}
</script>

<title>搜索</title>
<style type="text/css">
.register_bar {
	width: 100%;
	height: 300px;
	background-color: orange;
	margin-top: -21px;
	background:
		url(${pageContext.request.contextPath}/photo/account/register_bar.png)
		no-repeat center center;
	background-size: cover;
}

td p {
	margin-left: 40px;
}

td h4 {
	margin-left: 30px;
}
</style>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->

	<!-- 搜索框 [[ -->
	<br>
	<form action="${pageContext.request.contextPath }/index-search-execute" method="get" id="myform">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-xs-6 col-xs-offset-3  col-lg-offset-2 ">
					<input type="text" class="form-control" placeholder="来啊,搜我啊~" name="search" value="${requestScope.search.search }">
					<input type="hidden" class="form-control" name="row" value="8">
					<input type="hidden" class="form-control" name="page" value="1">
				</div>
				<div class="col-lg-2  col-xs-1 ">
					<button type="submit" class="btn btn-default" style="background-color: #f36c60; color: white;">
						<i class="glyphicon glyphicon-search"></i>
						搜索
					</button>
				</div>
			</div>

			<br>
			<br>
			<br>
			<div class="row">
				<label class="radio-inline   input-lg"> 视频类型: </label>
				<label class="radio-inline   input-lg">
					<input type="radio" name="inlineRadioOptions" id="inlineRadio0" value="" style="display: none;" checked="checked">
					<span class="label label-primary">全部</span>

				</label>

				<c:forEach items="${requestScope.videotype}" var="videotype">

					<label class="radio-inline  input-lg">
						<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="${videotype.id }" style="display: none;">
						<span class="label label-info">${videotype.typeName }</span>

					</label>
				</c:forEach>
			</div>
		</div>
	</form>
	<br>
	<br>
	<!-- 搜索框 ]] -->
	<div class="container">
		<div class="row" id="content">
			<c:forEach items="${requestScope.search.list }" var="v" varStatus="status">
				<c:if test="${status.count % 4 == 1}">
					<div class="row">
				</c:if>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<a href="index-play-show/${v.id }" class="thumbnail">
						<img src="${pageContext.request.contextPath }/${v.src}">
						<div class="caption">
							<p class="text-center">${v.name }</p>
							<p class="text-center" style="color: grey; font-size: 2px;">
								<fmt:formatDate value="${v.createTime }" timeZone="GMT+8" pattern="yyyy-MM-dd HH:mm:ss" />


							</p>
						</div>
					</a>
				</div>

				<c:if test="${status.count % 4 == 0}">
		</div>
		</c:if>
		</c:forEach>


	</div>
	<nav aria-label="..." class="text-center">
		<ul class="pagination" id="xxxxx">

			<c:if test="${requestScope.search.totalpage>0 }">
				<c:if test="${requestScope.search.currentpage==1 }">
					<li class="disabled">
						<span>
							<!-- <span aria-hidden="true">&laquo;</span> -->
							<span aria-hidden="true">&#171;</span>
						</span>
					</li>
				</c:if>
				<c:if test="${requestScope.search.currentpage!=1 }">
					<li>
						<a href="javascript:void(0)" aria-label="Previous" onclick="goss('${requestScope.search.currentpage-1}')">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
			</c:if>
			<c:forEach begin="1" end="${requestScope.search.totalpage }" varStatus="current">
				<c:if test="${current.count==requestScope.search.currentpage }">
					<li class="active">
						<a href="javascript:void(0)">
							${requestScope.search.currentpage }
							<span class="sr-only">(current)</span>
						</a>
					</li>
				</c:if>
				<c:if test="${current.count!=requestScope.search.currentpage }">
					<li>
						<a href="javascript:void(0)" onclick="goss('${current.count}')">
							${current.count }
							<span class="sr-only">(current)</span>
						</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${requestScope.search.totalpage>0 }">

				<c:if test="${requestScope.search.currentpage!=requestScope.search.totalpage }">
					<li>
						<a href="javascript:void(0)" aria-label="Next" onclick="goss('${requestScope.search.currentpage+1}')">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>

				</c:if>
				<c:if test="${requestScope.search.currentpage==requestScope.search.totalpage }">
					<li class="disabled">
						<span>
							<span aria-hidden="true">&raquo;</span>
						</span>
					</li>
				</c:if>
			</c:if>
		</ul>
	</nav>
	</div>
	</div>
	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->
	<div class="col-lg-12 col-xs-8 text-nowrap">
		<jsp:include page="../common/friend_link.jsp"></jsp:include>
	</div>
	<!-- 友情链接部分 ]] -->

</body>
</html>