<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 삭제 확인</title>
    <script>
        function cancelDelete() {
            window.history.back();  // 이전 페이지로 돌아가기 (취소)
        }
    </script>
</head>
<body>
    <h2>게시글 삭제 확인</h2>
    <p>정말로 이 게시글을 삭제하시겠습니까?</p>
    
    <form id="deleteForm" action="${pageContext.request.contextPath}/dashboard?fn=FREE_DELETE&post_pk_num=${post_pk_num}"" method="post">
        <!-- 게시글 ID를 서버에 전송 -->
        <input type="hidden" name="fn" value="FREE_DELETE">
        <input type="hidden" name="postId" value="${postId}">

        <!-- 확인 버튼 -->
        <button type="submit">확인</button>

        <!-- 취소 버튼 -->
        <button type="button" onclick="cancelDelete()">취소</button>
    </form>
</body>
</html>
