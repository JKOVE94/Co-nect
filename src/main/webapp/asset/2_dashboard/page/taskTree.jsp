<%@ page import="db.dto.ProjectDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="db.dto.TaskDTO"%>
<%@ page import="java.lang.reflect.Array"%>
<%@ page import="java.util.HashMap"%><%--
  Created by IntelliJ IDEA.
  User: mylov
  Date: 2024-10-04
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
table {
	width: 98%;
	border: 1px solid gray;
	margine: none;
}

table {
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

th {
	background-color: #f4f4f4;
}

.toggle-btn {
	cursor: pointer;
}

.hidden {
	display: none;
}

.child {
	padding-left: 20px;
}

.title {
	width: 40%;
	text-align: left;
	padding-left: 20px;
}

.small {
	width: 10%;
}
</style>

<html>
<head>

</head>
<body>
	<div class="container-fluid" style="max-width: 100%; padding: 10px 0">
		<div class="row">
			<div class="col-12 px-0">
				<div class="card mx-auto" style="max-width: 98%;">
					<div class="card-body p-3">
						<div class="row mx-0">

							<div style="padding: 10px">
								<h6 class="mb-0 ms-2">업무 리스트</h6>
								<table style="margin: 10px">
									<thead>
										<th>업무명</th>
										<th>담당자</th>
										<th>상태</th>
										<th>업무순위</th>
										<th>시작일</th>
										<th>마감일</th>
									</thead>
									<c:set var="map" value="${sessionScope.getUserNameMap}" />
									<c:forEach var="t" items="${getTaskList}">
										<c:choose>
											<c:when test="${t.task_fk_task_num eq 0}">
												<tbody id="group${t.task_pk_num}">
													<!-- 부모 행 -->
													<tr class="parent" data-target="group${t.task_pk_num}">
														<td class="title toggle-btn"><c:if
																test="${getTaskList.stream().filter(child -> child.task_fk_task_num == t.task_pk_num).count() > 0}">
																<i class="bi bi-plus-circle-fill"></i>&nbsp;
                        </c:if> ${t.task_title}</td>
														<td class="small">${map[t.task_fk_user_num.toString()]}</td>
														<td class="small">${t.task_status}</td>
														<td class="small">${t.task_priority}</td>
														<td>${t.task_startdate}</td>
														<td>${t.task_deadline}</td>
													</tr>

													<!-- 자식 행들 -->
													<c:forEach var="child" items="${getTaskList}">
														<c:if test="${child.task_fk_task_num eq t.task_pk_num}">
															<tr class="child group${t.task_pk_num} hidden">
																<td class="title">&nbsp;&nbsp;&nbsp;<i
																	class="bi bi-arrow-return-right"></i>&nbsp;${child.task_title}
																</td>
																<td class="small">${map[child.task_fk_user_num.toString()]}</td>
																<td class="small">${child.task_status}</td>
																<td class="small">${child.task_priority}</td>
																<td>${child.task_startdate}</td>
																<td>${child.task_deadline}</td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</c:when>
										</c:choose>
									</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	// 트리 구조의 부모 항목 클릭 시 자식 항목을 토글하는 함수
	document.querySelectorAll('.toggle-btn').forEach(function(row) {
		row.addEventListener('click', function() {
			var parentRow = this.closest('tr.parent'); // 부모 행 찾기
			var targetClass = parentRow.getAttribute('data-target');
			var childRows = document.querySelectorAll('.' + targetClass);

			childRows.forEach(function(childRow) {
				childRow.classList.toggle('hidden');

				// 아이콘 변경
				var icon = parentRow.querySelector('i');
				if (childRow.classList.contains('hidden')) {
					icon.classList.remove('bi-dash-circle');
					icon.classList.add('bi-plus-circle-fill');
				} else {
					icon.classList.remove('bi-plus-circle-fill');
					icon.classList.add('bi-dash-circle');
				}
			});
		});
	});
</script>
</html>
