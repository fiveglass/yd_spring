<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<form>
		<div>
			<label>id : <input type="number" name="employeeId" value="${empInfo.employeeId }" readonly></label>
		</div>
		<div>
			<label>first_name : <input type="text" name="firstName" value="${empInfo.firstName }"></label>
		</div>
		<div>
			<label>last_name : <input type="text" name="lastName" value="${empInfo.lastName }"></label>
		</div>
		<div>
			<label>email : <input type="text" name="email" value="${empInfo.email }"></label>
		</div>
		<div>
			<label>job_id : <input type="text" name="jobId" value="${empInfo.jobId }"></label>
		</div>
		<div>
			<label>salary : <input type="number" name="salary" value="${empInfo.salary }"></label>
		</div>
		<button type="submit">수정</button>
		<button type="button">취소</button>
	</form>
	<script>
		//1)form 태그 내 submit에 이벤트 stop
		$('form').on('submit', ajaxUpdateEmp);
		
		//2)form태그 내 정보 가져오기
		function serializeObject() {
			//serializeArray : form 요소들(input, textarea, select)을 이름을 key로, 값을 value로 하는 배열로 인코딩
			let formData = $('form').serializeArray();
			
			//그래서, each반복문을 통해서 객체 하나에 input태그 하나 형태로 변환 작업 필요
			let objectData = {};
			$.each(formData, function(idx, obj) {
				objectData[obj.name] = obj.value;
			})
			return objectData;
		}
		
		//3)ajax를 통해 통신 요청
		//preventDefault : 창 새로고침 막아줌
		//reject :  비동기 작업의 처리과정에서 성공/실패를 구분하는 방법
		function ajaxUpdateEmp(e) {
			e.preventDefault();
			
			let obj = serializeObject();
			
			$.ajax({
				url : 'empUpdate',
				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify(obj)
			})
			.done( data => {
				if( data != null && data['결과'] == "Success"){
					alert('사원번호 : ' + data['사원번호'] + '의 정보가 수정되었습니다.');
				}else{
					alert('해당 사원의 정보가 정상적으로 수정되지 않았습니다.');
				}
			})
			.fail( reject => console.log(reject));
		}
		
	</script>
</body>
</html>