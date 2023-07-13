<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<style>
	.container {
		box-sizing: border-box;
		width: 50%;
	}
	#btn {
		text-align : center;
	}
</style>
<title>부서등록</title>
</head>
<body>
	<br>
	<h1 align="center">
		Department Insert
	</h1>
	<br>
	<div class="container">
	<form action="deptInsert" method="post" >
		<div class="mb-3">
		    <label for="exampleInputId1" class="form-label">department_id</label>
		    <input type="text" class="form-control" name="departmentId">
	    </div>
		<div class="mb-3">
		    <label for="exampleInputName1" class="form-label">department_name</label>
		    <input type="text" class="form-control" name="departmentName">
	    </div>
	    <div class="mb-3">
		    <label for="exampleInputId2" class="form-label">manager_id</label>
		    <input type="text" class="form-control" name="managerId">
	    </div>
	    <div class="mb-3">
		    <label for="exampleInputId3" class="form-label">location_id</label>
		    <input type="text" class="form-control" name="locationId">
	    </div>
	    <div id="btn">
			<button type="submit" class="btn btn-outline-dark">등록</button>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='deptList'">목록</button>
		</div>
	</form>
	</div>
</body>
</html>