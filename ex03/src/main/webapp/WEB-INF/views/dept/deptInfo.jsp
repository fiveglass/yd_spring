<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<form>
		<div>
			<label>department_id : <input type="number" name="departmentId" value="${deptInfo.departmentId }" readonly></label>
		</div>
		<div>
			<label>department_name : <input type="text" name="departmentName" value="${deptInfo.departmentName }"></label>
		</div>
		<div>
			<label>manager_id : <input type="number" name="managerId" value="${deptInfo.managerId }"></label>
		</div>
		<div>
			<label>location_id : <input type="number" name="locationId" value="${deptInfo.locationId }"></label>
		</div>
		<button type="submit">수정</button>
		<button type="button">목록</button>
	</form>
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
				}else{
					alert('해당 부서의 정보가 정상적으로 수정되지 않았습니다.');
				}
			})
			.fail( reject => console.log(reject));
		}
	</script>
</body>
</html>