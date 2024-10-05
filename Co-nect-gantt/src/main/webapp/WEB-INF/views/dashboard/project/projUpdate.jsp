<%@page import="db.dto.ProjectDTO"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로젝트 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>프로젝트 수정</h2>
    <form method="post" action="${pageContext.request.contextPath}/dashboard?fn=PROJ_UPDATED">
        <input type="hidden" name="proj_fk_dpart_num" value="${dto.proj_fk_dpart_num}">
        <input type="hidden" name="proj_fk_user_num" value="${dto.proj_fk_user_num}">
        <input type="hidden" name="proj_pk_num" value="${dto.proj_pk_num}">
        <div class="form-group">
            <label for="proj_name">프로젝트 이름: </label>
            <input type="text" class="form-control" id="proj_name" name="proj_name" value="${dto.proj_name}" required>
        </div>
        <div class="form-group">
            <label for="proj_members"W>프로젝트 참여자 사번:  </label>
            <input type="text" class="form-control" id="proj_members" name="proj_members" value="${dto.proj_members}" required>
        </div>
        <div class="form-group">
            <label>프로젝트 담당자 사번: </label>
            <input type="text" class="form-control" id="post_fk_user_num" name="post_fk_user_num" value="${dto.proj_fk_user_num}" required>
        </div>
        <div class="form-group">
                <label for="proj_fk_dpart_num">프로젝트 부서 번호:</label>
                <input type="text" class="form-control" id="proj_fk_dpart_num" name="proj_fk_dpart_num" value="${dto.proj_fk_dpart_num}" required>
        </div>
      	<div class="form-group">
                <label for="proj_status">프로젝트 상태:</label>
                <select class="form-control" id="proj_status" name="proj_status" required>
                    <option value="">선택하세요</option>
                    <option value="예정" ${dto.proj_status == '예정' ? 'selected' : ''}>예정</option>
                    <option value="진행중" ${dto.proj_status == '진행중' ? 'selected' : ''}>진행중</option>
                    <option value="완료" ${dto.proj_status == '완료' ? 'selected' : ''}>완료</option>
                </select>
        </div>
        <div class="form-group">
            <label for="proj_import">프로젝트 중요도: </label>
            <select class="form-control" id="proj_import" name="proj_import" required>
                <option value="낮음" ${dto.proj_import == '낮음' ? 'selected' : ''}>낮음</option>
                <option value="보통" ${dto.proj_import == '보통' ? 'selected' : ''}>보통</option>
                <option value="중요" ${dto.proj_import == '중요' ? 'selected' : ''}>중요</option>
                <option value="긴급" ${dto.proj_import == '긴급' ? 'selected' : ''}>긴급</option>
            </select>
        </div>
        <div class="form-group">
            <label for="proj_desc">프로젝트 설명:</label>
            <textarea class="form-control" id="proj_desc" name="proj_desc" rows="5" required>${dto.proj_desc}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">수정 완료</button>
        <button type="button" class="btn btn-secondary" onclick="javascript:history.back()" >취소</button>
    </form>
</div>
</body>
</html>