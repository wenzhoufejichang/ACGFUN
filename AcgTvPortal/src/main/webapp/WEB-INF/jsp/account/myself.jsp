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
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/5836fb1ef629dc16884f4127.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>
<title>个人中心</title>
<style type="text/css">
.myself_bar {
	width: 100%;
	height: 280px;
	background-color: grey;
	margin-top: -21px;
	background: <c:if test="${empty requestScope.myselfBar }">          
url(${pageContext.request.contextPath}/static/photo/index/bar.png)</c:if>   
		      
	
	<c:if test="${!empty requestScope.myselfBar  }">          
	
	url(${pageContext.request.contextPath}/static/${requestScope.myselfBar.src})</c:if>
		
		
		
		
		
		
		
		
		
		
		 
		no-repeat center center;
	background-size: cover;
}

td p {
	margin-left: 40px;
}

td h4 {
	margin-left: 30px;
}

#icon {
	width: 100px;
	height: 100px;
	margin-top: -50px;
}

#message p {
	line-height: 2em;
}
</style>
</head>

<body>
	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->
	<!-- bar图 [[ -->
	<div class="myself_bar"></div>
	<a href="#!" data-toggle="modal" title="点击我上传头像~" data-target="#myModal">
		<img src="${pageContext.request.contextPath }/${sessionScope.user.icon }" alt="..." class="img-circle center-block" id="icon">
	</a>
	<h3 class="text-center" style="margin: 0">${sessionScope.user.username }</h3>
	<p class="text-center" style="margin: 0">${sessionScope.user.introduce }</p>
	<br>
	<br>
	<!-- 主体内容 [[ -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<table class="table table-bordered" style="background-color: white;">
					<tr>
						<td>
							<h4 class="css73bee384d5489">
								<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>
								我最近收藏的视频
							</h4>

							<c:forEach items="${requestScope.list }" var="v" begin="0" end="3">
								<div class="col-lg-3 col-md-3 col-sm-3">
									<a href="${pageContext.request.contextPath }/index-play-show/${v.id }" class="thumbnail" target="_blank">
										<img src="${pageContext.request.contextPath }/${v.src }" alt="">
									</a>
								</div>
							</c:forEach>

							</t1d>
					</tr>
					<tr>
						<td>
							<h4 class="css73bee384d5489">
								<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>
								我最近评论
							</h4>
							<div class="list-group">
								<c:forEach items="${requestScope.mycomments }" var="c">
									<a href="${pageContext.request.contextPath }/index-play-show/${c.videoId.id}" class="list-group-item" target="_blank">${c.content }
										<span class="pull-right" style="color: grey">
											<fmt:formatDate value="${c.createTime }" pattern="yyyy-MM-dd hh:mm:ss" />
										</span>
									</a>
								</c:forEach>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-lg-4">
				<div class="list-group">
					<div class="list-group-item">
						<h4 class="list-group-item-heading css73bee384d5489">
							<img src="${pageContext.request.contextPath }/static/photo/index/title_logo.png" width="50" height="35""></img>
							个人介绍
						</h4>
					</div>
					<div class="list-group-item" id="message">
						<p class="list-group-item-text">昵称 : ${sessionScope.user.username }</p>
						<p class="list-group-item-text">个性签名 : ${sessionScope.user.introduce }</p>
						<p class="list-group-item-text">
							出生日期 :
							<fmt:formatDate value="${sessionScope.user.birth }" pattern="yyyy-MM-dd" />
						</p>
						<p class="list-group-item-text">
							性别 :
							<c:if test="${sessionScope.user.sex == 'm' }">男</c:if>
							<c:if test="${sessionScope.user.sex == 'f' }">女</c:if>
						</p>
						<p class="list-group-item-text">
							注册时间 :
							<fmt:formatDate value="${sessionScope.user.createTime }" pattern="yyyy-MM-dd" />
						</p>
						<p class="list-group-item-text">硬币数 : ${sessionScope.user.dollar }</p>
						<p class="list-group-item-text">视频收藏数 : ${requestScope.collectvideosnumber }</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 主体内容 ]] -->

	<!-- 修改头像模态框 [[ -->
	<form action="${pageContext.request.contextPath }/account-icon-execute" method="post" enctype="multipart/form-data" id="imageform">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<i class="glyphicon glyphicon-picture"></i>
							上传用户头像
						</h4>
					</div>
					<div class="modal-body">
						<input type="file" id="exampleInputFile" name="file">
						<p class="help-block">请上传小于10MB的图像文件</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">不了</button>
						<button type="submit" class="btn btn-primary" style="background-color: #f36c60;" id="uploadBtn">上传头像</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(function() {

			$("#uploadBtn").on("click", function() {
				if ($("#exampleInputFile").val() == "") {
					return false;
				}

			});

		});
	</script>
	<!-- 修改头像模态框 ]] -->


	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->
	<jsp:include page="../common/friend_link.jsp"></jsp:include>
	<!-- 友情链接部分 ]] -->

</body>
</html>