<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABOUT</title>
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
                <div class="intro-heading">ABOUT US</div>
            </div>
        </div>
    </header>
	<section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
	                <h2 class="section-heading">
	                ABOUT US</h2>
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
			
<%@ include file="/layout/footer.jsp" %>
</body>
</html>