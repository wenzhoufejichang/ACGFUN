<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
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
<!-- <link href='//cdn.webfont.youziku.com/webfonts/nomal/21641/19673/582db26ff629d8136ca2dbc5.css' rel='stylesheet' type='text/css' />
 -->
<!-- 引用弹幕播放器相关样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css">
<!-- 引入jQuery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/jquery-2.0.2.js"></script>
<!-- 引入Bootstrap框架js部分 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/framework/bootstrap.min.js"></script>
<title>ACGFUN,让我们一起搞事情!~</title>
<script src="${pageContext.request.contextPath }/static/js/jquery.shCircleLoader.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery.danmu.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/static/js/main.js" type="text/javascript"></script>
<script>
var videoId = ${requestScope.video.id};
	$(function() {
	
		$("#danmup")
				.DanmuPlayer(
						{
							src : "http://${requestScope.video.avSrc}", //视频播放地址
							height : "480px", //区域的高度
							width : "845px", //区域的宽度
							urlToGetDanmu : "${pageContext.request.contextPath }/getAllDanmu/${requestScope.video.id }",
							urlToPostDanmu:"${pageContext.request.contextPath }/index-danmu-ajax"
							
						});

		 <c:if test="${sessionScope.user != null}">
		 var userid	=${sessionScope.user.id};	
			$.post("${pageContext.request.contextPath }/play-isExist",{'videoId':videoId,'userId':userid},function(data){
				
				
				if(data>0){
					$("#add").empty();
					$("#add").html("<a href='javasrcipt:void(0)' onclick='deletes(${requestScope.video.id})' style='color: grey;' id='addLike'>取消收藏</a>");
				}else if(data==0){
					$("#add").empty();
					$("#add").html("<a href='javasrcipt:void(0)' onclick='add(${requestScope.video.id})' style='color: grey;' id='addLike'>加入收藏</a>");
					
				}
			},"json")
		</c:if>
		
	});
	
	
	
	function add(id){
	
		 <c:if test="${sessionScope.user != null}">
		var	 userid	=${sessionScope.user.id};	 		
		</c:if>
		
		$.ajax({url:"${pageContext.request.contextPath}/index-like-execute",data:{'videoId':id,'userId':userid},success:function(data){
			
			
			if(data.code==200){
				
				$("#add").empty();
				$("#add").html("<a href='javasrcipt:void(0)' onclick='deletes(${requestScope.video.id})' style='color: grey;' id='addLike'>已经收藏</a>");
			}
			
			
		},dataType:"json",  type: "POST",
});
		
		
	}
	
	function deletes(id){
		
		 <c:if test="${sessionScope.user != null}">
		var	 userid	=${sessionScope.user.id};	 		
		</c:if>
		
		$.ajax({url:"${pageContext.request.contextPath}/play-delete",data:{'videoId':id,'userId':userid},success:function(data){
			
			
			if(data.code==200){
				
				$("#add").empty();
				$("#add").html("<a href='javasrcipt:void(0)' onclick='add(${requestScope.video.id})' style='color: grey;' id='addLike'>加入收藏</a>");
			}
			
			
		},dataType:"json",  type: "POST",
});
		
		
	}
</script>





</head>

