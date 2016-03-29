<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의리스트</title>
<%@ include file="/layout/common.jsp" %>

<style>

 
 .content{
 	font-size:20px;
 	font-weight:bold;
 }
.course-max-width {
    max-width: 1000px;
    margin: auto;
}

</style>

</head>
<body>
<%@ include file="/layout/menu.jsp" %>
	<header>
        <div id="lectureMainContainer" class="container" style>
            <div class="intro-text">
                <div class="intro-heading">${category}</div>
            </div>
        </div>
    </header>
    <section>
		<c:choose>
			<c:when test="${not empty lecturesByCategory}">
				<ul id="courses" class="discover-courses-list multi-line ud-courseimpressiontrackerwide" data-tracking-type="mark-as-seen">
					<c:forEach items="${lecturesByCategory}" var="lecture">
						<li class="course-card-wide course-max-width" style="margin-bottom:20px;">
				    		<a href="${ctx}/lecture/selectedLecture.do?id=${lecture.id}">
				            	<span class="thumb">
				                	<img id="icon" src="${lecture.iconImg}">
				            	</span>
				            	<span class="details">
					                <div class="fxac">
					                    <span class="content">Title: ${lecture.lectureName}</span>
					                </div>
					                <span class="content">강의자: ${lecture.instructor}</span>
					            	<span class="bottom">
					                    <div class="others">
					                        <span class="ins-name ellipsis">
					                        	${lecture.description}
					                        </span>
					                    </div>
				                	</span>
					            </span>
				    		</a>
						</li>
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
        		<div class="container">
            		<div class="row">
		                <div class="col-lg-12 text-center">
		                    <h3 class="section-subheading text-muted">"준비 중 입니다"</h3>
		                </div>
           			 </div>
        		</div>
			</c:otherwise>
		</c:choose>
	</section>                                        
   		
	
<%@ include file="/layout/footer.jsp" %>
</body>
</html>