<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 관리</title>
<%@ include file="/layout/common.jsp" %>
<script>
	var deleteLecture =function(lectureId){
		$.ajax({
			 url: "${ctx}/manage/removeLecture.do"
			,type: "post"
			,dataType: "json"
			,data: {lectureId:lectureId}
			,success: removeLecture
			,error: function(data){console.log("error")}
		});
	};
	var removeLecture = function(data){
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
                <div class="intro-heading">강의수정</div>
            </div>
        </div>
    </header>
    <section>
    	<div class="container">
			<div class="col-md-12">
		    	<table id="detailListTbl" class="table">
					<thead>
						<tr>
							<th>카테고리별 번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allAppinventorLectures}" var="lecture" varStatus ="sts">
							<tr id="${lecture.id}">
								<td>${sts.count}</td>
								<td>${lecture.category}</td>
								<td>${lecture.lectureName}</td>
								<td>
									<a class="btn btn-large btn-warning" href="${ctx}/manage/modifyLecture.do?id=${lecture.id}">
										수정
									</a>
								</td>
								<td>
									<button id="deleteLecture${lecture.id}" class="btn btn-large btn-warning" onclick="deleteLecture(${lecture.id});">삭제</button>
								</td>
							</tr>
						</c:forEach>
						<c:forEach items="${allPythonLectures}" var="lecture" varStatus ="sts">
							<tr id="${lecture.id}">
								<td>${sts.count}</td>
								<td>${lecture.category}</td>
								<td>${lecture.lectureName}</td>
								<td>
									<a class="btn btn-large btn-warning" href="${ctx}/manage/modifyLecture.do?id=${lecture.id}">
										수정
									</a>
								</td>
								<td>
									<button id="deleteLecture${lecture.id}" class="btn btn-large btn-warning" onclick="deleteLecture(${lecture.id});">삭제</button>
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