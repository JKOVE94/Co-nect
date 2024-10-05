<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>해제 결과</title>
    <style>
        body {
            font-family: "Arial", sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        h3 {
            color: #4CAF50;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h3>해제 성공</h3>
    <p>사용자 계정이 성공적으로 해제되었습니다.</p>
    <a href="${pageContext.request.contextPath}/manage?fn=ADMIN_LOCKUSER">목록으로 이동</a>
</body>
</html>