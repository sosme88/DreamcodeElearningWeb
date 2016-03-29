<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Custom Theme JavaScript -->

<div id="disabled"></div>
	
	<div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="${ctx}/start.jsp"><img id="logo" src ="${ctx}/resources/img/main/logo.png"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-left">
                	<li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${ctx}/about.jsp">ABOUT</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${ctx}/lecture/listByCategory.do?category=appinventor">APPINVENTOR</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${ctx}/lecture/listByCategory.do?category=python">PYTHON</a>
                    </li>
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                	<c:choose>
		            	<c:when test="${not empty sessionScope.loginUser.loginId}">
		            		<li>
			            		<a class="page-scroll" href="${ctx}/user/mypage.do"> ${sessionScope.loginUser.nickname}님 환영합니다.</a>
			            	</li>
			            	<c:if test="${sessionScope.loginUser.userType=='admin'}">
			            		<li>
			            			<a class="page-scroll" href="${ctx}/manage/main.do">관리</a>
		            			</li>
			            	</c:if>
			            	<li>
			            		<a class="page-scroll" href="${ctx}/user/logout.do">로그아웃</a>
		            		</li>
		            	</c:when>
		            	<c:otherwise>
				            <li>
					            <a id="loginBtn" class="page-scroll" href="javascript:;">로그인</a>
					        </li>
					        <li>
					            <a id="registerBtn" class="page-scroll" href="javascript:;">회원가입</a>
		        			</li>
		        		</c:otherwise>
	        		</c:choose>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </div>
   
<div id="registerLayer" style="display:none;">
	<form class="form-signin" onsubmit="userRegister(); return false;">
        <input type="text" id="loginIdRegister" class="form-control" name="loginId" placeholder="아이디" required autofocus>
        <input type="password" id="passwordRegister" class="form-control" name="password" placeholder="비밀번호" required>
        <input type="password" id="passwordConfirm" class="form-control" name="passwordConfirm" placeholder="비밀번호 확인" required>
        <input type="text" id="nicknameRegister" class="form-control" name="nickname" placeholder="닉네임" required>
        <input type="text" id="emailRegister" class="form-control" name="email" placeholder="이메일" required>
       
        <div class="row form-btn">
            <button class="btn btn-large btn-warning" type="submit">확인</button>
        </div>
	</form>
</div>
<div id="loginLayer" style="display:none;">
	
	<form class="form-signin" onsubmit="userLogin(); return false;">
        <input type="text" id="loginIdLogin" class="form-control" name="loginId" placeholder="아이디" required autofocus>
        <input type="password" id="passwordLogin" class="form-control" name="password" placeholder="비밀번호" required>
	       
        <div class="row form-btn">
	        <button class="btn btn-large btn-warning" type="submit">로그인</button>
	        <a id="findBtn" class="btn btn-large btn-warning" href="javascript:;">비밀번호찾기</a>
	    </div>
    </form>
	
</div>

<div id="findPasswordLayer" style="display:none;">
	
	<form class="form-signin" onsubmit="findPassword(); return false;">
        <input type="text" id="loginIdFindPassword" class="form-control" name="loginId" placeholder="아이디" required autofocus>
        <input type="password" id="passwordFindPassword" class="form-control" name="password" placeholder="이메일" required>
	       
        <div class="row form-btn">
	        <button class="btn btn-large btn-warning" type="submit">비밀번호 찾기</button>
	    </div>
    </form>
</div>


<div id="viewInformationLayer" style="display:none;">
	
	<form class="form-signin">
		<div class="form-group">
    		<label for="usr">USER-ID:</label>    		
        	<input type="text" id="selectedUserId" class="form-control" style="background-color:white;" disabled />
        </div>
		<div class="form-group">
    		<label for="usr">NICKNAME:</label>    		
        	<input type="text" id="selectedNickname" class="form-control" style="background-color:white;" disabled />
        </div>
        <div class="form-group">
    		<label for="usr">EMAIL:</label>    		
        	<input type="text" id="selectedEmail" class="form-control" style="background-color:white;" disabled />
        </div>
        
        <div class="form-group">
    		<label for="usr">INTRODUCTION</label>    		
        	<textarea rows="3" id="selectedIntroduction" class="form-control" style="background-color:white;" disabled></textarea>
        </div>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">



$(document).ready(function(){
	$("#loginBtn").click(function(){
		$("#registerLayer").fadeOut(100);
		$("#findPasswordLayer").fadeOut(100);
		$("#viewInformationLayer").fadeOut(100);
		$("#loginLayer").fadeIn(200);
		$("#disabled").fadeIn(200);
	});
	
	$("#registerBtn").click(function(){
		$("#loginLayer").fadeOut(100);
		$("#findPasswordLayer").fadeOut(100);
		$("#viewInformationLayer").fadeOut(100);
		$("#registerLayer").fadeIn(200);
		$("#disabled").fadeIn(200);
	});
	
	$("#findBtn").click(function(){
		$("#loginLayer").fadeOut(100);
		$("#findPasswordLayer").fadeIn(200);
		$("#disabled").fadeIn(200);
	});
	
	$("#disabled").click(function(){
		$(this).fadeOut(200);
		$("#loginLayer").fadeOut(200);
		$("#registerLayer").fadeOut(200);
		$("#findPasswordLayer").fadeOut(200);
		$("#viewInformationLayer").fadeOut(200);
	});
});
 
</script>



<script src="${ctx}/resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${ctx}/resources/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="${ctx}/resources/js/classie.js"></script>
<script src="${ctx}/resources/js/cbpAnimatedHeader.js"></script>


