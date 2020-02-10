<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 声明移动端响应式布局-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入Bootstrap框架样式部分-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/framework/bootstrap.min.css" />
<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/bootstrap.min.js"></script>
<script type="text/javascript" src="http://v3.bootcss.com/assets/js/docs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/angular-route.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/framework/d3.min.js" charset="utf-8"></script>
<title>用户相关信息管理</title>
</head>
<body>
	<!-- 用户相关信息管理 [[ -->
	<!-- #近期用户量增长曲线 -->
	<h2 class="page-header">
		近期用户量增长曲线
		<small> x:n天前 | y:用户注册数</small>
	</h2>
	<style type="text/css">
.axis path, .axis line {
	fill: none;
	stroke: black;
	shape-rendering: crispedges;
}

.myPath {
	fill: none;
	stroke: black;
	stroke-width: 3px;
}
</style>
	<div id="userIncrease"></div>
	<script type="text/javascript">
		function userIncrease() {
			var body = d3.select("#userIncrease");
			var width = 1000;
			var height = 300;
			var svg = body.append("svg").attr("width", width).attr("height",
					height);

			//1. 读取json
			d3.json("json.json", function(error, jsondata) {
				if (error)
					console.log(error);
				console.log(jsondata);
				var xmax = d3.max(jsondata.data, function(d) {
					return d.x;
				});
				var ymax = d3.max(jsondata.data, function(d) {
					return d.y;
				});
				var xScale = d3.scale.linear().domain([ 0, xmax ]).range(
						[ 0, 600 ]);
				var yScale = d3.scale.linear().domain([ 0, ymax ]).range(
						[ 250, 0 ]);
				var xAxis = d3.svg.axis().scale(xScale).orient("bottom");
				var gxAxis = svg.append("g").attr("class", "axis").attr(
						"transform", "translate(100,250)").call(xAxis);
				var yAxis = d3.svg.axis().scale(yScale).orient("left");
				var gyAxis = svg.append("g").attr("class", "axis").attr(
						"transform", "translate(100,0)").call(yAxis);
				// 2. 线段生成器
				var line = d3.svg.line().x(function(d) {
					return xScale(d.x);
				}).y(function(d) {
					return yScale(d.y);
				}).interpolate("cardinal");
				// 3. 折线图
				svg.append("path").attr("class", "myPath").attr("d",
						line(jsondata.data)).attr("transform",
						"translate(100,100)");
			})
		}
		userIncrease();
	</script>

	<!-- #用户年龄段统计 -->
	<h2 class="page-header">
		用户年龄段统计
		<small> x:用户年龄 | y:用户量</small>
	</h2>
	<style>
.axis path, .axis line {
	fill: none;
	stroke: black;
	shape-rendering: crispEdges;
}

.axis text {
	font-family: sans-serif;
	font-size: 11px;
}

.MyCircle {
	fill: black;
}
</style>
	<div id="userAge"></div>
	<script>
		function userAge() {
			var body = d3.select("#userAge");

			var width = 1000;
			var height = 400;

			var svg = body.append("svg").attr("width", 1000)
					.attr("height", 400);

			// 2. 散点图

			var dataset = [];

			dataset.push({
				x : 15,
				y : 430
			});
			dataset.push({
				x : 20,
				y : 450
			});
			dataset.push({
				x : 25,
				y : 500
			});
			dataset.push({
				x : 30,
				y : 560
			});
			dataset.push({
				x : 35,
				y : 430
			});
			dataset.push({
				x : 40,
				y : 300
			});
			dataset.push({
				x : 45,
				y : 180
			});
			dataset.push({
				x : 50,
				y : 140
			});
			dataset.push({
				x : 55,
				y : 135
			});
			dataset.push({
				x : 60,
				y : 120
			});
			dataset.push({
				x : 65,
				y : 60
			});
			dataset.push({
				x : 70,
				y : 20
			});
			dataset.push({
				x : 75,
				y : 7
			});
			dataset.push({
				x : 80,
				y : 2
			});

			// 比例尺

			var xScale = d3.scale.linear().domain([ 0, 100 ]).range([ 0, 600 ]);

			var yScale = d3.scale.linear().domain([ 1000, 0 ])
					.range([ 0, 250 ]);
			// 坐标轴

			var xAxis = d3.svg.axis().scale(xScale).orient("bottom");

			var gxAxis = svg.append("g").attr("class", "axis").attr(
					"transform", "translate(100,280)").call(xAxis);

			var yAxis = d3.svg.axis().scale(yScale).orient("left");

			var gyAxis = svg.append("g").attr("class", "axis").attr(
					"transform", "translate(100,30)").call(yAxis);

			// 散点

			var points = svg.selectAll(".MyCircle").data(dataset).enter()
					.append("circle").attr("class", "MyCircle").attr(
							"transform", "translate(100,30)").attr("r", 3)
					.attr("cx", function(d) {
						return xScale(d.x);
					}).attr("cy", function(d) {
						return yScale(d.y);
					});

			// 3. 数据更新

			function update() {
				for (var i = 0; i < dataset.length; i++) {
					dataset[i].x = Math.random() * 100;
					dataset[i].y = Math.random() * 100;
				}

				updatePoints();
			}

			function add() {
				dataset.push({
					x : Math.random() * 100,
					y : Math.random() * 100
				});

				updatePoints();
			}

			function sub() {
				dataset.pop();

				updatePoints();
			}

			function updatePoints() {

				var update = svg.selectAll(".MyCircle").data(dataset);

				var enter = update.enter();

				var exit = update.exit();

				enter.append("circle").attr("class", "MyCircle").attr(
						"transform", "translate(30,50)").attr("r", 10).attr(
						"cx", function(d) {
							return xScale(0);
						}).attr("cy", function(d) {
					return yScale(0);
				}).transition().duration(1000).ease("bounce").attr("cx",
						function(d) {
							return xScale(d.x);
						}).attr("cy", function(d) {
					return yScale(d.y);
				});

				update.transition().duration(1000).attr("cx", function(d) {
					return xScale(d.x);
				}).attr("cy", function(d) {
					return yScale(d.y);
				});

				exit.attr("fill-opacity", 1.0).transition().duration(1000)
						.attr("fill-opacity", 0.0).remove();
			}
		}
		userAge();
	</script>

	<!-- #用户信息展示-->
	<br>
	<h2 class="page-header">用户信息</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号ID</th>
					<th>用户名</th>
					<th>性别</th>
					<th>出生年月</th>
					<th>个人介绍</th>
				</tr>
			</thead>
			<tbody>

				<c_rt:forEach items="${requestScope.list }" var="user">

					<tr>
						<td>${user.id}</td>
						<td>${user.username}</td>
						<td>
							<c_rt:if test="${ user.sex == 'm'}">

								<div>男</div>
							</c_rt:if>
							<c_rt:if test="${ user.sex == 'f'}">
								<div>女</div>
							</c_rt:if>
						</td>
						<td>
							<fmt:formatDate value="${user.birth }" pattern="yyyy-MM-dd" />

						</td>
						<td>${user.introduce}</td>
					</tr>


				</c_rt:forEach>

			</tbody>
		</table>
	</div>

	<!-- 用户相关信息管理 ]] -->
</body>
</html>