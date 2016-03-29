<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정</title>
<%@ include file="/layout/common.jsp" %>
<script>

	var createDetail =function(){
		$.ajax({
			 url: "${ctx}/detail/register.do"
			,type: "post"
			,dataType: "json"
			,data: {lectureId:"${selectedLecture.id}"
			 		,content:$("#content").val()
			 		,detailOrder:$("#detailOrder").val()}
			,success: showLectureDetail
			,error: function(data){console.log("error")}
		});
	};
	
	var showLectureDetail = function(data){

		var lectureDetailHtml="";
		lectureDetailHtml += "<tr id=\""+data.id+"\">";
		lectureDetailHtml += "<td> <input type=\"text\" id=\"content" +data.id+ "\" value=\""+ data.content+"\"></td>";
		lectureDetailHtml += "<td> <input type=\"text\" id=\"detailOrder" +data.id+ "\" value=\""+ data.detailOrder+"\"></td>";
		lectureDetailHtml += "<td>"+ "<button id=\"delete"+data.id+ 
			"\" class=\"btn btn-large btn-warning\" onclick=\"modifyDetail("+data.id+");\">수정</button>" + "</td>";
			lectureDetailHtml += "<td>"+ "<button id=\"delete"+data.id+ 
			"\" class=\"btn btn-large btn-warning\" onclick=\"removeDetail("+data.id+");\">삭제</button>" + "</td>";
		lectureDetailHtml += "</tr>";
		
		$("#detailListTbl tbody").append(lectureDetailHtml);
	};
	
	var modifyDetail =function(modifyDetailId){
		$.ajax({
			 url: "${ctx}/detail/modify.do"
			,type: "post"
			,dataType: "json"
			,data: {
					 id:modifyDetailId
					,lectureId:"${selectedLecture.id}"
					,content:$("#content"+modifyDetailId).val()
			 		,detailOrder:$("#detailOrder"+modifyDetailId).val()}
			,success: modifyLectureDetail
			,error: function(data){console.log("error")}
		});
	};
	var modifyLectureDetail = function(data){
		alert("수정 완료!");
	};
	
	var removeDetail =function(removeDetailId){
		$.ajax({
			 url: "${ctx}/detail/remove.do"
			,type: "post"
			,dataType: "json"
			,data: {id:removeDetailId}
			,success: removeLectureDetail
			,error: function(data){console.log("error")}
		});
	};
	var removeLectureDetail = function(data){
		$("#"+data).remove();
		alert("삭제 완료!");
	};
	
	var modifyLecture = function(){
		$.ajax({
			 url: "${ctx}/lecture/modify.do"
			,type: "post"
			,dataType: "json"
			,data: {
					 id:"${selectedLecture.id}"
					,lectureName:$("#lectureName").val()
					,description:$("#description").val()
					,category:$("#category").val()
					,lectureVideoUrl:$("#lectureVideoUrl").val()
					,instructor:$("#instructor").val()
					,iconImg:$("#iconImg").val()
					,qrcodeImg:$("#qrcodeImg").val()
					,previewImg:$("#previewImg").val()
					,publishFile:$("#publishFile").val()
					,resourceFile:$("#resourceFile").val()}
			,success: modifySelectedLecture
			,error: errorCallback
		});
	};
	
	var modifySelectedLecture = function(data){
		alert("수정 완료!");
	};
	
	var errorCallback = function() {
		console.log("errorcallback");
	};
</script>

<style>
	
</style>
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
			<div class="col-md-10 col-md-offset-1">	
		    	<div class="form-group">
		    		<label for="usr">LECTURE-NAME:</label>
			        <input type="text" id="lectureName" class="form-control" name="lectureName" value="${selectedLecture.lectureName}" placeholder="제목" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">DESCRIPTION:</label>
			        <input type="text" id="description" class="form-control" name="description" value="${selectedLecture.description}"placeholder="요약" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">CATEGORY:</label>
			        <select id="category" name="category">
			        	<c:choose>
			        		<c:when test="${selectedLecture.category=='appinventor'}">
					        	<option value="appinventor" selected>APPINVENTOR</option>
					        	<option value="python">PYTHON</option>
			        		</c:when>
			        		<c:otherwise>
			        			<option value="appinventor">APPINVENTOR</option>
					        	<option value="python" selected>PYTHON</option>
			        		</c:otherwise>
			        	</c:choose>
			        </select>
			    </div>
			    <div class="form-group">
		    		<label for="usr">VIDEO-URL:</label>
			        <input type="text" id="lectureVideoUrl" class="form-control" name="lectureVideoUrl" value="${selectedLecture.lectureVideoUrl}" placeholder="비디오유알엘" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">INSTRUCTOR:</label>
			        <input type="text" id="instructor" class="form-control" name="instructor" value="${selectedLecture.instructor}" placeholder="인스트럭터" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">ICON-URL:</label>
			        <input type="text" id="iconImg" class="form-control" name="iconImg" value="${selectedLecture.iconImg}" placeholder="아이콘유알엘" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">QRCODE-URL:</label>
			        <input type="text" id="qrcodeImg" class="form-control" name="qrcodeImg" value="${selectedLecture.qrcodeImg}" placeholder="큐알코드" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">PREVIEW-URL:</label>
			        <input type="text" id="previewImg" class="form-control" name="previewImg" value="${selectedLecture.previewImg}" placeholder="프리뷰" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">PUBLISH-FILE:</label>
			        <input type="text" id="publishFile" class="form-control" name="publishFile" value="${selectedLecture.publishFile}" placeholder="퍼블리쉬" required>
			    </div>
			    <div class="form-group">
		    		<label for="usr">RESOURCE-FILE:</label>
			        <input type="text" id="resourceFile" class="form-control" name="resourceFile" value="${selectedLecture.resourceFile}" placeholder="리소스" required>
			    </div>
			    <button id="modifyLecture" class="btn btn-large btn-warning" onclick="modifyLecture();">수정</button>
			</div>
	</div>

	<div class="container">
		<div class="col-md-10 col-md-offset-1">
		    <button id="createBtn" class="btn btn-large btn-warning col-md-1 col-md-offset-11" onclick="createDetail();">생성</button>
		    
			<input type="text" id = "content" class="form-control" name="content" placeholder="리소스" required>
		    <input type="number" id = "detailOrder" class="form-control" name="detailOrder" placeholder="오더" required>
		    
		    <div>
			    <table id="detailListTbl" class="table">
					<thead>
						<tr>
							<th>content</th>
							<th>order</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lectureDetails}" var="detail">
							<tr id="${detail.id}">
								<td> <input type="text" id="content${detail.id}" value="${detail.content}"></td>
								<td> <input type="text" id="detailOrder${detail.id}" value="${detail.detailOrder}"></td>
								<td> <button id="modify${detail.id}" 
										class="btn btn-large btn-warning" onclick="modifyDetail('${detail.id}');">수정</button></td>
								<td> <button id="delete${detail.id}" 
										class="btn btn-large btn-warning" onclick="removeDetail('${detail.id}');">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		    <form action="${ctx}/manage/main.do">
			    <div class="row form-btn">
			        <button class="btn btn-large btn-warning" type="submit">수정완료</button>
			    </div>
		    </form>
	    </div>
	</div>
	</section>
	<%@ include file="/layout/footer.jsp" %>
</body>
</html>