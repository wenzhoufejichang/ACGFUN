<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<head>
<!-- 引入Title图标 -->
<link href="${pageContext.request.contextPath }/static/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<!-- 声明页面信息与字符编码集 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 声明移动端响应式布局-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入Bootstrap框架样式部分-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/framework/bootstrap.min.css" />
<!-- 引入该页面对应样式表 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/index.css" />
<!-- 引入logo使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/46833/582d7e08f629d8136ca2db97.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入类型标题使用的网络字库 -->
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/5835a40cf629e303883534e6.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>
<title>用户信息修改</title>
<style type="text/css">
.register_bar {
	width: 100%;
	height: 300px;
	background-color: orange;
	margin-top: -21px;
	background:
		url(${pageContext.request.contextPath}/static/photo/account/register_bar.png)
		no-repeat center center;
	background-size: cover;
}

td p {
	margin-left: 40px;
}

td h4 {
	margin-left: 30px;
}

.p_lock_tips {
	position: absolute;
	top: 195px;
	height: 30px;
	padding: 5px;
	display: none;
	text-align: center;
	border: 1px solid #dad699;
	background: #f9f5c7;
	border-radius: 2px;
	z-index: 1000;
	left: 50px;
}

.p_lock_tips_row {
	position: absolute;
	top: -6px;
	left: 25px;
	width: 12px;
	height: 6px;
	background: url(https://ui.ptlogin2.qq.com/style/11/images/icon_3.png)
		-162px -168px no-repeat
}
</style>
</head>
<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->
	<br>
	<br>
	<!-- 编辑信息 [[ -->
	<form action="${pageContext.request.contextPath}/account-edit-execute" method="post">
		<input type="hidden" name="id" value="${sessionScope.user.id }">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">
					<table class="table table-bordered" style="text-align: center;">
						<tr>
							<td>
								<h3>
									<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35"></img>
									<span class="css736b219905489">个人信息修改</span>
								</h3>
							</td>
						</tr>
						<tr>
							<td>
								<form>
									<br>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-user"></i>
										</span>
										<input type="text" class="form-control" placeholder="用户名" name="username" id="usernameInput" value="${sessionScope.user.username }" readonly="readonly">
									</div>
									<c:if test="${!empty   requestScope.username}">
										<font style="color: red;"> ${requestScope.username }</font>
									</c:if>
									<br>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-lock"></i>
										</span>
										<input type="password" class="form-control" placeholder="新密码" name="password" id="passwordInput" value="">
									</div>
									<div class="p_lock_tips" id="pcaps_lock_tips">
										<span class="p_lock_tips_row"></span>
										<span> 大写锁定已打开 </span>
									</div>
									<c:if test="${!empty   requestScope.password}">
										<font style="color: red;"> ${requestScope.password }</font>
									</c:if>
									<br>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-pencil"></i>
										</span>
										<input type="text" class="form-control" placeholder="个性签名" name="introduce" id="introduceInput" value="${sessionScope.user.introduce }">
									</div>
									<br>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-time"></i>
										</span>
										<input type="date" class="form-control" title="出生日期" name="birth" value="<fmt:formatDate value='${sessionScope.user.birth }' pattern='yyyy-MM-dd'/>">
									</div>

									<c:if test="${!empty   requestScope.birth}">
										<font style="color: red;"> ${requestScope.birth }</font>
									</c:if>

									<br>
									<div>
										<label>
											<span>性别 : </span>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="sex" value="m" id="sexM">
											♂男 &nbsp;&nbsp;
											<input type="radio" name="sex" value="f" id="sexF">
											♀女
										</label>
									</div>
									<c:if test="${!empty   requestScope.sex}">
										<font style="color: red;"> ${requestScope.sex }</font>
									</c:if>
									<br>
									<button type="submit" class="btn btn-info">修改</button>
								</form>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			var sex = "${sessionScope.user.sex}";
			if (sex == "m") {
				$("#sexM").attr("checked", "checked");
				$("#sexF").removeAttr("checked");
			}
			if (sex == "f") {
				$("#sexM").removeAttr("checked");
				$("#sexF").attr("checked", "checked");
			}

			$("#passwordInput").keyup(function() {

				let value = $("#passwordInput").val();
				let s = value.substr(value.length - 1, value.length);

				if (/^[A-Z]$/.test(s)) {
					$("#pcaps_lock_tips").css("display", "block");
				} else {
					$("#pcaps_lock_tips").css("display", "none");
				}
			});

			$("#passwordInput").blur(function() {
				$("#pcaps_lock_tips").css("display", "none");
			});

		});
	</script>
	<!-- 编辑信息 ]] -->
	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->
	<jsp:include page="../common/friend_link.jsp"></jsp:include>
	<!-- 友情链接部分 ]] -->
</body>
</html>