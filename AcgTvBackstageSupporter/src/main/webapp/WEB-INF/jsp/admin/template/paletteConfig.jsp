<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<meta charset="UTF-8">
<!-- 声明页面信息与字符编码集 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 声明移动端响应式布局-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/framework/bootstrap.min.css" />
<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/jquery-2.0.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

	});

	function deletePalette(id) {

		$("#id").val(id);
		$('#paletteDeleteAdmin').modal('show');
	}
</script>
<title>画板管理</title>
</head>
<body>
	<!-- 画板管理 [[-->
	<h2 class="page-header">画板管理</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>画板名</th>
					<th>画板链接</th>
					<th>类型</th>
					<th>发布用户</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="item">
					<tr>

						<td>${item.id}</td>
						<td>${item.name}</td>

						<td>
							<a href="${requestScope.palette_url}/static/${item.src}" target="_blank">${requestScope.palette_url}/static/${item.src}</a>
						</td>


						<td>${item.paletteType.typeName}</td>
						<td>${item.userId.username}</td>
						<td>
							<button onclick="deletePalette('${item.id}')" class="btn btn-default btn-xs" data-target="#paletteDeleteAdmin">删除</button>
						</td>

					</tr>
				</c:forEach>


			</tbody>
		</table>
	</div>
	<!-- 视频相关管理 ]]-->

	<!-- 模态框 [[-->
	<!-- #删除确认莫模态框-->
	<form action="${pageContext.request.contextPath}/acgfun/index-index-show" method="post">
		<div class="modal fade bs-example-modal-sm" id="paletteDeleteAdmin" tabindex="-1" role="dialog" aria-labelledby="paletteDeleteAdmin" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<input type="hidden" name="id" id="id">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">您确认删除吗?</h4>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 模态框 ]]-->

</body>
</html>