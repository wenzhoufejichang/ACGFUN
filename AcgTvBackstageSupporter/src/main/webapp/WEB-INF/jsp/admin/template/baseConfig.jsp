<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/favicon.ico" type="image/x-icon" rel="shortcut icon" />
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


function change(id){
	
	$('#friendLinkAdmin').on('show.bs.modal', function () {
		
		$.post("${pageContext.request.contextPath }/baseconfig_show",{id:id},function(data){
			$("#id").val(data.id);
			$("#name").val(data.name);
			$("#src").val(data.src);
		});
		
		
		
		});
}

function 
	changety(id) {

		$('#videoTypeAdmin').on('show.bs.modal', function() {

			$.post("${pageContext.request.contextPath }/videotype", {
				id : id
			}, function(data) {

				$("#vid").val(data.id);
				$("#vn").val(data.typeName);
				$("#vt").val(data.typeIntroduce);
			});

		});
	}
</script>
<title>项目基本信息配置</title>
</head>
<body>
	<!-- 视频主站展示类型设置 [[ -->
	<!-- #视频主站展示类型设置-->
	<h2 class="page-header">视频主站展示类型设置</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>视频类型名</th>
					<th>类型介绍</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>


				<c_rt:forEach items="${requestScope.types }" var="item">


					<tr ng-repeat="item in types">
						<td>${item.id}</td>
						<td>${item.typeName}</td>
						<td>${item.typeIntroduce}</td>
						<td>
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#videoTypeAdmin" onclick="changety('${item.id}')">修改</button>
						</td>
					</tr>
				</c_rt:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<!-- #友情链接设置 -->
	<h2 class="page-header">友情链接设置</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>友情链接名</th>
					<th>链接地址</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c_rt:forEach items="${requestScope.list }" var="item">


					<tr ng-repeat="item in friendLinkData">
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.src}</td>
						<td>
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#friendLinkAdmin" onclick="change('${item.id}')">修改</button>
						</td>
					</tr>

				</c_rt:forEach>

			</tbody>
		</table>
	</div>
	<!-- 视频主站展示类型设置 [[ -->

	<!-- 模态框 [[ -->
	<!-- #主站展示类型修改模态框 -->
	<form action="${pageContext.request.contextPath }/baseconfig_videotypeupdate" method="post">
		<div class="modal fade" id="videoTypeAdmin" tabindex="-1" role="dialog" aria-labelledby="videoTypeAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">视频主站展示类型设置</h4>
					</div>
					<div class="modal-body">
						<tr>
							<td>
								<strong>ID : </strong>
								<input type="text" ng-model="alterTypeName" readonly="readonly" id="vid" name="id" />
							</td>
							&nbsp;|&nbsp;
							<td>
								<strong>视频类型名 : </strong>
								<input type="text" ng-model="alterTypeName" id="vn" name="typeName" />
							</td>
							&nbsp;|&nbsp;
							<td>
								<strong>类型介绍 : </strong>
								<input type="text" ng-model="alterTypeIntroduce" id="vt" name="typeIntroduce" />
							</td>
						</tr>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary" >确定</button>

					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- #友情链接修改模态框 -->
	<form action="${pageContext.request.contextPath }/baseconfig_update" method="post">
		<div class="modal fade" id="friendLinkAdmin" tabindex="-1" role="dialog" aria-labelledby="friendLinkAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">视频主站展示类型设置</h4>
					</div>
					<div class="modal-body">
						<tr>
							<td>
								<strong>ID : </strong>
								<input name="id" id="id" readonly="readonly">
							</td>
							&nbsp;|&nbsp;
							<td>
								<strong>友情链接名 : </strong>
								<input ng-model="alterFriendName" type="text" value="" name="name" id="name" />
							</td>
							&nbsp;|&nbsp;
							<td>
								<strong>链接地址 : </strong>
								<input ng-model="alterFriendSrc" type="text" value="" id="src" name="src" />
							</td>
						</tr>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 模态框 ]] -->


</body>
</html>