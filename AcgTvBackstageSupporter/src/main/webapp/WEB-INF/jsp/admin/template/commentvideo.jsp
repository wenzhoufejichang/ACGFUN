<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pageMe.js"></script>
<script type="text/javascript">

$(function(){
	var index=1;
	if(${requestScope.pagezxx.index}>1){
		index=${requestScope.pagezxx.index};
	}
	$("#page").paging({
		pageNum : index, // 当前页面
		totalNum : ${requestScope.pagezxx.pages}, // 总页码
		totalList : ${requestScope.pagezxx.total}, // 记录总数量
		callback : function(num) { //回调函数
			
			location.href="${pageContext.request.contextPath }/commentConfig/15/"+num
		}
	});
	
	
	
	
	
	
});


function select (id){
	window.open("${pageContext.request.contextPath }/comment/"+id,'_blank');
	
	
}


</script>
<style type="text/css">
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
</style>
<title>全部视频</title>
</head>
<body>
	<div class="table-responsive">


		<div class="table-responsive" style="text-align: center;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="text-align: center;">编号ID</th>
						<th style="text-align: center;">视频名</th>
						<th style="text-align: center;">视频展示图链接</th>
						<th style="text-align: center;">查询评论</th>
					</tr>
				</thead>
				<tbody>


					<c_rt:forEach items="${requestScope.pagezxx.list}" var="item">
						<tr ng-repeat="item in videoData">
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>

								<img alt="图片" src="${palette_url }/${item.src}" style="width: 50px; height: 40px" name="image">

							</td>

							<td>
								<button onclick="select('${item.id}')" class="btn btn-default btn-xs" data-toggle="modal">查询</button>
							</td>
						</tr>

					</c_rt:forEach>
				</tbody>
			</table>
			<div id="page" class="page_div"></div>
		</div>
</body>
</html>