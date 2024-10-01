<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>새 게시글 작성</h2>
        <form action="${pageContext.request.contextPath}/dashboard?fn=FREE_POST" method="post"> 
        <input type="hidden" name="post_kind" value="1"/>
        <input type="hidden" name="post_fk_dpart_num" value="1"/>
        <input type="hidden" name="post_fk_comp_num" value="1"/>
        <input type="hidden" name="post_tag" value="red"/>
            <div class="form-group">
                <label for="post_targetnum">대상 번호:</label>
                <input type="text" class="form-control" id="post_targetnum" name="post_targetnum" required>
            </div>
            <div class="form-group">
                <label for="post_name">제목:</label>
                <input type="text" class="form-control" id="post_name" name="post_name" required>
            </div>
            <div class="form-group">
                <label for="post_fk_user_num">작성자:</label>
                <input type="text" class="form-control" id="post_fk_user_num" name="post_fk_user_num" required>
            </div>
            
            <div class="form-group">
                <label for="post_import">우선순위:</label>
                <select class="form-control" id="post_import" name="post_import" required>
                    <option value="">선택하세요</option>
                    <option value="높음">높음</option>
                    <option value="중간">중간</option>
                    <option value="낮음">낮음</option>
                </select>
            </div>
            <div class="form-group">
                <label for="post_content">내용:</label>
                <textarea class="form-control" id="post_content" name="post_content" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">게시글 저장</button>
            <a href="freePostList.jsp" class="btn btn-secondary">목록으로 돌아가기</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>