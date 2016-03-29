<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코멘트 관리</title>
<%@ include file="/layout/common.jsp" %>
<script>
	var removeComment = function(commentId){
		$.ajax({
			 url: "${ctx}/comment/remove.do"
			,type: "post"
			,dataType: "json"
			,data: {id:commentId}
			,success: removeSelectedComment
			,error: function(data){console.log("error")}
		});
	};
	var removeSelectedComment = function(data){
		$("#"+data).remove();
		alert("삭제 완료!");
	};

</script>

</head>
<body>
<%@ include file="/layout/menu.jsp" %>
	<header>
        <div id="lectureMainContainer" class="container" style>
            <div class="intro-text">
                <div class="intro-heading">댓글관리</div>
            </div>
        </div>
    </header>
    <section>
    	<div class="container">
			<div class="col-md-12">
		    	<table id="detailListTbl" class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>lectureId</th>
							<th>content</th>
							<th>userId</th>
							<th>userNickname</th>
							<th>createdDate</th>
							<th>확인하기</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${comments}" var="comment" varStatus ="sts">
								<tr id="${comment.id}">
									
									<td>${sts.count}</td>
									<td>${comment.lectureId}</td>
									<td>${comment.content}</td>
									<td>${comment.userId}</td>
									<td>${comment.userNickname}</td>
									<td>${comment.createdDate}</td>
									<td>
										<a class="btn btn-large btn-warning" href="${ctx}/lecture/selectedLecture.do?id=${comment.lectureId}">확인하기</a>
									</td>
									<td>
										<button id="removeComment${comment.id}" class="btn btn-large btn-warning" 
										onclick="removeComment(${comment.id});">삭제</button>
									</td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<%@ include file="/layout/footer.jsp" %>
</body>
</html>