<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/framework/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/index.css" />
<!-- 引入Bootstrap框架js部分 -->
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand css716dd981b5489" href="${pageContext.request.contextPath }/" style="color: #f36c60; font-size: 28px;">ACGFUN</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="">
						<a href="${pageContext.request.contextPath }/">
							<i class="glyphicon glyphicon-film" style="font-size: 10px;"></i>
							主站
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/palette-palette-show" target="_blank">
							<i class="glyphicon glyphicon-picture" style="font-size: 10px;"></i>
							画友
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/shop-shop-show" target="_blank">
							<i class="glyphicon glyphicon-shopping-cart" style="font-size: 10px;"></i>
							周边商城
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/game-game-show" target="_blank">
							<i class="glyphicon glyphicon glyphicon-fire" style="font-size: 10px;"></i>
							游戏
						</a>
					</li>
				</ul>
				<form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath }/index-search-execute" method="get">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="来啊, 搜我呀~" name="search">
						<input type="hidden" class="form-control" name="row" value="8">
						<input type="hidden" class="form-control" name="page" value="1">
						<input type="hidden" class="form-control" name="isajax" value="false">
						<input type="hidden" class="form-control" name="videotype" value="">
					</div>
					<button type="submit" class="btn btn-default" style="background-color: #f36c60;">
						<i class="glyphicon glyphicon-search" style="color: white;"></i>
					</button>
				</form>
				<ul class="nav navbar-nav navbar-right">


					<shiro:authenticated>


						<li>
							<a href="${pageContext.request.contextPath }/account-collect-show" target="_blank">收藏夹</a>
						</li>

					</shiro:authenticated>


					<li class="dropdown">
						<!-- 用户未登录显示部分 -->

						<shiro:notAuthenticated>


							<a href="javasrcipt:void(0)" class="dropdown-toggle" data-toggle="dropdown">
								登录/注册
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li>
									<a href="${pageContext.request.contextPath }/account-login-show" target="_blank">
										<i class="glyphicon glyphicon-user" style="color: #f36c60;"></i>
										用户登录
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="${pageContext.request.contextPath }/account-question-show" target="_blank">
										<i class="glyphicon glyphicon-plus-sign" style="color: #f36c60;"></i>
										注册账号
									</a>
								</li>
							</ul>

						</shiro:notAuthenticated>




						<!-- 用户已登录显示部分 -->

						<shiro:authenticated>

							<a href="javasrcipt:void(0)" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.user.username }
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li>
									<a href="${ pageContext.request.contextPath}/account-myself-show" target="_blank">
										<i class="glyphicon glyphicon-home" style="color: #f36c60;"></i>
										个人中心
									</a>
								</li>
								<li>
									<a href="${ pageContext.request.contextPath}/account-edit-show" target="_blank">
										<i class="glyphicon glyphicon-pencil" style="color: #f36c60;"></i>
										修改资料
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="${ pageContext.request.contextPath}/account-exit-execute">
										<i class="glyphicon glyphicon-circle-arrow-left" style="color: #f36c60;"></i>
										退出登录
									</a>
								</li>
							</ul>

						</shiro:authenticated>

					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</body>
</html>