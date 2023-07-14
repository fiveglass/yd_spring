<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
</head>
<body>
<br>
	<h1 align="center">
		Department Modify
	</h1>
<br>
<div class="container">
	<form>
		<div class="mb-3">
		    <label for="exampleInputId1" class="form-label">department_id</label>
		    <input type="number" class="form-control" name="departmentId" value="${deptInfo.departmentId }" readonly>
	    </div>
		<div class="mb-3">
		    <label for="exampleInputName1" class="form-label">department_name</label>
		    <input type="text" class="form-control" name="departmentName" value="${deptInfo.departmentName }">
	    </div>
	    <div class="mb-3">
		    <label for="exampleInputId2" class="form-label">manager_id</label>
		    <input type="number" class="form-control" name="managerId" value="${deptInfo.managerId }">
	    </div>
	    <div class="mb-3">
		    <label for="exampleInputId3" class="form-label">location_id</label>
		    <input type="number" class="form-control" name="locationId" value="${deptInfo.locationId }">
	    </div>
	    <div id="btn">
			<button type="submit" class="btn btn-outline-dark">수정</button>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='deptList'">목록</button>
		</div>
	</form>
</div>
	<script>
		$('form').on('submit', ajaxUpdateDept);
		
		function serializeObject() {
			let formData = $('form').serializeArray();
			
			let objectData = {};
			$.each(formData, function (idx, obj) {
				objectData[obj.name] = obj.value;
			})
			return objectData;
			
		}
		
		function ajaxUpdateDept(e) {
			e.preventDefault();
			
			let obj = serializeObject();
			
			$.ajax({
				url : 'deptUpdate',
				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify(obj)
			})
			.done( data => {
				if( data != null && data['결과'] == "Success"){
					alert('부서번호 : ' + data['부서번호'] + '의 정보가 수정되었습니다.');
					location.href="deptList";
				}else{
					alert('해당 부서의 정보가 정상적으로 수정되지 않았습니다.');
				}
			})
			.fail( reject => console.log(reject));
		}
	</script>
</body>
</html>