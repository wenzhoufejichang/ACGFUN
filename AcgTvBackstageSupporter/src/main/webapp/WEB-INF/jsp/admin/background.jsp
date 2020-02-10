<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
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
<script type="text/javascript">
	$(function() {

		$("a[name='side']").click(function() {
			//alert(this.href);

			$("#myif").attr("src", this.href);

			return false;
		});

		$("#myif").load(function() {
			if (window != top) {
				top.location.href = location.origin + location.pathname;
			}
		});

	});
</script>
<title>ACGFAN 控制台</title>
</head>
<body>
	<!-- 导航栏 [[ -->
	<div ng-controller="navController">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand css716dd981b5489" href="${pageContext.request.contextPath }/background" style="color: grey; font-size: 28px;">
						ACGFAN
						<small style="font-size: 20px;">控制台</small>
					</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="#/{{active}}" data-toggle="modal" data-target="#adminMsgModel" ng-click="navClick()">管理员信息</a>
						</li>
						<li>
							<a href="#/{{active}}" data-toggle="modal" data-target="#adminWork" ng-click="navClick()">工作任务</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/acgfan/admin-logout">退出</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- 导航栏 ]] -->

	<!-- 侧边功能栏 [[ -->
	<div class="container-fluid" ng-init="active='baseShow'">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">

				<shiro:hasAnyRoles name="1,2">
					<ul class="nav nav-sidebar">
						<!--             <li ng-class="{active:active=='baseShow'}"><a href="#/" ng-click="active='baseShow'">项目基本信息概述</a></li>-->



						<li ng-class="{active:active=='userConfig'}">
							<a href="${pageContext.request.contextPath }/userConfig" ng-click="active='userConfig'" name="side">用户相关信息管理</a>
						</li>
						<li ng-class="{active:active=='baseConfig'}">
							<a href="${pageContext.request.contextPath }/baseConfig" ng-click="active='baseConfig'" name="side">项目基本信息配置</a>
						</li>
					</ul>

				</shiro:hasAnyRoles>
				<ul class="nav nav-sidebar">
					<shiro:hasAnyRoles name="1,2,3">
						<li ng-class="{active:active=='videoConfig'}">
							<a href="${pageContext.request.contextPath }/videoConfig/15/1" ng-click="active='videoConfig'" name="side">视频相关管理</a>
						</li>
					</shiro:hasAnyRoles>

					<shiro:hasAnyRoles name="1,2">
						<li ng-class="{active:active=='indexConfig'}">
							<a href="${pageContext.request.contextPath }/indexConfig" ng-click="active='indexConfig'" name="side">展示轮播图相关管理</a>
						</li>
					</shiro:hasAnyRoles>

					<shiro:hasAnyRoles name="1,2,3">

						<li ng-class="{active:active=='commentConfig'}">
							<a href="${pageContext.request.contextPath }/commentConfig/15/1" ng-click="active='commentConfig'" name="side">视频评论相关管理</a>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="1,2,3">
						<li ng-class="{active:active=='danmuConfig'}">
							<a href="${pageContext.request.contextPath }/danmuConfig/15/1" ng-click="active='danmuConfig'" name="side">视频弹幕相关管理</a>
						</li>
					</shiro:hasAnyRoles>
				</ul>
				<ul class="nav nav-sidebar">
					<shiro:hasAnyRoles name="1,2,4">

						<li ng-class="{active:active=='shopConfig'}">
							<a href="${pageContext.request.contextPath }/shopConfig" ng-click="active='shopConfig'" name="side">周边商城相关管理</a>
						</li>
					</shiro:hasAnyRoles>

					<shiro:hasAnyRoles name="1,2,5">

						<li ng-class="{active:active=='gameConfig'}">
							<a href="${pageContext.request.contextPath }/gameConfig" ng-click="active='gameConfig'" name="side">游戏相关管理</a>
						</li>

					</shiro:hasAnyRoles>

					<shiro:hasAnyRoles name="1,2,6">

						<li ng-class="{active:active=='paletteConfig'}">
							<a href="${pageContext.request.contextPath }/paletteConfig" ng-click="active='paletteConfig'" name="side">画板相关管理</a>
						</li>
					</shiro:hasAnyRoles>

				</ul>


				<shiro:hasRole name="1">
					<ul class="nav nav-sidebar">
						<li ng-class="{active:active=='superConfig'}">
							<a href="${pageContext.request.contextPath }/superConfig" ng-click="active='superConfig'" name="side">
								<i class="glyphicon glyphicon-briefcase"></i>
								顶级管理者入口
							</a>
						</li>
					</ul>
				</shiro:hasRole>

			</div>
		</div>
	</div>
	<!-- 侧边功能栏 ]] -->

	<!-- 模态框 [[ -->
	<!-- #管理员信息模态框 -->
	<div ng-controller="navController" class="modal fade bs-example-modal-sm" id="adminMsgModel" tabindex="-1" role="dialog" aria-labelledby="adminMsgModel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="">管理员信息</h4>
				</div>
				<div class="modal-body">
					<p class="">
						<strong>工号 : </strong>
						${sessionScope.admin.id}
					</p>
					<p class="">
						<strong>姓名 : </strong>
						${sessionScope.admin.name}
					</p>
					<p class="">
						<strong>角色 : </strong>
						${sessionScope.admin.roleId.roleName}
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
	<!-- #工作任务模态框 -->
	<div ng-controller="navController" class="modal fade" id="adminWork" tabindex="-1" role="dialog" aria-labelledby="adminWork" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="">工作任务</h4>
				</div>
				<div class="modal-body">
					<p>${sessionScope.admin.work}</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框 ]] -->

	<!-- 主功能区 [[ -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" ng-view>


		<iframe src="" frameBorder="0" scrolling="auto" width="100%" height="800px" id="myif"
			οnlοad="document.getElementById('myif').style.height=((document.documentElement.clientHeight || document.body.clientHeight)-20+'px')"></iframe>





	</div>
	<!-- 主功能区 ]] -->

	<script type="text/javascript">
		//声明模块
		var app = angular.module("admin", [ "ngRoute" ]);
		//判断当前用户是否登录,如果未登录则重定向会首页
		app.run([ "$window", "$http", "$location",
				function($window, $http, $location) {
					$location.url("/"); //将加载页面的路由设置为根目录
					//获取登录状态
					$http({
						method : "get",
						url : "admin-islogin-ajax",
						params : {
							time : new Date()
						}
					}).success(function(data) {
						if (data == 0) {
							$window.alert("您尚未登录,无法进入控制台!");
							$window.location.href = "/acgfan/index-index-show";
						}
					});
				} ])
	</script>
	<!-- 加载各模块控制器 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/controller.js"></script>
	<!-- 配置前端路由-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/route.js"></script>
</body>

</html>