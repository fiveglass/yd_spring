<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<form name="updateForm">
		<table>
			<tr>
				<td>No</td>
				<td><input type="text" name="bno" value="${boardInfo.bno}" readonly></td>
			</tr>
			<tr>
				<td>title</td>
				<td><input type="text" name="title" value="${boardInfo.title}"></td>
			</tr>
			<tr>
				<td>writer</td>
				<td><input type="text" name="writer" value="${boardInfo.writer}"></td>
			</tr>
			<tr>
				<td>contents</td>
				<td style="width:200px;"><input type="text" name="contents" value="${boardInfo.contents}"></td>
			</tr>
			<tr>
				<td>image</td>
				<td style="width:200px;"><input type="text" name="image" value="${boardInfo.image}"></td>
			</tr>
			<tr>
				<td>update</td>
				<td><input type="date" name="updateDate"
				value='<fmt:formatDate value="${boardInfo.updateDate }" pattern="yyyy-MM-dd"/>'></td>
			</tr>
		</table>
		<button type="submit">수정</button>
		<button type="button" onclick="location.href='boardInfo?bno=${boardInfo.bno}'">취소</button>
	</form>
	<script>
		
		
		$('form').on('submit', function(e) {
			
			let objData= serializeObject();
			
			$.ajax({
				url : 'boardUpdate',
				type : 'post',
				data : objData
			})
			.done( data => {
				if(data.result){
					let message="수정되었습니다. \n게시글 번호 : " + data.boardInfo.bno;
					alert(message);
				}else{
					alert("수정 실패 하였습니다.")
				}
			})
			.fail( reject => console.log(reject));
			
			return false;
		}) 
		
		function serializeObject() {
			let formData = $('form').serializeArray();
			
			let formObject={};
			
			$.each(formData, function(idx, obj) {
				let field = obj.name;
				let val = obj.value;
				
				formObject[field] = val;
				console.log(formObject[field] = val);
			})
			return formObject;
			
			
			
		}
		
	</script>
</body>
</html>