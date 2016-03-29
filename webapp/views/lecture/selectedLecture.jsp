<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택강의</title>
<%@ include file="/layout/common.jsp" %>

<script>

	var viewInformation = function(userId){
		$.ajax({
			 url: "${ctx}/user/select.do"
			,type: "post"
			,dataType:"json"
			,data:{loginId:userId}
			,success: viewUserInformation
			,error: function(data){console.log("error")}
		});	
		
	};
	
	var viewUserInformation = function(data){
		
		$("#selectedUserId").val(data.loginId);
		$("#selectedNickname").val(data.nickname);
		$("#selectedEmail").val(data.email);
		$("textarea#selectedIntroduction").val(data.selfIntroduction);
		
		$("#findPasswordLayer").fadeOut(100);
		$("#registerLayer").fadeOut(100);
		$("#findPasswordLayer").fadeOut(100);
		$("#viewInformationLayer").fadeIn(200);
		$("#disabled").fadeIn(200);
	};
	
	var modifyComment = function(commentId){
		$.ajax({
			 url: "${ctx}/comment/modify.do"
			,type: "post"
			,dataType:"json"
			,data:{
				 id:commentId
				,lectureId:"${selectedLecture.id}"
				,content:$("#loginUserComment"+commentId).val()
				,userId:"${sessionScope.loginUser.loginId}"
				,userNickname:"${sessionScope.loginUser.nickname}"}
			,success: modifyUserComment
			,error: function(data){console.log("error")}
		});	
		
	};
	
	var modifyUserComment = function(data){
		alert("수정되었습니다.");
	};
	
	var removeComment = function(commentId){
		$.ajax({
			 url: "${ctx}/comment/remove.do"
			,type: "post"
			,dataType:"json"
			,data:{id:commentId}
			,success: removeUserComment
			,error: function(data){console.log("error")}
		});	
		
	};
	
	var removeUserComment = function(data){
		$("#comment"+data).remove();
		alert("삭제 완료!");
	};
	
	
</script>

<style>
.download-btn{
	background-color:#fed136;
	color:white;
	margin-top:10%;
}

.commentBox {
    padding:10px;
    border-top:1px dotted #bbb;
}
.commentBox .form-group:first-child, .actionBox .form-group:first-child {
    width:80%;
}
.commentBox .form-group:nth-child(2), .actionBox .form-group:nth-child(2) {
    width:18%;
}
.actionBox .form-group * {
    width:100%;
}
.taskDescription {
    margin-top:10px 0;
}
.commentList {
    padding:0;
    list-style:none;
    max-height:1000px;

}
.commentList li {
    margin:0;
    margin-top:10px;
}
.commentList li > div {
    display:table-cell;
}
.commenterImage {
    width:30px;
    margin-right:5px;
    height:100%;
    float:left;
}
.commenterImage img {
    width:100%;
    border-radius:50%;
}
.commentText p {
    margin:0;
    white-space:normal;
}
p input{
	width:100%;
	white-space:normal;
}
.sub-text {
    color:#aaa;
    font-family:verdana;
    font-size:11px;
}
.actionBox {
    border-top:1px dotted #bbb;
    padding:10px;
}



 
#myCarousel{
	margin-bottom:3%;
}
.video-container{
	position:relative;
	padding-bottom:56.25%;
	height:0;
	overflow:hidden;
	max-width:100%;
	height:auto;
	margin-bottom:3%;
} 
.video-container iframe,
.video-container object,
.video-container embed{
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
}
.item{
	width:auto;
	height:auto;	
}

#description{
	
	border-right:1px dotted #bbb;
}

#lectureName{
	text-align:center;
}

#instructor{
	text-align:right;
}

#descriptionDetail{
	margin-left:3%;
}

.commenterImage-btn{
	background:none;
	border:none;
}

</style>