<body>

	<c:if test="${requestScope.video.id != 75 }">
		<div class="alert alert-danger" role="alert">
			<p>因为资源有限,我们无法将所有视频资源展示出来, 如果需要查看播放视频效果请点击下方按钮进入演示页</p>
			<button type="button" class="close" data-dismiss="alert" id="closeBtn">
				<span aria-hidden="true">&times;</span>
				<span class="sr-only">Close</span>
			</button>
			<br>
			<a href="${pageContext.request.contextPath }/index-play-show/75" type="button" class="btn btn-danger">进入演示页</a>
			<button type="button" class="btn btn-default" id="closeBtn2">不了</button>
		</div>
		</div>
		<script type="text/javascript">
			$("#closeBtn, #closeBtn2").on("click", function() {
				$(".alert-danger").slideUp(500);
				return false;
			})
		</script>
	</c:if>



	<!-- 网站主体导航栏 [[ -->
	<jsp:include page="../common/index_navigation_bar.jsp"></jsp:include>
	<!-- 网站主体导航栏 ]] -->

	<!-- 主站bar图 [[ -->
	<jsp:include page="../common/index_bar.jsp" />

	<!-- 主站bar图 ]] -->

	<!-- 视频分类导航栏 [[ -->

	<div class="container-fluid" style="background-color: white; color: red;">
		<jsp:include page="../common/video_navigation_bar.jsp" />

		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
				<h4 style="color: #000; line-height: 1.5em;">${requestScope.video.name }</h4>
				<p style="color: #aaa">
					类别:${requestScope.video.videoType.typeName } &nbsp;&nbsp;&nbsp;&nbsp; 时间:
					<fmt:formatDate value="${requestScope.video.createTime }" pattern="yyyy-MM-dd hh:mm:ss" />
					&nbsp;&nbsp;&nbsp;&nbsp;

					<span id="add"> </span>

				</p>

			</div>
		</div>
	</div>
	<!-- 收藏操作 -->
	<!-- <script type="text/javascript">
		$("#addLike").on("click", function() {
			var url = "${pageContext.request.contextPath}/index-like-ajax";
			var args = {"videoId":"${requestScope.video.id}", "time":new Date()};
			$.post(url, args, function(data) {
				if (data == 1) {
					alert("收藏成功");
				} else {
					alert("收藏失败");
				}
			});
			return false;
		})
	</script>	 -->
	<!-- 对应类型导航栏高亮 -->
	<!-- <script type="text/javascript">
		var className = ".nav${requestScope.video.videoType.id }";
		$(className + " a").css("color", "#f36c60");
		$(className).css("borderBottom", "1px solid #f36c60");
	</script> -->
	<!-- 视频分类导航栏 ]] -->

	<!-- 播放视频 [[ -->
	<br>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div id="danmup" style="margin: 20px auto" class="hidden-sm hidden-xs"></div>
				<div class="embed-responsive embed-responsive-16by9 hidden-lg hidden-md">
					<video class="embed-responsive-item" src="http://${requestScope.video.avSrc}" controls="controls"></video>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 播放视频 ]] -->

	<!-- 评论部分 [[ -->
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1" id="commentSuccess" style="display: none;">
				<h4 class="text-center">恭喜您评论成功√</h4>
			</div>
			<div class="col-lg-10 col-lg-offset-1" id="commentError" style="display: none;">
				<h4 class="text-center">您评论的内容不能为空 ◑▂◐</h4>
			</div>
			<div class="col-lg-10 col-lg-offset-1" id="commentDiv">

				<shiro:notAuthenticated>

					<h4 class="text-center">尚未登录的用户无法评论哦,赶快登录吧~</h4>

				</shiro:notAuthenticated>
				<shiro:authenticated>

					<form action="#!" method="post">
						<textarea class="form-control" rows="3" placeholder="请发表您的评论哦~" id="commentValue"></textarea>
						<br>
						<button type="submit" class="btn btn-default pull-right" style="background-color: #f36c60; color: white;" id="commentBtn">发表评论</button>
					</form>

				</shiro:authenticated>
				<%-- <c:if test="${sessionScope.user != null }">
				
				</c:if> --%>
				<script type="text/javascript">
					//提交内容为空
					$("#commentBtn")
							.on(
									"click",
									function() {
										var value = $("#commentValue").val();
										value = $.trim(value);
										if (value == "") {
											$("#commentError").slideDown(
													500,
													function() {
														$("#commentError")
																.slideUp(500);
													});
											return false;
										}
										var url = "${pageContext.request.contextPath}/index-comment-ajax";
										var url2 = "${pageContext.request.contextPath}/index-comment-ajax?content="
												+ value
												+ "&videoId=${requestScope.video.id }";
										//var args = {"content":value, "videoId":"${requestScope.video.id}", "time":new Date()};
										var args = null;
										$
												.get(
														url2,
														args,
														function(data) {
															if (data == 1) {
																$("#commentDiv")
																		.hide(
																				1000);
																$(
																		"#commentSuccess")
																		.show(
																				1000,
																				function() {
																					$(
																							"#commentSuccess, #commentHr")
																							.slideUp(
																									1000);
																				});
															}
															if (data == 0) {
																alert("评论失败,请检查您的评论内容是否合法!");
															}
														});
										return false;
									})
				</script>
			</div>
		</div>
		<hr id="commentHr">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1" id="commentDiv">

				<c:forEach items="${requestScope.video.list }" var="vc">
					<div class="media">
						<a class="media-left media-middle" href="javascript:void(0)">
							<img src="${pageContext.request.contextPath }/${vc.userId.icon }" style="width: 25px; height: 25px;" class="img-circle">
						</a>
						<div class="media-body">
							<p>
								<strong>@${vc.userId.username }</strong>
								&nbsp;&nbsp;
								<span style="font-size: 12px; color: #aaa">
									<fmt:formatDate value="${vc.createTime }" pattern="yyyy-MM-dd hh:mm:ss" />
								</span>
							</p>
							<p>${vc.content }</p>
						</div>
					</div>
					<hr>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 评论部分 ]] -->





	<br>
	<br>
	<br>
	<!-- 友情链接部分 [[ -->



	<jsp:include page="../common/friend_link.jsp"></jsp:include>

	<!-- 友情链接部分 ]] -->

</body>
</html>