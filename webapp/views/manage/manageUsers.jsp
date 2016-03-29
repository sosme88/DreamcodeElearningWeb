<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 관리</title>
<%@ include file="/layout/common.jsp" %>
<script>
	var removeUser = function(userId){
		$.ajax({
			 url: "${ctx}/manage/removeUser.do"
			,type: "post"
			,dataType: "json"
			,data: {id:userId
				   ,userId:$("#loginId"+userId).val()}
			,success: removeSelectedUser
			,error: function(data){console.log("error")}
		});
	};
	var removeSelectedUser = function(data){
		$("#"+data).remove();
		alert("삭제 완료!");
	};

	var modifyUser =function(userId){
		$.ajax({
			 url: "${ctx}/manage/modifyUser.do"
			,type: "post"
			,dataType: "json"
			,data: {
				 id:userId
				,loginId:$("#loginId"+userId).val()
				,password:$("#password"+userId).val()
				,nickname:$("#nickname"+userId).val()
				,email:$("#email"+userId).val()
				,userType:$("#userType"+userId).val()
				}
			,success: modifySelectedUser
			,error: function(data){
				console.log(data);
				console.log("error")
			}
		});
	};
	var modifySelectedUser = function(data){
		alert("수정 완료!");
	};
</script>

</head>
<body>
<%@ include file="/layout/menu.jsp" %>
	<header>
        <div id="lectureMainContainer" class="container" style>
            <div class="intro-text">
                <div class="intro-heading">유저관리</div>
            </div>
        </div>
    </header>
    <section>
    	<div class="container">
			<div class="col-md-12">
		    	<table id="detailListTbl" class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>loginId</th>
							<th>password</th>
							<th>nickname</th>
							<th>email</th>
							<th>userType</th>
							<th>수정</th>
							<th>탈퇴</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user" varStatus ="sts">
							<tr id="${user.id}">
								<td>${sts.count}</td>
								<td><input type="hidden" id="loginId${user.id}" value="${user.loginId}">${user.loginId}</td>
								<td><input type="hidden" id="password${user.id}" value="${user.password}">${user.password}</td>
								<td><input type="hidden" id="nickname${user.id}" value="${user.nickname}">${user.nickname}</td>
								<td><input type="hidden" id="email${user.id}" value="${user.email}">${user.email}</td>
								<c:choose>
									<c:when test="${user.userType == 'admin'}">
										<td>
											<select id="userType${user.id}" name="userType${user.id}">
												<option value="user">USER</option>
												<option value="admin" selected>ADMIN</option>
											</select>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<select id="userType${user.id}" name="userType${user.id}">
												<option value="user" selected>USER</option>
												<option value="admin">ADMIN</option>
											</select>
										</td>
									</c:otherwise>
								</c:choose>
								<td>
									<button id="modifyUser${user.id}" class="btn btn-large btn-warning" onclick="modifyUser(${user.id});">수정</button>
								</td>
								<td>
									<button id="removeUser${user.id}" class="btn btn-large btn-warning" onclick="removeUser(${user.id});">탈퇴</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<%@ include file="/layout/footer.jsp" %>
</body>
</html>