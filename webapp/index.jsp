<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>드림코드 E-Learning</title>
	<%@ include file="/layout/common.jsp" %>
	<style>
	
	.lecture-thumb{
		border:3px solid #6b6b6b;
		border-radius:10px;
	}
	 #headerContainer{
	 	height:800px;
	 }
	 
	 .lectureName{
	
	 	text-align:center;
	 	margin-left:4%;
	 	margin-bottom:10%;
	 	padding-top:2%;
	 	height:50px;
	 	width:195px;
	 }
	 
	 #appinventorContents{
	 	margin-left:8%;
	 }
	</style>
</head>

<body id="page-top" class="index">
	<%@ include file="/layout/menu.jsp" %>
    <!-- Navigation -->

    <!-- Header -->
    <header>
        <div class="container">
            <div id="headerContainer" class="intro-text">
                <div class="intro-heading">:: DreamCode ::</div>
                <a href="http://www.dreamcode.co.kr" class="page-scroll btn btn-xl">ABOUT DREAMCODE</a>
            </div>
        </div>
    </header>

    <!-- Services Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
	                <h2 class="section-heading">
	                <a href="${ctx}/about.jsp">ABOUT US</a></h2>
                    <h3 class="section-subheading text-muted">"비전공자를 위한 프로그래밍 교육의 시작"</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img class = "aboutImg" src="${ctx}/resources/img/about/about_1.png">
                    </span>
                    <h4 class="service-heading">CODING?</h4>
                    <p class="text-muted">프로그래밍은 21세기의 교양!<br>이미 일부 선진국들의 초등교육과정에는<br>프로그래밍 수업이 포함되어 있습니다</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img class = "aboutImg" src="${ctx}/resources/img/about/about_2.png">
                    </span>
                    <h4 class="service-heading">EASY!</h4>
                    <p class="text-muted">프로그래밍, 어렵지 않습니다<br>비전공자들도 쉽게 배울 수 있는<br>재미있고 쉬운 강의들로 구성했습니다</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img class = "aboutImg" src="${ctx}/resources/img/about/about_3.png">
                    </span>
                    <h4 class="service-heading">DREAM CODE</h4>
                    <p class="text-muted">드림코드의 톡톡 튀는 동영상 강의로<br>더 빨리, 더 쉽게 배우실 수 있어요<br>여러분의 꿈을 직접 코딩해보세요!</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="appinventor" class="bg-light-gray">
        <div  class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">
                    <a href="${ctx}/lecture/listByCategory.do?category=appinventor">APPINVENTOR</a></h2>
                    <h3 class="section-subheading text-muted">"클릭 몇번으로 앱을 만들 수 있어요"</h3>
                </div>
            </div>
            <div id="appinventorContents" class="row">
            	<c:forEach items="${appinventorLectures}" var="lecture">
	                <div class="col-md-4 col-sm-6">
	                    <a href="${ctx}/lecture/selectedLecture.do?id=${lecture.id}" class="hvr-grow-shadow" data-toggle="modal">
	                        <div class="lecture-thumb">
	                            <div>
	                           		<img id="icon" src="${lecture.iconImg}" class="img-responsive" alt="">
	                            </div>
	                        </div>
	                        
	                    </a>
	                    <div class="lectureName">
	                        <h4>${lecture.lectureName}</h4>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="python">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                	<h2><a href="${ctx}/lecture/listByCategory.do?category=python">PYTHON</a></h2>
             
                    <h3 class="section-subheading text-muted">"준비 중 입니다"</h3>
                </div>
            </div>
        </div>
    </section>

	<%@ include file="/layout/footer.jsp" %>
       
</body>

</html>
