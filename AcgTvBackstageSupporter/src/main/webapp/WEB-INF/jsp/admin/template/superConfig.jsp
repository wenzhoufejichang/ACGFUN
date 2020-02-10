<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<meta charset="UTF-8">
<!-- 声明页面信息与字符编码集 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 声明移动端响应式布局-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入Bootstrap框架样式部分-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/framework/bootstrap.min.css" />
<!-- 引入logo使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/46833/582d7e08f629d8136ca2db97.css' rel='stylesheet' type='text/css' />
 -->
<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/bootstrap.min.js"></script>
<script type="text/javascript" src="http://v3.bootcss.com/assets/js/docs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular-route.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/d3.min.js" charset="utf-8"></script>
<title>顶级管理者</title>
<script type="text/javascript">
	$(function() {
		
		
		

		$
				.post(
						"/xxx",
						function(data) {
							for (var i = 0; i < data.length; i++) {

								if (i == data.length - 1) {
									$("#adddd")
											.append(
													"<input type='radio' required='required' name='roleId.id' value='"+data[i].id+"'>"
															+ data[i].roleName);
									$("#edit")
											.append(
													"<input type='radio' required='required' name='type' value='"+data[i].id+"'>");
									$("#edit").append(data[i].roleName);
								} else {
									$("#adddd")
											.append(
													"<input type='radio' required='required' name='roleId.id' value='"+data[i].id+"'>"
															+ data[i].roleName
															+ "&nbsp;|&nbsp;");
									$("#edit")
											.append(
													"<input type='radio' required='required'  name='type' value='"+data[i].id+"'>");
									$("#edit").append(
											data[i].roleName + "&nbsp;|&nbsp;");
								}
							}
						});
	});
	
	function change(id){
		
$("#editid").val(id);		
	}
	function work(id){
		
$("#work").val(id);	

$($("textarea[name='yourwork']")[0]).val("");
	}
	function deleteid(id){
		
if(window.confirm("确认删除?")){
	
	 location.href="${pageContext.request.contextPath }/acgfan/delete/"+id;
}	
	}
</script>

</head>
<body>
	<!-- 顶级管理员设置 [[ -->
	<!-- #管理员列表-->
	<h2 class="page-header">
		管理员列表
		<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#addAdmin">添加</button>
	</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>工号ID</th>
					<th>管理员名</th>
					<th>管理角色</th>
					<th>任务</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c_rt:forEach items="${requestScope.list }" var="item">

					<tr ng-repeat="item in adminData">
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.roleId.roleName}</td>
						<td>${item.work}</td>
						<td>
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#workAdmin" onclick="work('${item.id}')">分配任务</button>
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#editAdmin" onclick="change('${item.id}')">重新分配角色</button>
							<button class="btn btn-default btn-xs" onclick="deleteid(${item.id})">删除</button>
						</td>
					</tr>


				</c_rt:forEach>

			</tbody>
		</table>
	</div>
	<br>

	<!-- 顶级管理员设置 [[ -->

	<!-- 模态框 [[ -->
	<!-- #管理员权限修改模态框 -->
	<form action="${pageContext.request.contextPath }/acgfan/index-index-show" method="post">
		<div class="modal fade" id="editAdmin" tabindex="-1" role="dialog" aria-labelledby="editAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">修改角色</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="col-sm-12">
								<input type="hidden" value="" id="editid" name="editid">
								<div class="checkbox">
									<label id="edit"> </label>

								</div>
							</div>
							<br>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- #分配任务模态框 -->
	<form action="${pageContext.request.contextPath }/acgfan/work" method="post">
		<div class="modal fade" id="workAdmin" tabindex="-1" role="dialog" aria-labelledby="workAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">分配任务</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="work" name="work" />
						<textarea class="form-control" rows="3" ng-model="shouldWork" name="yourwork"></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal" id="caclework">取消</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- #添加模态框 -->
	<form action="${pageContext.request.contextPath }/acgfan/add" method="post">
		<div class="modal fade" id="addAdmin" tabindex="-1" role="dialog" aria-labelledby="addAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">添加管理员</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="">管理员名</label>
							<input type="text" class="form-control" value="" ng-model="addAdminName" name="name" required="required">
						</div>
						<div class="form-group">
							<label for="">密码</label>
							<input type="password" class="form-control" value="" ng-model="addAdminPassword" name="password" required="required">
						</div>
						<div class="form-group" id="adddd">
							<label for="">角色</label>
							<br>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary" >确定</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 模态框 ]] -->
</body>
</html>