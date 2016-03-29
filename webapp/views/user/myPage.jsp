<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
<%@ include file="/layout/common.jsp" %>
<style>
 #lectureMainContainer{
 	height:500px;
 }
.profileImg img {
    width:100%;
    border-radius:50%;
    border:1px dotted #bbb; 
}
</style>
<script>
	var modifyUser = function(){
		$.ajax({
			 url: "${ctx}/user/modify.do"
			,type: "post"
			,dataType: "json"
			,data: {
				 loginId:"${sessionScope.loginUser.loginId}"
				,password:$("#modifyPassword").val()
				,passwordConfirm:$("#modifyPasswordConfirm").val()
				,nickname:$("#modifyNickname").val()
				,email:$("#modifyEmail").val()
				,selfIntroduction:$("#modifyIntroduction").val()
				}
			,success: modifyUserData
			,error: function(data){
				console.log(data);
				console.log("error")
			}
		});
	};
	var modifyUserData = function(data){
		if (data[0] =="success"){
			
			window.location.replace(data[1]);
			
		}
		else{
			alert(data[1]);
		}
	};

	
</script>
</head>
<body>
<%@ include file="/layout/menu.jsp" %>
	<header>
        <div id="lectureMainContainer" class="container" style>
            <div class="intro-text">
                <div class="intro-heading">MYPAGE</div>
            </div>
        </div>
    </header>
    <section>
    	<div class="container">
			<div class="col-md-8 col-md-offset-2">
				<div class="profileImg col-md-6 col-md-offset-3">
       				<img id="profileImage" src="${sessionScope.loginUser.profileImg}" />
				</div>
			</div>
			<div class="col-md-6 col-md-offset-3">	
				
				 <div class="form-group">
		    		<label for="usr">PROFILE-IMAGE:</label>
		    		<form method="post" action="${ctx}/user/modifyProfileImage.do" enctype="multipart/form-data">
						<input type="file" class="btn btn-default" name="소스복사">
						<input type="submit" class="btn btn-large btn-warning" value="전송">
					</form>
		        </div>
			    <form onsubmit="modifyUser(); return false;">
					<div class="form-group">
			    		<label for="usr">USER-PASSWORD:</label>
				        <input type="text" class="form-control" id="modifyPassword" value="${sessionScope.loginUser.password}" placeholder="비밀번호" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">PASSWORD-CONFIRM:</label>
			        	<input type="text" class="form-control" id="modifyPasswordConfirm" value="${sessionScope.loginUser.password}" placeholder="비밀번호 확인" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">NICKNAME:</label>
			        	<input type="text" class="form-control" id="modifyNickname" value="${sessionScope.loginUser.nickname}" placeholder="이메일" required>
			        </div>
				    <div class="form-group">
			    		<label for="usr">EMAIL:</label>
			        	<input type="text" class="form-control" id="modifyEmail" value="${sessionScope.loginUser.email}" placeholder="이메일" required>
			        </div>
			       
			        <div class="form-group">
			    		<label for="usr">INTRODUCTION:</label>
			    		
			        	<textarea rows="6" class="form-control" id="modifyIntroduction" placeholder="인사말">${sessionScope.loginUser.selfIntroduction}</textarea>
			        </div>
			        
			        <div class="row form-btn">
			            <button class="btn btn-large btn-warning" type="submit">확인</button>
			        </div>
				</form>
				
				<div class="row form-btn">
					<a class="btn btn-large btn-warning" href="${ctx}/user/remove.do?id=${sessionScope.loginUser.id}&loginId=${sessionScope.loginUser.loginId}">
			           	회원탈퇴
		        	</a>
		        </div>
							        
			</div>
		</div>
	</section>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>