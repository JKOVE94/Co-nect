<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="db.dto.PostDTO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 읽기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>게시글 </h2>
        
        <form method="post" action="freeList.jsp">
            <input type="hidden" name="proj_pk_num" value="${dto.proj_pk_num}">
           
                    <div class="form-group">
                        <label>제목</label>
                        <p class="form-control-plaintext">${dto.proj_name}</p>
                    </div>
                    <div class="form-group">
                        <label>프로젝트 대상 번호</label>
                        <p class="form-control-plaintext">${dto.proj_members}</p>
                    </div>
                    <div class="form-group">
                        <label>작성자</label>
                        <p class="form-control-plaintext">${dto.proj_fk_user_num}</p>
                    </div>
                    <div class="form-group">
                        <label>작성일</label>
                        <p class="form-control-plaintext">${dto.proj_created}</p>
                    </div>
                    <div class="form-group">
                        <label>우선순위</label>
                        <p class="form-control-plaintext">${dto.proj_import}</p>
                    </div>
                    <div class="form-group">
                        <label>프로젝트 설명</label>
                        <p class="form-control-plaintext">${dto.proj_desc}</p>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/dashboard?fn=PROJ_UPDATE&proj_pk_num=${dto.proj_pk_num}'">수정</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/dashboard?fn=PROJ_DELETE&proj_pk_num=${dto.proj_pk_num}'" >삭제</button>
                      <a href="<%=request.getContextPath()%>/dashboard?fn=PROJ_LIST" class="btn btn-secondary">리스트로 돌아가기</a>
                      <div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="favorite" 
					  <c:if test="${dto.favoriteCheck == true}">
					 	 checked
					  </c:if>>
					  <label class="form-check-label" for="favorite">
					    즐겨찾기
					  </label>
					</div>
        </form>
    </div>
</body>
<script>
	const favoriteToggle = document.getElementById('favorite');
	favoriteToggle.addEventListener('click',() => {
		if (favoriteToggle.checked){
			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_CREATE&proj_pk_num=${dto.proj_pk_num}&url=READ`;
		} else {
			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_DEL&proj_pk_num=${dto.proj_pk_num}&url=READ`;
		}
	})
</script>
</html>
