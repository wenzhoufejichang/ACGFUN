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
<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet" type="text/css">
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/bootstrap.min.js"></script>
<script type="text/javascript" src="http://v3.bootcss.com/assets/js/docs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular-route.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/d3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pageMe.js"></script>
<title>视频相关管理</title>
</head>
<body>
	<!-- 视频类型数统计 -->
	<h2 class="page-header">
		视频类型数统计
		<small> x:视频类型ID | y:拥有视频数</small>
	</h2>
	<style type="text/css">
.axis path, .axis line {
	fill: none;
	stroke: black;
	shape-rendering: crispedges;
}

.axis text {
	font-family: sans-serif;
	font-size: 11px;
}

.myRect {
	fill: steelblue;
}

.myText {
	fill: white;
	text-anchor: middle;
}

/* 外面盒子样式---自己定义 */
.page_div {
	margin: 20px 10px 20px 0;
	color: #666
}
/* 页数按钮样式 */
.page_div button {
	display: inline-block;
	min-width: 30px;
	height: 28px;
	cursor: pointer;
	color: #666;
	font-size: 13px;
	line-height: 28px;
	background-color: #f9f9f9;
	border: 1px solid #dce0e0;
	text-align: center;
	margin: 0 4px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

#firstPage, #lastPage, #nextPage, #prePage {
	width: 50px;
	color: #0073A9;
	border: 1px solid #0073A9
}

#nextPage, #prePage {
	width: 70px
}

.page_div .current {
	background-color: #0073A9;
	border-color: #0073A9;
	color: #FFF
}
/* 页面数量 */
.totalPages {
	margin: 0 10px
}

.totalPages span, .totalSize span {
	color: #0073A9;
	margin: 0 5px
}
/*button禁用*/
.page_div button:disabled {
	opacity: .5;
	cursor: no-drop
}

#tooltip {
	position: absolute;
	border: 1px solid #ccc;
	background: #333;
	padding: 2px;
	display: none;
	color: #fff
}

