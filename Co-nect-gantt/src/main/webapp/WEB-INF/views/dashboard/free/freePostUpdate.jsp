<%@page import="db.dto.PostDTO"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>게시글 수정</h2>
    <form method="post" action="${pageContext.request.contextPath}/dashboard?fn=FREE_UPDATED&post_pk_num=${dto.post_pk_num}">
        <input type="hidden" name="post_pk_num" value="${dto.post_pk_num}">
        <div class="form-group">
            <label for="post_name">제목</label>
            <input type="text" class="form-control" id="post_name" name="post_name" value="${dto.post_name}" required>
        </div>
        <div class="form-group">
            <label for="post_targetnum">게시글 대상 번호</label>
            <input type="text" class="form-control" id="post_targetnum" name="post_targetnum" value="${dto.post_targetnum}" required>
        </div>
        <div class="form-group">
            <label for="post_fk_user_num">작성자</label>
            <input type="text" class="form-control" id="post_fk_user_num" name="post_fk_user_num" value="${dto.post_fk_user_num}" required>
        </div>
        <div class="form-group">
            <label for="post_regdate">작성일</label>
            <input type="date" class="form-control" id="post_regdate" name="post_regdate" value="${dto.post_regdate}" required>
        </div>
        <div class="form-group">
            <label for="post_import">우선순위</label>
            <select class="form-control" id="post_import" name="post_import" required>
                <option value="높음" ${dto.post_import == '높음' ? 'selected' : ''}>높음</option>
                <option value="중간" ${dto.post_import == '중간' ? 'selected' : ''}>중간</option>
                <option value="낮음" ${dto.post_import == '낮음' ? 'selected' : ''}>낮음</option>
            </select>
        </div>
        <div class="form-group">
            <label for="post_content">글 내용</label>
            <textarea class="form-control" id="post_content" name="post_content" rows="5" required>${dto.post_content}</textarea>
        </div>
        <button type="submit" class="btn btn-primary" >수정 완료</button>
        <button type="button" class="btn btn-secondary" onclick="javascript:history.back()">취소</button>
    </form>
</div>
</body>
</html>