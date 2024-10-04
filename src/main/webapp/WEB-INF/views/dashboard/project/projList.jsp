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
<script src="https://kit.fontawesome.com/b40496895d.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 페이징 기능 구현 -->
<jsp:useBean id="dao" class="model.dashboard.Proj_List"/>
<%
		request.setCharacterEncoding("utf-8");
		
		// 페이징에 필요한 변수들
		int totalRecord = 0; 	// 총 글의 갯수
		int numPerPage = 8; 	// 한 페이지당 보여질 글의 갯수
		int totalPage = 0; 		// 총 페이지 수
		int nowPage = 1; 		// 현재 페이지
		int beginPerPage = 0;	// 페이지별 시작번호
		int pagePerBlock = 5;	// 블럭당 페이지 수 여러 페이지를 하나로 묶은 단위
		int totalBlock = 0;		// 총 블럭 수
		int nowBlock = 0;		// 현재 블럭
		
		
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		
		String sessionID = (String)session.getAttribute("sessionID");
		ArrayList<ProjectDTO> list = (ArrayList)dao.getPost(sessionID);
		
		// 총 글의 수 계산 
		totalRecord = list.size();
		// 전체 페이지 수
		totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // 페이지를 소수로 나눈 후 그것을 정수형으로 변경해서 페이지 갯수 구하기
		
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage")); // 문자열 이기 때문에 정수형으로 변환
		}
		
		nowPage = (nowPage < 1) ? 1: ( nowPage > totalPage) ? totalPage : nowPage;
		
		// 현재 페이지에서 보여줄 글의 시작 인덱스 계산
		beginPerPage = (nowPage -1) * numPerPage;
		
		// 총 블록 수 계산
		totalBlock = (int)Math.ceil((double) totalPage / pagePerBlock);
		
		if(request.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(request.getParameter("nowBlock")); // 문자열 이기 때문에 정수형으로 변환
		}
		
	
		// 현재 블록의 페이지 목록을 세팅
		 ArrayList<ProjectDTO> currentPageList = new ArrayList<>(list.subList(beginPerPage, Math.min(beginPerPage + numPerPage, totalRecord)));
		 session.setAttribute("list", currentPageList);
		
	
	%>
	<div class="container mt-5">
		<h2>프로젝트 목록</h2>
		<!-- 검색 기능 구현 -->
		<form action="projList.jsp" name="search" method="post">
			<table border=0 width=527 align=right cellpadding=4 cellspacing=0>
			<tr>
				<td align=right valign=bottom>
					<select name="keyField" size="1">
						<option value="proj_name"> 프로젝트명
						<option value="user_name"> 작성자
						<option value="task_priority"> 우선순위
					</select>
		
					<input type="text" size="20" name="keyWord" placeholder="검색어를 입력하세요" required="required" >
					<button class="search-btn" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
					
				</td>
			</tr>
			</table>
		</form>
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
			<%
			
			for(int i=beginPerPage; i < beginPerPage + numPerPage; i++) { //시작 페이지 + 한 페이지당 보여질 개수
				// 마지막 페이지는 에러 (글이 5개 아니기 때문)
				if(i == totalRecord) { // 페이지 시작 번호가 총 글의 갯수와 같아지면 break;
					break;
				}
				ProjectDTO board = list.get(i);
				}
				%>	
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
						<!-- 즐겨찾기 등록여부 확인 -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이지 이동 링크 -->
    	<div>
        	<ul class="pagination justify-content-center">
            <!-- 이전 블럭으로 이동 -->
	            <% if (nowBlock > 0) { %>
	                <li class="page-item">
	                    <a class="page-link" href=
	                    "${pageContext.request.contextPath}/dashboard?fn=PROJ_LIST&nowPage=<%=(nowBlock-1) * pagePerBlock + 1%>&nowBlock=<%=nowBlock-1%>">
	                    Prev
	                    </a>
	                </li>
	            <% } %>

            <!-- 블럭 내 페이지 링크 표시 -->
	            <%
	                for (int i = 0; i < pagePerBlock; i++) {
	                    int pageNum = nowBlock * pagePerBlock + i + 1;
	                    if (pageNum > totalPage) break;
	            %>
	                <li class="page-item <%= (pageNum == nowPage) ? "active" : "" %>">
	                    <a class="page-link" href=
	                    "${pageContext.request.contextPath}/dashboard?fn=PROJ_LIST&nowPage=<%=pageNum%>&nowBlock=<%=nowBlock%>">
	                    <%=pageNum%></a>
	                </li>
	            <% } %>

            <!-- 다음 블럭으로 이동 -->
	            <% if (nowBlock < totalBlock - 1) { %>
	                <li class="page-item">
	                    <a class="page-link" href=
	                    "${pageContext.request.contextPath}/dashboard?fn=PROJ_LIST&nowPage=<%=(nowBlock+1) * pagePerBlock + 1%>&nowBlock=<%=nowBlock+1%>">
	                    Next
	                    </a>
	                </li>
	            <% } %>
	        </ul>
    	</div>
      
      
      <br>
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
