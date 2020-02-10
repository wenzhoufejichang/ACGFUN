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
<!--  <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/5831bc5ef629d8120c37105b.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>
<title>用户注册,回答答题才可以注册哦~</title>
<style type="text/css">
.question_bar {
	width: 100%;
	height: 300px;
	background-color: orange;
	margin-top: -21px;
	background:
		url(${pageContext.request.contextPath}/static/photo/account/question_bar.png)
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

<script type="text/javascript">
	$(
			function() {
				$("#formtosubmit")
						.click(
								function() {

									if (window.confirm("确认提交?")) {

										let ans = $("input[type='radio']:checked");
										let anstring = [];
										$.each(ans, function(i, n) {

											anstring[i] = $(n).attr('name')
													+ $(n).val();
										});
										anstring = anstring.join(",");
										$
												.post(
														"${pageContext.request.contextPath}/account-question-execute",
														{
															"anstring" : anstring
														},
														function(data) {
															if (data) {

																location.href = "${pageContext.request.contextPath}/account-question-show";
															} else {
																alert("还可惜,下次继续努力");
																location.href = "${pageContext.request.contextPath}/";

															}
														}, "json")

									}
								});

			})
</script>
</head>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false' onselect='document.selection.empty()' oncopy='document.selection.empty()' onbeforecopy='return false'>
	<noscript>
		<iframe src="*.htm"></iframe>
	</noscript>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->

	<!-- bar图 [[ -->
	<div class="question_bar"></div>
	<!-- bar图 ]] -->
	<br>
	<!-- 主体答题框 [[ -->

	<form action="javasrcipt:void(0)" method="post" id="questionfrom">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<table class="table table-bordered">
						<tr>
							<td>
								<h3>
									<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35"></img>
									<span class="css72771182a5489">只有答对所有题才可以注册哦</span>
								</h3>
							</td>
						</tr>
						<c:forEach items="${requestScope.questions }" var="question">
							<tr>
								<td>

									<h4>${question.id}&#46;&#32;&#32;${question.content }</h4>
									<p>
										<input type="radio" name="${question.id}" value="A">
										&nbsp;&nbsp;${question.answerA }
									</p>
									<p>
										<input type="radio" name="${question.id}" value="B">
										&nbsp;&nbsp;${question.answerB }
									</p>
									<p>
										<input type="radio" name="${question.id}" value="C">
										&nbsp;&nbsp;${question.answerC }
									</p>
									<p>
										<input type="radio" name="${question.id}" value="D">
										&nbsp;&nbsp;${question.answerD }
									</p>
								</td>
							</tr>

						</c:forEach>

						<tr>
							<td>
								<button type="button" class="btn btn-info center-block" id="formtosubmit">提交答案</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	<!-- 主体答题框 ]] -->
	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->
	<jsp:include page="../common/friend_link.jsp"></jsp:include>
	<!-- 友情链接部分 ]] -->

</body>

</html>