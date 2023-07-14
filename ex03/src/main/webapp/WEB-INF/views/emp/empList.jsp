<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 숫자, 날짜, 시간을 formatting할 수 있게 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
	table, th, td {
		text-align : center;
	}
	table {
		margin-left:auto; 
		margin-right:auto;		
	}
</style>
</head>
<body>
<div class="d-grid gap-2 col-6 mx-auto">
	<button class="btn btn-outline-dark" type="button" onclick="location.href='empInsert'">등록</button>
</div><br>
<div class="container">
	<table class="table table-hover">
		<thead class="table-light">
			<tr>
				<th scope="col">employee_id</th>
				<th scope="col">first_name</th>
				<th scope="col">last_name</th>
				<th scope="col">email</th>
				<th scope="col">hire_date</th>
				<th scope="col">job_id</th>	
				<th scope="col">salary</th>	
				<th scope="col">Delete</th>	
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${empList }" var="emp">
				<tr onclick="location.href='empInfo?employeeId=${emp.employeeId}'">
					<td>${emp.employeeId }</td>
					<td>${emp.firstName }</td>
					<td>${emp.lastName }</td>
					<td>${emp.email }</td>
					<td>
					<fmt:formatDate value="${emp.hireDate }" pattern="yyyy.MM.dd."/>
					</td>
					<td>${emp.jobId }</td>
					<td>
						<fmt:formatNumber value="${emp.salary }" pattern="$#,###"/>
					</td>
					<td><button type = "button" class="btn btn-outline-secondary btn-sm">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<script>
		printMessage(`${result}`);
	
		function printMessage(msg) {
			if(msg == null || msg =='') return;
			alert(msg);
		}
	
		$('button:contains("삭제")').on('click', ajaxDeleteEmp);
		
		
		//closest : 가장 가까운 부모를 선택 (주로, 첫 번째 부모 엘리멘트를 찾는 경우 사용)
		//stopPropagation : 이벤트 전파를 막을 때
		function ajaxDeleteEmp(e) {
			let empId = e.currentTarget.closest('tr').firstElementChild.textContent;
			
			$.ajax({
				url : 'empDelete',
				type : 'post',
				data : { id : empId }
			})
			.done( data => {
				if(data == 'Success'){
					let btn = e.currentTarget;
					$(btn).closest('tr').remove();
				}
			})
			.fail( reject => console.log(reject));
			
			//e.stopPropagation();
			return false;
		}
		
		
	</script>
</body>
</html>