<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
        }

        .user-info {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .user-info label {
            margin-right: 10px;
            font-weight: bold;
            min-width: 80px; /* 레이블의 최소 너비 설정 */
        }

        .user-info input[type="text"], 
        .user-info select {
            flex: 1;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .divider {
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <h1>잠긴계정관리</h1>
    <form action="${pageContext.request.contextPath}/manage?fn=ADMIN_LOCKUSER_PROC" method="post">
        <c:forEach var="user" items="${sessionScope.userList}">
            <div class="user-info">
                <label for="user_name_${user.user_pk_num}">회원명</label>
                <input type="text" id="user_name_${user.user_pk_num}" name="user_name" value="${user.user_name}" />

                <label for="user_pk_num_${user.user_pk_num}">사번</label>
                <input type="text" id="user_pk_num_${user.user_pk_num}" name="user_pk_num" value="${user.user_pk_num}" />

                <label for="user_locked_${user.user_pk_num}">계정 권한</label>
                <select id="user_locked_${user.user_pk_num}" name="user_locked">
                    <option value="0" <c:if test="${user.user_locked eq '0'}">selected</c:if>>해제</option>
                    <option value="1" <c:if test="${user.user_locked eq '1'}">selected</c:if>>잠김</option>
                </select>
            </div>
            <div class="divider"></div>
        </c:forEach>

        <input type="submit" value="저장" />
    </form>
    <form action="javascript:location.href='${pageContext.request.contextPath}/manage?fn=ADMIN_MANAGE'">
        <input type="submit" value="이전 페이지로 돌아가기" />
    </form>
</body>
</html>