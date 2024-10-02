<%@page import="db.dto.ProjectDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h2>프로젝트 목록</h2>
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>프로젝트 번호</th>
					<th>프로젝트명</th>
					<th>작성자</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>우선순위</th>
					<th>상태</th>
					<th>즐겨찾기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${sessionScope.list}">
					<tr>
						<td>${p.proj_pk_num}</td>
						<!-- proj_pk_num -->
						<td><a href="<%=request.getContextPath()%>/dashboard?fn=PROJ_READ&proj_pk_num=${p.proj_pk_num}">${p.proj_name}</a></td>
						<!-- proj_name -->
						<td>${p.proj_fk_user_num}</td>
						<!-- proj_fk_user_num -->
						<td>${p.proj_startdate}</td>
						<!-- proj_startdate -->
						<td>${p.proj_enddate}</td>
						<!-- proj_enddate -->
						<td>${p.proj_import}</td>
						<!-- proj_import -->
						<td>${p.proj_status}</td>
						<!-- proj_status -->
						<td>
							<input type="checkbox" id="favorite" class="favorite" value="${p.proj_pk_num }"
							<c:if test="${p.favoriteCheck == true}">
						 	 checked
						  	</c:if>>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="${pageContext.request.contextPath}/dashboard?fn=PROJ_POST" class="btn btn-primary mt-3">새 프로젝트 작성</a>
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
			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_CREATE&proj_pk_num=`+favoriteToggle[i].value+`&url=LIST`;
		} else {
			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_DEL&proj_pk_num=`+favoriteToggle[i].value+`&url=LIST`;
		}
	})
}
</script>
</html>
