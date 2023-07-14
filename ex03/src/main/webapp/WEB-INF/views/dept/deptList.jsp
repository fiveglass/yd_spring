<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
	table td, th {
		text-align : center;
	}
</style>
</head>
<body>
	<br>
	<h1 align="center">
		Department List 
	</h1>
	<br>
<div class="container">
	<table class="table table-hover">
		<thead class="table-light">
			<tr>
				<th scope="col">department_id</th>
				<th scope="col">department_name</th>
				<th scope="col">manager_id</th>
				<th scope="col">location_id</th>
				<th scope="col">Del</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${deptList }" var="dept">
				<tr onclick="location.href='deptInfo?departmentId=${dept.departmentId}'">
					<td>${dept.departmentId }</td>
					<td>${dept.departmentName }</td>
					<td>${dept.managerId }</td>
					<td>${dept.locationId }</td>
					<td><button type="button" class="btn btn-outline-secondary">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<br>
	<div class="d-grid gap-2 col-6 mx-auto">
	  <button class="btn btn-outline-dark" type="button" onclick="location.href='deptInsert'">
	  	등록
	  </button>
	</div>
	<br>
	<script>
		printMessage(`${result}`);
		
		function printMessage(msg) {
			if(msg == null || msg =='') return;
			alert(msg);
		}
		
		$('button:contains("삭제")').on('click', ajaxDeleteDept);
		
		//교수님 방식
		//$('tbody > tr button[type="button"]).on('click', ajaxDeptDelete);
		
//		function ajaxDeptDelete(e){
//			let deptId = $(e.currentTarget).parent().siblings().eq(0).text();
//			$.ajax({
//				url : 'empDelete',
//				type : 'post',
//				data : { id : empId }
//			})
//			.done( data => {
//				if(data == 'Success'){
//					$(e.currentTarget).parent().parent().remove();
//				}else{
//					alter=('해당 정보는 삭제되지 않습니다.');	
//				}
//			})
//			.fail( reject => console.log(reject));
//			e.stopPropagetion();
//		}
		
		function ajaxDeleteDept(e) {
			let deptId = e.currentTarget.closest('tr').firstElementChild.textContent;
		
			$.ajax({
				url : 'deptDelete',
				type : 'post',
				data : {id : deptId}
			})
			.done( data => {
				if(data == 'Success'){
					let btn = e.currentTarget;
					$(btn).closest('tr').remove();
				}
			})
			.fail( reject => console.log(reject));
			
			return false;
		}
	</script>
</body>
</html>