</head>
<body>
<%@ include file="/layout/menu.jsp" %>
<script>
$(document).ready(function(){
	$("#myCarousel").carousel({interval: 0});
	
	    // Enable Carousel Controls
	$(".left").click(function(){
	    $("#myCarousel").carousel("prev");
	});
	$(".right").click(function(){
	    $("#myCarousel").carousel("next");
	});
	
	$("#createComment").click(function(){
		$.ajax({
			 url: "${ctx}/comment/create.do"
			,type: "post"
			,dataType:"json"
			,data:{
				 lectureId:"${selectedLecture.id}"
				,content:$("#inputComment").val()
				,userId:"${sessionScope.loginUser.loginId}"
				,userNickname:"${sessionScope.loginUser.nickname}"}
			,success: showComment
			,error: function(data){console.log("error")}
		});
	});
	
	var showComment=function(data){
		var commentHtml ="";
		commentHtml +="<li id=\"comment"+data.id+"\">";
		commentHtml +="<div class=\"commentText col-md-12\">";
		commentHtml +="<div class=\"commenterImage\">";
		commentHtml +="<button class=\"commenterImage-btn\" onclick=\"viewInformation('"+data.userId+"');\">";
		commentHtml +="<img src=\""+data.profileImg+"\" /></button></div>";
		commentHtml +="<p><input type=\"text\" id=\"loginUserComment"
				+data.id+"\" value=\""+data.content+"\"></p>";
		commentHtml +="<span class=\"date sub-text\">"+data.userNickname+"</span>";
		commentHtml +="<span class=\"date sub-text\">  "+data.createdDate+"</span>";
		commentHtml +="<button class=\"btn btn-default date sub-text\" onclick=\"modifyComment("+data.id+");\">수정</button>";
		commentHtml +="<button class=\"btn btn-default date sub-text\" onclick=\"removeComment("+data.id+");\">삭제</button>";
		commentHtml +="</div></li>";
		$("#commentList").append(commentHtml);
	};
});
</script>

	<header>
        <div id="lectureMainContainer" class="container">
            <div class="intro-text">
                <div class="intro-heading">${selectedLecture.category}</div>
            </div>
        </div>
    </header>
	<section>
		<div class="container">
			<div class="col-md-12 video-container">
				<iframe src="https://www.youtube.com/embed/${selectedLecture.lectureVideoUrl}" frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="col-md-12">
				<div class="row carousel-holder">			
        			<div>           
        				<div id="myCarousel" class="carousel slide">
        <!-- 밑에 인디케이터 -->
        					<div class="carousel-inner" role="listbox">
        						<c:forEach items="${lectureDetails}" var="detail">
        							<c:choose>
        								<c:when test="${detail.detailOrder == '1'}">
        									<div class="item active">
        										<img class = "col-md-10 col-md-offset-1" src="${ctx}/resources/img/${detail.content}" alt="">
        									</div>
        								</c:when>
        								<c:otherwise>
        									<div class="item">
        										<img class = "col-md-10 col-md-offset-1" src="${ctx}/resources/img/${detail.content}" alt="">
        									</div>
        								</c:otherwise>
        							</c:choose>
        						</c:forEach>
        					</div>
                            <!-- 왼쪽오른쪽 화살표 -->
        					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
        						<span class="glyphicon glyphicon-chevron-left"></span>
        					</a>
        					<a class="right carousel-control" href="#myCarousel" data-slide="next">
        						<span class="glyphicon glyphicon-chevron-right"></span>
        					</a>
        				</div>
        			</div>
				</div>
			</div>
			<div id="description" class="col-md-6">
				<h2>OVERVIEW</h2>
				<div class="col-md-4">
					<img class = "contents col-md-12" src="${selectedLecture.previewImg}" alt="">
					<img class = "contents col-md-12" src="${selectedLecture.qrcodeImg}" alt="">
				</div>
				<div class="col-md-8">
					<h4 id="lectureName">${selectedLecture.lectureName}</h4>
					<h5 id="instructor">${selectedLecture.instructor}</h5>
					<h5 id="descriptionDetail">${selectedLecture.description}</h5>
					<div class="col-md-12">
						<div class="col-md-6">
							<a class="btn btn-large download-btn col-md-12" href="${selectedLecture.publishFile}">PUBLISH-FILE<br>DOWNLOAD</a>
						</div>
						<div class="col-md-6">
							<a class="btn btn-large download-btn col-md-12" href="${selectedLecture.resourceFile}">SOURCE-FILE<br>DOWNLOAD</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<h2>COMMENTS</h2>
			    <div class="actionBox">
			    	<c:choose>
				    	<c:when test="${not empty sessionScope.loginUser.loginId}">
					        <div class="form-inline">
					            <div class="form-group">
					                <input id="inputComment" type="text" placeholder="댓글을 입력하세요." />
					        	</div>
					            <div class="form-group">
					                <button class="btn btn-default" id="createComment">Add</button>
					            </div>
					        </div>
					    </c:when>
				    </c:choose>
			        <ul id="commentList" class="commentList">
			        	<c:if test = "${not empty comments}">
				        	<c:forEach items="${comments}" var="comment">
				        		<li id="comment${comment.id}">
				        			
					                <div class="commentText col-md-12">
					                	
				                		<div class="commenterImage">
						        			<button class="commenterImage-btn" onclick="viewInformation('${comment.userId}');">
						        				<img src="${comment.profileImg}" />
						        			</button>	
				               			</div>
					               		
					                	<c:choose>
					                		<c:when test="${comment.userId == sessionScope.loginUser.loginId}">
					                			<p><input type="text" id="loginUserComment${comment.id}" value="${comment.content}"></p>
					                		</c:when>
					                		<c:otherwise>
					                			<p>${comment.content}</p>
					                		</c:otherwise>
					                	</c:choose>
					                	<span class="date sub-text">${comment.userNickname}</span>
					                	<span class="date sub-text">${comment.createdDate}</span>
					                	<c:if test="${comment.userId == sessionScope.loginUser.loginId}">
						                	<button class="btn btn-default date sub-text" onclick="modifyComment(${comment.id});">수정</button>
						                	<button class="btn btn-default date sub-text" onclick="removeComment(${comment.id});">삭제</button>
						                </c:if>
						            </div>
				            	</li>
				            </c:forEach>
			            </c:if>
			        </ul>
			    </div>
			</div>
        </div>
		
	</section>
<%@ include file="/layout/footer.jsp" %>


</body>
</html>