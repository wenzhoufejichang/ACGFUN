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
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/d3.min.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {

		$("#up_deleteimage").click(function() {
			$("#up_src").css("display", "none");
			$("#up_upload").css("display", "");
			$("#up_upload").val("");
			$("#up_deleteimage").css("display", "none");
		});

		$('#indexShowAdmin').on('hidden.bs.modal', function() {
			$("#up_deleteimage").css("display", "");
			$("#up_upload").css("display", "none");
			$("#up_src").css("display", "");
			$("#up_upload").val("");
		})
		$('#indexShowAdmin').on('shown.bs.modal', function() {
			$("#up_title").focus();
		})

		var x = 10;
		var y = 20;
		$("img[name='image']")
				.mouseover(
						function(e) {

							var tooltip = "<div id='tooltip'><img src='"+this.src+"'alt='预览图片'  /></div>"; //创建 div 元素
							$("body").append(tooltip); //把它追加到文档中	
							$("#tooltip").css({
								"top" : (e.pageY + y) + "px",
								"left" : (e.pageX + x) + "px"
							});
							$("#tooltip").show("fast"); //设置x坐标和y坐标，并且显示

						});
		$("img[name='image']").mouseout(function() {

			$("#tooltip").remove(); //移除 
		});
		$("img[name='image']").mousemove(function(e) {
			$("#tooltip").css({
				"top" : (e.pageY + y) + "px",
				"left" : (e.pageX + x) + "px"
			});

		});

		$('#addShowAdmin').on('show.bs.modal', function() {

			$("#deleteimage").css("display", "none");
			$("#src").css("display", "none");
			$("#upload").css("display", "");
			$("#upload").val("");
		})

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

		$("#up_upload").change(function() {

			var files = $("#up_upload")[0].files;

			var fd = new FileReader();

			fd.readAsDataURL(files[0]);
			fd.onload = function() {

				$("#up_src").attr("src", fd.result);
				$("#up_src").css("display", "");
				$("#up_deleteimage").css("display", "");
				$("#up_upload").css("display", "none");
			};
		});

	});

	function chagneMyself(n) {

		$.post("${pageContext.request.contextPath}/findByid", {
			id : n
		}, function(data) {
			$("#up_id").val(data.id);
			$("#up_src").attr("src", "${palette_url }/" + data.src);
			$("#up_title").val(data.title);
			$('#indexShowAdmin').modal('show');
		}, "json");

	}

	function deleteMyself(id) {

		if (window.confirm("确认删除?")) {
			$.ajax({
				url : "${pageContext.request.contextPath }/index/delete",
				data : {
					"id" : id
				},
				success : function(data) {

					if (data) {
						var i = $("#" + id + "").parent()[0];
						$(i).remove();

						alert("删除成功");
					} else {
						alert("发生异常");
					}

				},
				dataType : "json",
				type : "POST"
			});
		}

	}
</script>
<style type="text/css">
#tooltip {
	position: absolute;
	border: 1px solid #ccc;
	background: #333;
	padding: 2px;
	display: none;
	color: #fff
}
</style>
<meta charset="UTF-8">
<title>首页轮播图管理</title>
</head>
<body>
	<!-- 展示轮播图管理 [[ -->
	<!-- #首页展示轮播图-->
	<h2 class="page-header">
		首页轮播图管理
		<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#addShowAdmin">添加</button>
	</h2>

	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>轮播图</th>
					<th>文字介绍</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c_rt:forEach items="${requestScope.list }" var="item">

					<tr ng-repeat="item in indexData">
						<td id="${item.id}">${item.id}</td>
						<td>
							<img alt="图片" src="${palette_url }/${item.src}" style="width: 60px; height: 40px" name="image">
						</td>
						<td>${item.title}</td>
						<td>
							<button class="btn btn-default btn-xs" onclick="chagneMyself('${item.id}')">修改</button>
							<button class="btn btn-default btn-xs" onclick="deleteMyself('${item.id}')">删除</button>
						</td>
					</tr>
				</c_rt:forEach>



			</tbody>
		</table>
	</div>
	<br>
	<!-- #视频展示轮播图-->
	<!-- <h2 class="page-header">视频轮播图管理</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>轮播图链接地址</th>
					<th>文字介绍</th>
					<th>视频类型</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="item in videoData">
					<td>{{item.id}}</td>
					<td>{{item.src}}</td>
					<td>{{item.title}}</td>
					<td>{{item.videoType.typeName}}</td>
					<td>
						<button ng-click="videoAlterBtn(item.id, item.src, item.title, item.videoType.id)" class="btn btn-default btn-xs" data-toggle="modal" data-target="#videoShowAdmin">修改</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div> -->
	<!-- 展示轮播图管理 [[ -->

	<!--模态框 [[ -->
	<!-- #首页轮播图修改 -->
	<form action="${pageContext.request.contentType }/acgfan/update" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="indexShowAdmin" tabindex="-1" role="dialog" aria-labelledby="indexShowAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">首页轮播图管理</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">轮播图链接地址</label>
							<div style="text-align: center;">
								<input type="hidden" name="id" id="up_id" readonly="readonly">
								<input type="file" id="up_upload" style="display: none;" accept="image/*" name="upload">
								<img id="up_src" alt="视屏封面" src="" style="width: 70%;">
								<br />
								<div id="up_deleteimage" class="file-del">删除</div>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">文字介绍</label>
							<input type="text" class="form-control" id="up_title" value="" ng-model="alterIndexTitle" required="required" name="title">
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
	<!-- 添加 -->
	<form action="${pageContext.request.contentType }/index/add" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="addShowAdmin" tabindex="-1" role="dialog" aria-labelledby="addShowAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">首页轮播图添加</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">轮播图</label>
							<div style="text-align: center;">
								<input type="file" id="upload" style="display: none;" accept="image/*" name="upload" required="required">
								<img id="src" alt="轮播图封面" src="">
								<br />
								<div id="deleteimage" class="file-del">删除</div>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">文字介绍</label>
							<input type="text" class="form-control" id="title" value="" ng-model="alterIndexTitle" name="title" required="required">
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

	<!-- #视频轮播图修改 -->
	<!-- <form action="/acgfan/index-index-show" method="post">
		<div class="modal fade" id="videoShowAdmin" tabindex="-1" role="dialog" aria-labelledby="videoShowAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">首页轮播图管理</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">轮播图链接地址</label>
							<input type="text" class="form-control" id="" value="" ng-model="alterVideoSrc">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">文字介绍</label>
							<input type="text" class="form-control" id="" value="" ng-model="alterVideoTitle">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">视频类型ID</label>
							<input type="text" class="form-control" id="" value="" ng-model="alterVideoTypeId">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
						<button ng-click="videoAlterSubmit()" type="submit" class="btn btn-primary" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form> -->
	<!--模态框 [[ -->

</body>
</html>