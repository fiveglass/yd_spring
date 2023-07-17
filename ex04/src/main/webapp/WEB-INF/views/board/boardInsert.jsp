<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
	<form action="boardInsert" method="post">
		<div>
			<label> title <input type="text" name="title"></label>
		</div>
		<div>
			<label> regdate <input type="date" name="regdate"></label>
		</div>
		<div>
			<label> writer <input type="text" name="writer"></label>
		</div>
		<div>
			<label> contents <textarea name="contents"></textarea></label>
		</div>
		<div>
			<label> image <input type="text" name="image"></label>
		</div>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
	<script>
		document.querySelector('form[name="insertForm"]')
				.addEventListener('submit', function (e) {
					e.preventDefault();
					
					let title = document.getElementByName('title')[0];
					let writer = document.getElementByname('writer')[0];
					
					if(title.value == ''){
						alert('제목이 입력되지 않았습니다.');
						title.focus();
						return;
					}
					
					if(writer.value == ''){
						alert('작성자가 입력되지 않았습니다.');
						writer.focus();
						return;
					}
					
					insertForm.submit();
				})
				
	
	</script>
</body>
</html>