<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/d3.min.js" charset="utf-8"></script>
<title>周边商城管理</title>
<style>
.MyText {
	text-anchor: middle;
	font-family: arial;
	font-size: 10px;
	fill: white;
}

#tooltip {
	position: absolute;
	border: 1px solid #ccc;
	background: #333;
	padding: 2px;
	display: none;
	color: #fff
}
</style>
<script type="text/javascript">
	$(function() {

		$("#deleteimage").click(function() {

			$("#goods_src").css("display", "none");
			$("#upload").css("display", "");
			$("#upload").val("");
			$("#deleteimage").css("display", "none");
		});
		$("#upload").change(function() {

			var files = $("#upload")[0].files;

			var fd = new FileReader();

			fd.readAsDataURL(files[0]);
			fd.onload = function() {

				$("#goods_src").attr("src", fd.result);
				$("#goods_src").css("display", "");
				$("#deleteimage").css("display", "");
				$("#upload").css("display", "none");
			};

		});

		priceCount();

		stockCount();

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

		$('#shopAdmin').on('shown.bs.modal', function() {

			$("#goods_name").focus();
		});
		$('#shopAdmin').on('hidden.bs.modal', function() {
			$("#deleteimage").css("display", "");
			$("#goods_src").css("display", "");
			$("#upload").css("display", "none");
		});

		$("#goodsupload_add").change(function() {

			var files = $("#goodsupload_add")[0].files;

			var fd = new FileReader();

			fd.readAsDataURL(files[0]);
			fd.onload = function() {

				$("#goods_add").attr("src", fd.result);
				$("#goods_add").css("display", "");
				$("#deleteimage_add").css("display", "");
				$("#goodsupload_add").css("display", "none");
			};

		});
		$("#deleteimage_add").click(function() {
			$("#goods_add").css("display", "none");
			$("#goods_add").attr("src", "");
			$("#goodsupload_add").css("display", "");
			$("#goodsupload_add").val("");
			$("#deleteimage_add").css("display", "none");
		});

		$('#addShopAdmin').on('hidden.bs.modal', function() {
			$("#deleteimage_add").css("display", "none");
			$("#goods_add").css("display", "none");
			$("#goodsupload_add").css("display", "");
			$("#goodsupload_add").val("");
			$("#goods_add").attr("src", "");
		});

	});
	function priceCount() {
		var body = d3.select("#priceCount");

		var width = 250;
		var height = 250;

		var svg = body.append("svg").attr("width", 400).attr("height", 400);

		var dataset = [ 43, 22, 19, 13, 3 ];
		var titleset = [ "<$50: ", "$50-$100: ", "$100-$300: ", "$300-500: ", ">$500: " ];

		var pie = d3.layout.pie();

		var piedata = pie(dataset);

		var innerRadius = 0;
		var outerRadius = 120;
		var arc = d3.svg.arc().innerRadius(innerRadius)
				.outerRadius(outerRadius);

		var color = d3.scale.category10();

		var arcs = svg.selectAll(".arcGroups").data(piedata).enter()
				.append("g").attr("class", "arcGroups").attr("transform",
						"translate(200,200)");

		arcs.append("path").attr("fill", function(d, i) {
			return color(i);
		}).attr("d", function(d) {
			return arc(d);
		});

		arcs.append("text").attr("class", "MyText").attr(
				"transform",
				function(d) {
					var center = arc.centroid(d);
					return "translate(" + center[0] * 1.4 + "," + center[1]
							* 1.4 + ")";
				}).text(function(d, i) {
			return titleset[i] + d.value + "%";
		})
	}

	function stockCount() {
		var body = d3.select("#priceCount");

		var width = 250;
		var height = 250;

		var svg = body.append("svg").attr("width", 400).attr("height", 400);

		var dataset = [ 10, 20, 30, 24, 12 ];
		var titleset = [ "<$50: ", "$50-$100: ", "$100-$300: ", "$300-500: ", ">$500: " ];

		var pie = d3.layout.pie();

		var piedata = pie(dataset);

		var innerRadius = 0;
		var outerRadius = 120;
		var arc = d3.svg.arc().innerRadius(innerRadius)
				.outerRadius(outerRadius);

		var color = d3.scale.category10();

		var arcs = svg.selectAll(".arcGroups").data(piedata).enter()
				.append("g").attr("class", "arcGroups").attr("transform",
						"translate(200,200)");

		arcs.append("path").attr("fill", function(d, i) {
			return color(i);
		}).attr("d", function(d) {
			return arc(d);
		});

		arcs.append("text").attr("class", "MyText").attr(
				"transform",
				function(d) {
					var center = arc.centroid(d);
					return "translate(" + center[0] * 1.4 + "," + center[1]
							* 1.4 + ")";
				}).text(function(d, i) {
			return titleset[i] + d.value + "%";
		})
	}

	function deleteShop(e, id) {

		if (window.confirm("确认删除?")) {

			$.get("${pageContext.request.contextPath}/deleteShop", {
				'id' : id
			}, function(data) {

				if (data) {
					$($($(e).parent()[0]).parent()[0]).remove();

				} else {

					alert("发生异常");

				}

			});

		}

	}

	function changeShopBtn(id) {

		$.ajax({
			// 请求方式
			type : "post",
			// dataType
			dataType : "json",
			// url
			url : "${pageContext.request.contextPath}/findGoods",
			// 把JS的对象或数组序列化一个json 字符串
			data : {
				"id" : id
			},
			// result 为请求的返回结果对象
			success : function(result) {

				if (result.number == 200) {

					$("#goods_id").val(result.goods.id);
					$("#goods_name").val(result.goods.name);
					$("#goods_price").val(result.goods.price);
					$("#goods_stock").val(result.goods.stock);
					$("#goods_src").attr("src", result.goods.photoDesc);
					$("#shopAdmin").modal('show');

				} else if (result.number == 202) {

					alert("查询为空");
				} else if (result.number == 400) {

					window.location = "${pageContext.request.contextPath}/";

				}

			}

		});

	}
