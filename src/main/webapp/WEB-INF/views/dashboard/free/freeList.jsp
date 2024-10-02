<%@page import="db.dto.PostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h2>게시글 목록</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>즐겨찾기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="l" items="${sessionScope.list}">
					<tr>
						<td>${l.post_pk_num}</td>
						<!-- post_pk_num -->
						<td><a href="<%=request.getContextPath()%>/dashboard?fn=FREE_READ&post_num=${l.post_pk_num}">${l.post_name}</a></td>
						<!-- post_name -->
						<td>${l.post_fk_user_num}</td>
						<!-- post_fk_user_num -->
						<td>${l.post_regdate}</td>
						<!-- post_regdate -->
						<td>${l.post_view}</td>
						<!-- post_view -->
						<td>
							<input type="checkbox" id="favorite" class="favorite" value="${l.post_pk_num }"
							<c:if test="${l.favoriteCheck == true}">
						 	 checked
						  	</c:if>>
						</td>
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="freePostWrite.jsp" class="btn btn-primary mt-3">새 게시글 작성</a>
		<a href="<%=request.getContextPath()%>/dashboard?fn=HOME" class="btn btn-primary mt-3">메인으로 돌아가기</a>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<script>
const favoriteToggle = document.querySelectorAll('#favorite');
	for(let i=0; i<favoriteToggle.length; i++){
	favoriteToggle[i].addEventListener('click',() => {
		if (favoriteToggle[i].checked){
			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_CREATE&post_pk_num=`+favoriteToggle[i].value+`&url=LIST`;
		} else {
			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_DEL&post_pk_num=`+favoriteToggle[i].value+`&url=LIST`;
		}
	})
}
</script>
</html>