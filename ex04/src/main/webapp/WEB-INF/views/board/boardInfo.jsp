<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
	<form>	
		<table>
			<th colspan=2>게시글 조회</th>
			<tr>
				<td>No</td>
				<td>${boardInfo.bno}</td>
			</tr>
			<tr>
				<td>title</td>
				<td>${boardInfo.title}</td>
			</tr>
			<tr>
				<td>writer</td>
				<td>${boardInfo.writer}</td>
			</tr>
			<tr>
				<td>regdate</td>
				<td><fmt:formatDate value="${boardInfo.regDate }" pattern="yyyy년MM월dd일"/></td>
			</tr>
			<tr>
				<td>contents</td>
				<td style="width:200px;">${boardInfo.contents}</td>
			</tr>
			<tr>
				<td>image</td>
				<c:choose>
					<c:when test="${not empty boardInfo.image }">
						<td><img src='<c:url value="/resources/${boardInfo.image}"/>' style="width:200px;"></td>
					</c:when>
					<c:otherwise>
						<td>파일없음</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<button type="button" onclick="location.href='boardUpdate?bno=${boardInfo.bno }'">수정</button>
		<button type="button" onclick="location.href='boardDelete?bno=${boardInfo.bno }'">삭제</button>
	</form>
	<script>
		
	</script>
</body>
</html>