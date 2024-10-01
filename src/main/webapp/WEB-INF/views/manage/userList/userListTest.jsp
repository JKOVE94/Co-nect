<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 리스트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <h1>회원 리스트</h1>
    <table>
     	<tr>
        	<th>사번</th>
            <th>이름</th>
            <th>직급</th>
            <th></th>
            <th></th>
        </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.user_pk_num}</td>
            <td>${user.user_name}</td>
            <td>${user.user_rank}</td>
            <td><a href="${pageContext.request.contextPath}/manage?fn=ADMIN_USERINFO_PROC&user_pk_num=${user.user_pk_num}">수정</a></td>
            <td><a href="${pageContext.request.contextPath}/manage?fn=ADMIN_USERDEL_PROC&user_pk_num=${user.user_pk_num}">삭제</a></td>
        </tr>
    </c:forEach>
    </table>
<a href="${pageContext.request.contextPath}/manage?fn=ADMIN_MANAGE" class="btn btn-primary">관리자 페이지로 돌아가기</a>
</body>
</html>