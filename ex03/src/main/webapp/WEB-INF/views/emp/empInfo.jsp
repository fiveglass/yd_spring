<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원조회</title>
</head>
<body>
	<form>
		<div>
			<label>id : <input type="number" name="" value="${empInfo.employeeId }"></label>
		</div>
		<div>
			<label>first_name : <input type="text" name="" value="${empInfo.firstName }"></label>
		</div>
		<div>
			<label>last_name : <input type="text" name="" value="${empInfo.lastName }"></label>
		</div>
		<div>
			<label>email : <input type="text" name="" value="${empInfo.email }"></label>
		</div>
		<div>
			<label>job_id : <input type="text" name="" value="${empInfo.jobId }"></label>
		</div>
		<div>
			<label>salary : <input type="number" name="" value="${empInfo.salary }"></label>
		</div>
		<button type="submit">수정</button>
		<button type="button">취소</button>
	</form>
</body>
</html>