<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지</title>
<%@ include file="/layout/common.jsp" %>
<style>
 #lectureMainContainer{
 	height:500px;
 }

</style>

</head>
<body>
<%@ include file="/layout/menu.jsp" %>
	<header>
        <div id="lectureMainContainer" class="container" style>
            <div class="intro-text">
                <div class="intro-heading">관리페이지</div>
            </div>
        </div>
    </header>
    <section>
    	<div class="container">
			<div class="col-md-8 col-md-offset-2">
				<a class="btn btn-large btn-warning col-md-6" href="${ctx}/lecture/list.do"><h1>강의관리</h1></a>
				<a class="btn btn-large btn-warning col-md-6" href="${ctx}/views/manage/createLecture.jsp"><h1>강의생성</h1></a>
				<a class="btn btn-large btn-warning col-md-6" href="${ctx}/comment/list.do"><h1>댓글관리</h1></a>
				<a class="btn btn-large btn-warning col-md-6" href="${ctx}/user/list.do"><h1>유저관리</h1></a>
			</div>
		</div>
	</section>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>