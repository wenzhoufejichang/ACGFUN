<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/css/index.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/framework/bootstrap.min.css" />
</head>
<body>
	<div class="container-fluid"
		style="background-color: rgb(236, 236, 236)" id="footer">

		<div class="container">
			<h4 style="color: #bbb">友情链接</h4>
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<ul style="list-style: none;">
						<c:forEach items="${sessionScope.friendlink }" begin="0" end="2"
							var="friendlink">
							<li><a href="${friendlink.src }" target="_blank">${friendlink.name }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-4">
						<ul style="list-style: none;">
							<c:forEach items="${sessionScope.friendlink }" begin="3" end="5"
								var="friendlink">
								<li><a href="${friendlink.src }" target="_blank">${friendlink.name }</a></li>
							</c:forEach>
						</ul>
					</div>
					<%-- <div class="col-lg-4 col-md-4" style="font-size: 16px;">
						<ul>
							<li>您可以下载我们的移动客户端</li>
							<li>
								也欢迎您关注我们的微博和微信
								<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>
							</li>
						</ul>
					</div> --%>
				</div>
			</div>

		</div>
	</div>
</body>
</html>