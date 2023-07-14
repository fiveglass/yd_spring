<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<style type="text/css">
	#btn {
		text-align : center;
	}
</style>
</head>
<body>
<br>
<h1 align="center">
	Hello world!  
</h1>
<P align="center">  The time on the server is ${serverTime}. </P>
<br>
<img src="/img/스누피악수.jpeg" alt="악수"/>
<div id = "btn">
	<button type="button" class="btn btn-outline-success" onclick="location.href='empList'">
		사원조회
	</button>
	<button type="button" class="btn btn-outline-success" onclick="location.href='deptList'">
		부서조회
	</button>
</div>
</body>
</html>
