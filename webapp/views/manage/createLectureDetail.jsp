<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 디테일 생성</title>
<%@ include file="/layout/common.jsp" %>
<script>

	var createDetail =function(){
		$.ajax({
			 url: "${ctx}/detail/register.do"
			,type: "post"
			,dataType: "json"
			,data: {lectureId:"${unfinishedLecture.id}"
			 			,content:$("#content").val()
			 			,detailOrder:$("#detailOrder").val()}
			,success: showLectureDetail
			,error: function(data){console.log("error")}
		});
	};
	
	var showLectureDetail = function(data){

		var lectureDetailHtml="";
		lectureDetailHtml += "<tr id=\""+data.id+"\">";
		lectureDetailHtml += "<td id=\"lectureIdBy"+data.id+"\">"+ data.lectureId+"</td>";
		lectureDetailHtml += "<td> <input type=\"text\" id=\"content" +data.id+ "\" value=\""+ data.content+"\"></td>";
		lectureDetailHtml += "<td> <input type=\"text\" id=\"detailOrder" +data.id+ "\" value=\""+ data.detailOrder+"\"></td>";
		lectureDetailHtml += "<td>"+ "<button id=\"modify"+data.id+ 
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
					,lectureId:$("#lectureIdBy"+modifyDetailId).val()
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

</script>

</head>
<body>
<%@ include file="/layout/menu.jsp" %>
	<header>
        <div id="lectureMainContainer" class="container" style>
            <div class="intro-text">
                <div class="intro-heading">강의디테일 생성</div>
            </div>
        </div>
    </header>
	<section>
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
			    <button id="createBtn" class="btn btn-large btn-warning col-md-1 col-md-offset-11" onclick="createDetail();">생성</button>
				<div class="form-group">
			    	<label for="usr">DETAIL-RESOURCE:</label>	
					<input type="text" id = "content" class="form-control" name="content" placeholder="리소스" required>
			    </div>
			    <div class="form-group">
			    	<label for="usr">DETAIL-ORDER:</label>
			    	<input type="number" id = "detailOrder" class="form-control" name="detailOrder" placeholder="오더" required>
			    </div>
			    
			    <table id="detailListTbl" class="table">
					<thead>
						<tr>
							<th>렉쳐아이디</th>
							<th>content</th>
							<th>order</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			    <form action="${ctx}/manage/main.do">
				    <div class="row form-btn">
				        <button class="btn btn-large btn-warning" type="submit">생성완료</button>
				    </div>
			    </form>
			</div>
		</div>
	</section>
	<%@ include file="/layout/footer.jsp" %>
</body>
</html>