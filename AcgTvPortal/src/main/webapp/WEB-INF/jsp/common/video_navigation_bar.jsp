<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/framework/bootstrap.min.css" />

<script type="text/javascript">
	$(function() {
		  <c:if test="${empty requestScope.typeNow  }">
		 	
		var index = $("li[role='presentation']")[0];
	$($(index).children()[0]).attr("style", "color: #f36c60");
		$(index).attr("style", "border-bottom: 1px solid #f36c60");
		</c:if> 
		<c:if test="${!empty requestScope.typeNow  }">
		  
			var className = ".nav${requestScope.typeNow }";
			$(className + " a").css("color", "#f36c60");
			$(className).css("borderBottom", "1px solid #f36c60"); 
		</c:if>  

		
	});
	
</script>
</head>
<body>

	<div class="row">
		<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
			<ul class="nav nav-tabs">
				<li role="presentation">
					<a href="${pageContext.request.contextPath }/">
						首页
						<i class="glyphicon glyphicon-home hidden-xs"></i>
					</a>
				</li>
				<c:forEach items="${sessionScope.videoTypes }" var="videotype">
					<li role="presentation" class="nav${videotype.id}">
						<a href="${pageContext.request.contextPath }/index-more-show/${videotype.id }">
							${videotype.typeName }
							<div class="type_number hidden-xs">${videotype.videoCount }</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>