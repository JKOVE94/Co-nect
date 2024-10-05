<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로젝트 작성</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>프로젝트 작성</h2>
        <form action="${pageContext.request.contextPath}/dashboard?fn=PROJ_CREATE" method="post"> 
        <input type="hidden" name="proj_tag" value="red"/>
        <input type="hidden" name="proj_tagcol" value="red"/>
        <input type="hidden" name="proj_fk_comp_num" value="1"/>
    
            <div class="form-group">
                <label for="proj_name">프로젝트 이름:</label>
                <input type="text" class="form-control" id="proj_name" name="proj_name" required>
            </div>
            <div class="form-group">
                <label for="proj_members">프로젝트 참여자 사번:</label>
                <input type="text" class="form-control" id="proj_members" name="proj_members" required>
            </div>
            <div class="form-group">
                <label for="proj_fk_user_num">프로젝트 담당자 사번:</label>
                <input type="text" class="form-control" id="proj_fk_user_num" name="proj_fk_user_num" required>
            </div>
            <div class="form-group">
                <label for="proj_fk_dpart_num">프로젝트 부서 번호:</label>
                <input type="text" class="form-control" id="proj_fk_dpart_num" name="proj_fk_dpart_num" required>
            </div>
         
            <div class="form-group">
                <label for="proj_status">프로젝트 상태:</label>
                <select class="form-control" id="proj_status" name="proj_status" required>
                    <option value="">선택하세요</option>
                    <option value="예정">예정</option>
                    <option value="진행중">진행중</option>
                    <option value="완료">완료</option>
                </select>
            </div>
            <div class="form-group">
                <label for="proj_import">프로젝트 중요도:</label>
                <select class="form-control" id="proj_import" name="proj_import" required>
                    <option value="">선택하세요</option>
                    <option value="낮음">낮음</option>
                    <option value="보통">보통</option>
                    <option value="중요">중요</option>
                    <option value="긴급">긴급</option>
                </select>
            </div>
            <div class="form-group">
                <label for="proj_desc">프로젝트 설명:</label>
                <textarea class="form-control" id="proj_desc" name="proj_desc" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">저장</button>
            <a href="projList.jsp" class="btn btn-secondary">목록</a>
        </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>