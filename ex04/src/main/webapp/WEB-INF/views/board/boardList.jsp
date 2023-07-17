<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
	th, td {
		text-align : center;
		border : 1px solid black;
		border-collapse: collapse;
	}
	table {
		margin-left:auto; 
		margin-right:auto;		
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>no</th>
				<th>title</th>
				<th>writer</th>
				<th>regdate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardList }" var="board">
				<tr onclick="location.href='boardInfo?bno=${board.bno}'">
					<td>${board.bno } </td>
					<td>${board.title }</td>
					<td>${board.writer }</td>
					<td>
						<fmt:formatDate value="${board.regDate }" pattern="yyyy년MM월dd일"/>
					</td>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" onclick="location.href='boardInsert'">등록</button>
</body>
</html>