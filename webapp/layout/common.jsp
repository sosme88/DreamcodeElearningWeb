<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta charset="utf-8">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<style>

#lectureMainContainer{
 	height:500px;
}

.aboutImg{
	height:90%;
	margin-bottom:1%;
}

#logo{
	width:70%;
	padding:0;
	margin:0;
	margin-top:-3%;
}

#disabled{
    position:fixed;
	top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:998;
    background-color:black;
    opacity:0.5;
    display:none;
}
body{
	padding:0;
}

#loginLayer{
	
	position:fixed;
	top:20%;
	left:50%;
	z-index:999;
	width:280px;
	margin-left: -140px;
}

#findPasswordLayer{
	position:fixed;
	top:20%;
	left:50%;
	z-index:999;
	width:280px;
	margin-left: -140px;
}
#viewInformationLayer{
	position:fixed;
	top:20%;
	left:50%;
	z-index:999;
	width:280px;
	margin-left: -140px;
}
#registerLayer{
	position:fixed;
	top:20%;
	left:50%;
	z-index:999;
	width:280px;
	margin-left: -140px;
}

.form-signin {
            max-width: 400px;
            padding: 29px;
            background-color: #fff;
            -webkit-border-radius: 0px 0px 15px 15px;
            -moz-border-radius: 0px 0px 15px 15px;
            border-radius: 0px 0px 15px 15px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 15px;
        }
        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }
        .form-btn {
            text-align: center;
            padding-top: 20px;
        }

.footer{
	background-color:black;
	width:100%;
}

#icon{
	width:220px;
}
</style>

<link rel="stylesheet" media="all" type="text/css"
      href="https://www.udemy.com/staticx/udemy/css/topic.css?v=54732b1058ffc65ac8e4cc5c594145dd1f3df5e5" />

<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
<link href="${ctx}/resources/css/agency.css" rel="stylesheet">
<link href="${ctx}/resources/css/hover.css" rel="stylesheet" media="all">

    <!-- Custom Fonts -->
<link href="${ctx}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<script>
var userLogin =function(){
	$.ajax({
		 url: "${ctx}/user/login.do"
		,type: "get"
		,dataType: "json"
		,data: {
				 loginId:$("#loginIdLogin").val()
				,password:$("#passwordLogin").val()}
		,success: loginDo
		,error: function(data){console.log("error")}
	});
};

var loginDo = function(data){
	if (data[0] =="login"){
		window.location.replace(data[1]);
		
	}
	else{
		alert(data[1]);
	}
};

var userRegister =function(){
	$.ajax({
		 url: "${ctx}/user/register.do"
		,type: "post"
		,dataType: "json"
		,data: {
				 loginId:$("#loginIdRegister").val()
				,password:$("#passwordRegister").val()
				,passwordConfirm:$("#passwordConfirm").val()
				,nickname:$("#nicknameRegister").val()
				,email:$("#emailRegister").val()}
		,success: registerDo
		,error: function(data){console.log("error")}
	});
};

var registerDo = function(data){
	if (data[0] =="register"){
		window.location.replace(data[1]);
		
	}
	else{
		alert(data[1]);
	}
};

var findPassword =function(){
	$.ajax({
		 url: "${ctx}/user/findPassword.do"
		,type: "post"
		,dataType: "json"
		,data: {
				 loginId:$("#loginIdFindPassword").val()
				,email:$("#passwordFindPassword").val()}
		,success: findPasswordDo
		,error: function(data){console.log("error")}
	});
};

var findPasswordDo = function(data){
	if (data[0] =="find"){
		
		alert(data[2]);
	}
	else{
		alert(data[1]);
	}
};

</script>
	