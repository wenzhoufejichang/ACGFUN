<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/framework/bootstrap.min.css" />
<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/jquery-2.0.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/bootstrap.min.js"></script>
<script type="text/javascript" src="http://v3.bootcss.com/assets/js/docs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular-route.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/d3.min.js" charset="utf-8"></script>
<script type="text/javascript">
function deleteMyself(n){
	
	if( window.confirm("是否删除?")){

		$.ajax({ url: "${pageContext.request.contextPath }/delete", data:{"id":n}, success: function(data){
			
			
			
			if(data){
var i=	$("#"+n+"").parent()[0];
				$(i).remove();	
				
				alert("删除成功");
			}else{
				alert("发生异常");
			}
			
		},dataType:"json",type:"POST"});	
	}
	
	
	
	

}

		

	
</script>
<title>视频评论管理</title>
</head>
<body>
	<h2 class="page-header">视频评论管理</h2>
	<div class="table-responsive">

		<c_rt:if test="${!empty  requestScope.list}">


			<table class="table table-striped">
				<thead>
					<tr>
						<th>编号ID</th>
						<th>评论内容</th>
						<th>评论用户</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="comment">
					<c_rt:forEach items="${requestScope.list }" var="item">

						<tr ng-repeat="item in commentData">
							<td id="${item.id}">${item.id}</td>
							<td>${item.content}</td>
							<td>${item.userId.username}</td>
							<td>
								<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#indexShowAdelf" onclick="deleteMyself('${item.id}')">删除</button>
							</td>
						</tr>
					</c_rt:forEach>
				</tbody>
			</table>


		</c_rt:if>

		<c_rt:if test="${empty  requestScope.list}">

			<div style="text-align: center;">该视频没有评论</div>


		</c_rt:if>

	</div>
</body>
</html>