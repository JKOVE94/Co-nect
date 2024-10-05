<%@ page import="db.dto.ProjectDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.dto.TaskDTO" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: mylov
  Date: 2024-10-04
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <style>
        table{
            border: 1px solid gray;
        }
    </style>
</head>
<body>

<table>
    <tr>
        <th>
            업무명
        </th>
        <th>
            담당자
        </th>
        <th>
            상태
        </th>
        <th>
            시작일
        </th>
        <th>
            마감일
        </th>
    </tr>
    <c:set var="map" value="${sessionScope.getUserMap}"/>
    <c:forEach var="t" items="${getTaskList}">
    <c:choose>
        <c:when test="${t.task_fk_task_num > 0}">
        <tr class="hidden">
            <td>
                &nbsp;&nbsp;<span>${t.task_title}
            </td>
            <td>
               ${map[t.task_fk_user_num.toString()]}
            </td>
            <td>
                ${t.task_status}
            </td>
            <td>
                ${t.task_startdate}
            </td>
            <td>
                ${t.task_deadline}
            </td>
        </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <td>
                    <span>${t.task_title}
                </td>
                <td>
                        ${map[t.task_fk_user_num.toString()]}
                </td>
                <td>
                        ${t.task_status}
                </td>
                <td>
                        ${t.task_startdate}
                </td>
                <td>
                        ${t.task_deadline}
                </td>
            </tr>
        </c:otherwise>
        </c:choose>
    </c:forEach>

</table>
</body>
</html>
