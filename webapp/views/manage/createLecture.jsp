<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의생성</title>
<%@ include file="/layout/common.jsp" %>

</head>
<body>
<%@ include file="/layout/menu.jsp" %>
	<header>
        <div id="lectureMainContainer" class="container" style>
            <div class="intro-text">
                <div class="intro-heading">강의생성</div>
            </div>
        </div>
    </header>
	<section>
		<div class="container">
			<div class="col-md-10 col-md-offset-1">	
				<form action="${ctx}/lecture/register.do" method = "POST">
					<div class="form-group">
			    		<label for="usr">LECTURE-NAME:</label>
				        <input type="text" class="form-control" name="lectureName" placeholder="제목" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">DESCRIPTION:</label>
			        	<input type="text" class="form-control" name="description" placeholder="요약" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">CATEGORY:</label>
				        <select name="category">
				        	<option value="appinventor">APPINVENTOR</option>
				        	<option value="python">PYTHON</option>
				        </select>
				    </div>
				    <div class="form-group">
			    		<label for="usr">VIDEO-URL:</label>
			        	<input type="text" class="form-control" name="lectureVideoUrl" placeholder="비디오유알엘" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">INSTRUCTOR:</label>
			        	<input type="text" class="form-control" name="instructor" placeholder="인스트럭터" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">ICON-URL:</label>
			        	<input type="text" class="form-control" name="iconImg" placeholder="아이콘유알엘" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">QRCODE-URL:</label>
			        	<input type="text" class="form-control" name="qrcodeImg" placeholder="큐알코드" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">PREVIEW-URL:</label>
			        	<input type="text" class="form-control" name="previewImg" placeholder="프리뷰" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">PUBLISH-FILE:</label>
			        	<input type="text" class="form-control" name="publishFile" placeholder="퍼블리쉬" required>
			        </div>
			        <div class="form-group">
			    		<label for="usr">RESOURCE-URL:</label>
			        	<input type="text" class="form-control" name="resourceFile" placeholder="리소스" required>
			        </div>
			        <div class="row form-btn">
			            <button class="btn btn-large btn-warning" type="submit">확인</button>
			        </div>
				</form>
			</div>
		</div>
	</section>
	
<%@ include file="/layout/footer.jsp" %>
</body>
</html>