.file-del {
	margin-top: 20px;
	cursor: pointer;
	display: inline-block;
	*display: inline;
	*zoom: 1;
}
</style>
	<div id="videoTypeNum"></div>
	<script type="text/javascript">
		function videoTypeNum() {
			var body = d3.select("#videoTypeNum");
			var svg = body.append("svg").attr("width", 1000)
					.attr("height", 400);

			//2. 坐标轴
			var xScale = d3.scale.ordinal().domain(
					[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).rangeRoundBands(
					[ 0, 500 ]);
			var yScale = d3.scale.linear().domain([ 100, 0 ]).range([ 0, 250 ]);
			var xAxis = d3.svg.axis().scale(xScale).orient("bottom");
			var gxAxis = svg.append("g").attr("class", "axis").attr(
					"transform", "translate(30, 300)").call(xAxis);
			var yAxis = d3.svg.axis().scale(yScale).orient("left");
			var gyAxis = svg.append("g").attr("class", "axis").attr(
					"transform", "translate(30, 50)").call(yAxis);
			//3. 完整的柱状图
			var dataSet = [ 47, 21, 43, 46, 67, 54, 45, 58, 54, 31 ];
			yScale.domain([ 0, 100 ]);
			var rects = svg.selectAll(".myRect").data(dataSet).enter().append(
					"rect").attr("class", "myRect").attr("transform",
					"translate(30, 50)").attr("x", function(d, i) {
				return xScale(i);
			}).attr("y", function(d, i) {
				return 400 - 150 - yScale(d);
			}).attr("width", function() {
				return xScale.rangeBand() - 4;
			}).attr("height", function(d) {
				return yScale(d);
			});
			var texts = svg.selectAll(".myText").data(dataSet).enter().append(
					"text").attr("class", "myText").attr("transform",
					"translate(30, 50)").attr("x", function(d, i) {
				return xScale(i);
			}).attr("y", function(d, i) {
				return 400 - 150 - yScale(d);
			}).attr("dx", function(d, i) {
				return xScale.rangeBand() / 2;
			}).attr("dy", function(d, i) {
				return 15;
			}).text(function(d, i) {
				return d;
			});
		}
		
		function  deletevideo(id){
			
	if(		window.confirm("是否删除?")){
				var index=1;
				if(${requestScope.pagezxx.index}>1){
					index=${requestScope.pagezxx.index};
				}
				location.href="${pageContext.request.contextPath }/delete/15/"+index+"/"+id	
				
			}
			
			
		}

		function change(id){
			$.ajax({data : {"id" : id},url:"${pageContext.request.contextPath}/show",type:"POST",success : function (data){
				
				$("#id").val(data.id);
				$("#name").val(data.name);
				$("#src").attr("src","${palette_url }/"+data.src);
				$("#avSrc").val(data.avSrc);
				$('#videoAdmin').modal('show');
				
				var index=1;
				if(${requestScope.pagezxx.index}>1){
					index=${requestScope.pagezxx.index};
				}
				$("#start").val(index)
			},dataType:"json"});
		}
		
	
		
		
		$(function() {
			
		
			$("#addVideoAdmin").on("show.bs.modal",function(){
				$.post(   "${pageContext.request.contextPath}/videoTypes",function(data){
				var s="";
				$.each( data, function(i, n){
					 s+="<option value='"+n.id+"'>"+n.typeName+"</option>"
					});
				$("#videoType").append(s);
				});
			});
			
			
			
			
			$("#upload_add").change(function(){
				
			var files=	$("#upload_add")[0].files;
			
			
			var fd=new FileReader();
			
			fd.readAsDataURL(files[0]);
			fd.onload =function(){
				
				$("#src_add").attr("src",fd.result);
				$("#src_add").css("display","");
				$("#deleteimage_add").css("display","");
				$("#upload_add").css("display","none");
			};
			
			});
			
			$("#deleteimage_add").click(function (){
				$("#src_add").css("display","none");
				$("#upload_add").css("display","");
				$("#upload_add").val("");
				$("#deleteimage_add").css("display","none");
			});
			
			
			$('#addVideoAdmin').on('hidden.bs.modal', function () {
				$("#deleteimage_add").css("display","none");
				$("#src_add").css("display","none");
				$("#upload_add").css("display","");
				$("#upload_add").val("");
				});
			
			
		$("#upload").change(function(){
			
		var files=	$("#upload")[0].files;
		
		
		var fd=new FileReader();
		
		fd.readAsDataURL(files[0]);
		fd.onload =function(){
			
			$("#src").attr("src",fd.result);
			$("#src").css("display","");
			$("#deleteimage").css("display","");
			$("#upload").css("display","none");
		};
		
		});
		
		
		$('#videoAdmin').on('hidden.bs.modal', function () {
			$("#deleteimage").css("display","");
			$("#src").css("display","");
			$("#upload").css("display","none");
			});
		$('#videoAdmin').on('shown.bs.modal', function () {
			$("#name")[0].focus();
			});
			
			$("#deleteimage").click(function (){
				$("#src").css("display","none");
				$("#upload").css("display","");
				$("#upload").val("");
				$("#deleteimage").css("display","none");
			});
			
			videoTypeNum();
			
			var index=1;
			if(${requestScope.pagezxx.index}>1){
				index=${requestScope.pagezxx.index};
			}
			$("#page").paging({
				pageNum : index, // 当前页面
				totalNum : ${requestScope.pagezxx.pages}, // 总页码
				totalList : ${requestScope.pagezxx.total}, // 记录总数量
				callback : function(num) { //回调函数
					location.href="${pageContext.request.contextPath }/videoConfig/15/"+num
				}
			});
			
			
			
			var x = 10;
			var y = 20;
			$("img[name='image']").mouseover(function(e){
				
				var tooltip = "<div id='tooltip'><img src='"+this.src+"'alt='预览图片'  /></div>"; //创建 div 元素
				$("body").append(tooltip);	//把它追加到文档中	
				$("#tooltip")
					.css({
						"top": (e.pageY+y) + "px",
						"left":  (e.pageX+x)  + "px"
					});
				$("#tooltip").show("fast");	  //设置x坐标和y坐标，并且显示
				
		    });
			$("img[name='image']").mouseout(function(){
				
				$("#tooltip").remove();	 //移除 
		    });
			 $("img[name='image']").mousemove(function(e){
				$("#tooltip")
					.css({
						"top": (e.pageY+y) + "px",
						"left":  (e.pageX+x)  + "px"
					});
				
			}); 




		});
	</script>

	<!-- 视频相关管理 [[-->
	<h2 class="page-header">
		视频管理
		<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#addVideoAdmin">添加</button>
	</h2>

	<div class="table-responsive">


		<div class="table-responsive" style="text-align: center;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="text-align: center;">编号ID</th>
						<th style="text-align: center;">视频名</th>
						<th style="text-align: center;">视频展示图链接</th>
						<th style="text-align: center;">播放地址</th>
						<th style="text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>


					<c_rt:forEach items="${requestScope.pagezxx.list}" var="item">
						<tr ng-repeat="item in videoData">
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>
								<a href="${palette_url }/${item.src}" target="_blank">
									<img alt="图片" src="${palette_url }/${item.src}" style="width: 50px; height: 40px" name="image">
								</a>
							</td>
							<td>${item.avSrc}</td>
							<td>
								<button onclick="change(${item.id})" class="btn btn-default btn-xs">修改</button>

								<button class="btn btn-default btn-xs" onclick="deletevideo('${item.id}')">删除</button>

							</td>
						</tr>

					</c_rt:forEach>
				</tbody>
			</table>
			<div id="page" class="page_div"></div>
		</div>



		<%-- <iframe width="100%" height="400px" scrolling="yes" id="end" src="${pageContext.request.contextPath }/part/6/1"></iframe> --%>
	</div>

	<!-- 视频相关管理 ]]-->

	<!-- 模态框 [[-->
	<!-- #修改视频管理模态框 -->
	<form enctype="multipart/form-data" action="${pageContext.request.contentType }/chagne" method="post">
		<div class="modal fade" id="videoAdmin" tabindex="-1" role="dialog" aria-labelledby="videoAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">视频管理</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" class="form-control" id="id" value="" name="id">
							<input type="hidden" class="form-control" value="" name="start" id="start">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">视频名称</label>
							<input type="text" class="form-control" id="name" value="" ng-model="alterVideoName" name="name">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">视频展示图链接</label>
							<div style="text-align: center;">
								<input type="file" id="upload" style="display: none;" accept="image/*" name="upload">
								<img id="src" alt="视屏封面" src="" style="width: 50%;">
								<br />
								<div id="deleteimage" class="file-del">删除</div>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">播放地址</label>
							<input type="text" class="form-control" id="avSrc" value="" ng-model="alterVideoAvSrc" name="avSrc">
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

	<!-- #添加视频模态框 -->
	<form action="${pageContext.request.contentType }/add" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="addVideoAdmin" tabindex="-1" role="dialog" aria-labelledby="addVideoAdmin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="">添加视频</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">视频名称</label>
							<input type="text" class="form-control" ng-model="addVideoName" required="required" name="name">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">视频展示图链接</label>
							<div style="text-align: center;">
								<input type="file" id="upload_add" accept="image/*" name="upload">
								<img id="src_add" alt="视屏封面" style="width: 70%; height =90%; display: none;">
								<br />
								<div id="deleteimage_add" class="file-del" style="display: none;">删除</div>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">播放地址</label>
							<input type="text" class="form-control" ng-m ceeeeee xrrrrrrrrrrrrrrrrrrrrrrrrrodel="addVideoAvSrc" name="avSrc">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">视频类型</label>
							<select class="form-control" id="videoType" name="videoType.id" required="required">
								<option value="0">请选择</option>
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
	<!-- 模态框 ]]-->

</body>
</html>