</script>
</head>
<body>
	<h2 class="page-header">
		商品信息统计
		<small> 左表:各价格区间商品售出所占百分比 | 右表:各价格区间商品库存所占百分比</small>
	</h2>
	<div id="priceCount" class=""></div>
	<!-- 周边商城 [[-->
	<h2 class="page-header">
		商品管理
		<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#addShopAdmin">添加</button>
	</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>



				<tr>
					<th>编号ID</th>
					<th>商品名</th>
					<th>商品展示图</th>
					<th>价格</th>
					<th>库存</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${requestScope.list }" var="item">
					<tr>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>
							<a href="${palette_url }/static/${item.photoDesc}" target="_blank">

								<img alt="图片" src="${palette_url }/${item.photoDesc}" style="width: 80px; height: 50px" name="image">

							</a>
						</td>
						<td>${item.price}</td>
						<td>${item.stock}</td>
						<td>
							<button onclick="changeShopBtn('${item.id}')" class="btn btn-default btn-xs">修改</button>
							<button onclick="deleteShop(this,'${item.id}')" class="btn btn-default btn-xs">删除</button>
						</td>
					</tr>


				</c:forEach>


			</tbody>
		</table>
	</div>
	<!-- 视频相关管理 ]]-->

	<!-- 模态框 [[-->
	<!-- #修改商品管理模态框 -->
	<form action="${pageContext.request.contextPath }/acgfan/changegoods" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="shopAdmin" tabindex="-1" role="dialog" aria-labelledby="shopAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">商品管理</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">商品名称</label>
							<input type="text" class="form-control" id="goods_name" name="name" value="" required="required" ng-model="alterName">
							<input type="hidden" class="form-control" id="goods_id" name="id" value="" required="required" ng-model="alterName">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"> 商品展示图</label>
							<div style="text-align: center;">
								<input type="file" id="upload" style="display: none;" accept="image/*" name="upload">
								<img alt="图片" name="photoDesc" id="goods_src" width="50%" height="30%">
								<br />
								<div id="deleteimage" class="file-del">删除</div>

							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">价格</label>
							<input type="number" class="form-control" id="goods_price" name="price" value="" ng-model="alterPrice" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">库存</label>
							<input type="number" class="form-control" id="goods_stock" name="stock" value="" ng-model="alterStock" required="required">
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

	<!-- #删除确认莫模态框-->
	<%-- <form action="${pageContext.request.contextPath }/acgfan/index-index-show" method="post">
		<div class="modal fade bs-example-modal-sm" id="shopDeleteAdmin" tabindex="-1" role="dialog" aria-labelledby="shopDeleteAdmin" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">您确认删除吗?</h4>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
	</form> --%>

	<!-- #添加商品模态框 -->
	<form action="${pageContext.request.contextPath }/addGoods" method="post" enctype="multipart/form-data">

		<div class="modal fade" id="addShopAdmin" tabindex="-1" role="dialog" aria-labelledby="addShopAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">添加商品</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">商品名</label>
							<input type="text" class="form-control" id="" value="" name="name" ng-model="addName" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">商品展示图</label>
							<div style="text-align: center;">
								<input type="file" id="goodsupload_add" accept="image/*" name="upload" required="required">
								<img id="goods_add" alt="商品展示图" style="width: 70%; height =90%; display: none;">
								<br />
								<div id="deleteimage_add" class="file-del" style="display: none;">删除</div>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">价格</label>
							<input type="number" class="form-control" id="" name="price" value="" ng-model="addPrice" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">库存</label>
							<input type="number" class="form-control" id="" value="" name="stock" ng-model="addStock" required="required">
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