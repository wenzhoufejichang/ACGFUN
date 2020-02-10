<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
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
<script type="text/javascript">
	$(function() {
		$("#deleteimage").click(function() {

			$("#src").css("display", "none");
			$("#upload").css("display", "");
			$("#upload").val("");
			$("#deleteimage").css("display", "none");
		});

		$("#upload").change(function() {

			var files = $("#upload")[0].files;

			var fd = new FileReader();

			fd.readAsDataURL(files[0]);
			fd.onload = function() {

				$("#src").attr("src", fd.result);
				$("#src").css("display", "");
				$("#deleteimage").css("display", "");
				$("#upload").css("display", "none");
			};

		});

		$('#gameAdmin').on('hidden.bs.modal', function() {
			$("#deleteimage").css("display", "");
			$("#src").css("display", "");
			$("#upload").css("display", "none");
		});
		$('#gameAdmin').on('shown.bs.modal', function() {
			$("#name").focus();
		});
		$('#gameListAdmin').on('shown.bs.modal', function() {
			$("#gameintroducename").focus();
		});

	});

	function change(id) {

		$.ajax({
			data : {
				"id" : id
			},
			success : function(data) {

				$("#id").val(data.id);
				$("#name").val(data.name);
				$("#title").val(data.title);
				$("#src").attr("src", "${palette_url }/" + data.src);

				$('#gameAdmin').modal('show');

			},
			dataType : "json", //预期服务器返回的数据类型
			url : "${pageContext.request.contextPath}/findgameByid",
			async : true, //默认是true  可以修改
			type : "POST"
		});

	}

	function deleteByid(id) {

		if (window.confirm("确认删除?")) {

			$.post("${pageContext.request.contextPath }/deleteGameByid", {
				"id" : id
			}, function(data) {
				if (data) {
					var i = $("#" + id).parent()[0];
					$(i).remove();
				} else {
					alert("发生异常");
				}
			});

		}

	}

	function alterListBtn(id) {

		$.post("${pageContext.request.contextPath }/changeGameIntroduceByid", {
			"id" : id
		}, function(data) {
			if (data != null) {
				$("#gameintroduceid").val(data.id);
				$("#gameintroducename").val(data.name);
				$("#gameintroducetype_id").val(data.typeId);
				$("#gameListAdmin").modal('show');

			} else {

				alert("异常");

			}

		});

	}

	function deleteList(e, id) {

		if (window.confirm("确认删除?")) {

			$.get("${pageContext.request.contextPath}/deleteGameintroduce", {
				"id" : id
			}, function(data) {

				if (data) {

					$($($(e).parent()[0]).parent()[0]).remove();
				} else {

					alert("发生异常,不能删除");

				}

			});

		}

	}
</script>
<title>游戏相关管理</title>
</head>
<body>



	<!-- 游戏相关管理 [[-->
	<!-- #推荐游戏管理 -->
	<h2 class="page-header">游戏列表管理</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>游戏名称</th>
					<th>游戏标题介绍</th>
					<th>游戏图片链接地址</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c_rt:forEach items="${requestScope.list}" var="item">
					<tr>
						<td id="${item.id}">${item.id}</td>
						<td>${item.name}</td>
						<td>${item.title}</td>
						<td>
							<img alt="图片" src="${palette_url }/${item.src}" style="width: 80px; height: 40px" name="image">
						</td>
						<td>
							<button class="btn btn-default btn-xs" onclick="change('${item.id}')">修改</button>
							<button class="btn btn-default btn-xs" onclick="deleteByid('${item.id}')">删除</button>
						</td>
					</tr>
				</c_rt:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<!-- #游戏列表管理 -->
	<h2 class="page-header">
		推荐游戏管理

		<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#addListAdmin">添加</button>
	</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>游戏名</th>
					<th>类别</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>

				<c_rt:forEach items="${requestScope.gameIntroduces}" var="item">


					<tr>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>
							<c_rt:if test="${item.typeId==1}">
								<div ng-if="item.typeId == 1">新游推荐</div>
							</c_rt:if>
							<c_rt:if test="${item.typeId==2}">
								<div ng-if="item.typeId == 2">热门推荐</div>
							</c_rt:if>
							<c_rt:if test="${item.typeId==3}">
								<div ng-if="item.typeId == 3">网游推荐</div>
							</c_rt:if>




						</td>
						<td>
							<button onclick="alterListBtn('${item.id}')" class="btn btn-default btn-xs">修改</button>
							<button onclick="deleteList(this,'${item.id}')" class="btn btn-default btn-xs" value="${item.id}">删除</button>
						</td>
					</tr>

				</c_rt:forEach>



			</tbody>
		</table>
	</div>

	<!-- 游戏相关管理 ]]-->

	<!-- 模态框 [[-->
	<!-- #推荐游戏管理模态框 -->
	<form action="${pageContext.request.contextPath }/gameAdmin" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="gameAdmin" tabindex="-1" role="dialog" aria-labelledby="gameAdmin" aria-hidden="true" id="gameAdmin">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">游戏列表管理</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">游戏名称</label>
							<input type="text" class="form-control" id="name" name="name" value="" ng-model="alterGameName" required="required">
							<input type="hidden" class="form-control" id="id" name="id" value="">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">游戏标题介绍</label>
							<input type="text" class="form-control" id="title" value="" name="title" ng-model="alterGameTitle" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">游戏图片链接地址</label>
							<div style="text-align: center;">
								<input type="file" id="upload" style="display: none;" accept="image/*" name="upload">
								<img alt="图片" src="" name="src" id="src" width="100%" height="100%">
								<br />
								<div id="deleteimage" class="file-del">删除</div>

							</div>

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

	<!-- #修改游戏列表模态框 -->
	<form action="${pageContext.request.contextPath }/acgfan/change" method="post">
		<div class="modal fade" id="gameListAdmin" tabindex="-1" role="dialog" aria-labelledby="gameListAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">修改游戏推荐</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">游戏名</label>
							<input type="text" class="form-control" id="gameintroducename" name="name" value="" ng-model="alterListName" required="required">
							<input type="hidden" class="form-control" id="gameintroduceid" name="id" value="" ng-model="alterListName" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">类型</label>
							<select name="typeId" id="gameintroducetype_id" class="form-control" required="required">
								<option value="1">新游推荐</option>
								<option value="2">热门推荐</option>
								<option value="3">网游推荐</option>
							</select>
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

	<!-- #添加游戏列表模态框 -->
	<form action="${pageContext.request.contextPath }/acgfan/addgameintroduce" method="post">
		<div class="modal fade" id="addListAdmin" tabindex="-1" role="dialog" aria-labelledby="addListAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">添加游戏列表</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">游戏名</label>
							<input type="text" class="form-control" value="" name="name" required="required">
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label>
										<input type="radio" name="typeId" required="required" value="1">
										新游推荐 &nbsp;|&nbsp;
										<input type="radio" name="typeId" required="required" value="2">
										热门推荐 &nbsp;|&nbsp;
										<input type="radio" name="typeId" required="required" value="3">
										网游推荐
									</label>
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

	<!-- 模态框 ]]-->

</body>
</html>