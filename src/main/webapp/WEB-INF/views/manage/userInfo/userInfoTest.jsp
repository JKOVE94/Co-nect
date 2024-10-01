<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link href="${pageContext.request.contextPath}/asset/3_manage/userSetting/admin_setUser.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정</h1>
		
		<form method="post" action="${pageContext.request.contextPath}/manage?fn=ADMIN_USERUPDATE_PROC" enctype="multipart/form-data">
			<input type="hidden" name="user_fk_comp_num" value="${user.user_fk_comp_num}" />
			
			<label for="user_pic">사진</label> 
			<div style="width:100px; height:100px;border:1px solid black; border-radius : 5px;overflow:hidden;">
				<img src="${user.user_pic}"/>
			</div>
			* 파일 선택 시 기존 사진은 삭제 됩니다 *
			<input type="file" id="user_pic" name="user_pic"  value="${user.user_pic}"> 
			<!-- 파일 선택 취소하는 버튼 넣기 -->
			
			<label for="user_pk_num">사번</label> 
			<input type="number" id="user_pk_num" name="user_pk_num" value="${user.user_pk_num}" readonly="readonly"> 
			
			<label for="user_name">이름</label>
			<input type="text" id="user_name" name="user_name" value="${user.user_name}">

			<label for="user_pw">임시비밀번호</label> 
			<input type="password" id="user_pw" name="user_pw" value="${user.user_pw}">
			
			<label for="user_mail">이메일</label>
			<input type="email" id="user_mail" name="user_mail" value="${user.user_mail}">

			<label for="user_regdate">입사일</label> 
			<input type="date" id="user_regdate" name="user_regdate" value="${user.user_regdate}"> 
			
			<label for="user_rank">직급</label> 
			<select name="user_rank" id="user_rank">
				<option value="사원" <c:if test="${user.user_rank == '사원'}">selected</c:if>>사원</option>
				<option value="대리" <c:if test="${user.user_rank == '대리'}">selected</c:if>>대리</option>
				<option value="과장" <c:if test="${user.user_rank == '과장'}">selected</c:if>>과장</option>
				<option value="차장" <c:if test="${user.user_rank == '차장'}">selected</c:if>>차장</option>
				<option value="부장" <c:if test="${user.user_rank == '부장'}">selected</c:if>>부장</option>
				<option value="이사" <c:if test="${user.user_rank == '이사'}">selected</c:if>>이사</option>
				<option value="전무" <c:if test="${user.user_rank == '전무'}">selected</c:if>>전무</option>
				<option value="사장" <c:if test="${user.user_rank == '사장'}">selected</c:if>>사장</option>
			</select> 
			
			<label for="user_fk_job_num">직무</label> 
			<select name="user_fk_job_num" id="user_fk_job_num">
				<option value="1" <c:if test="${user.user_fk_job_num == 1}">selected</c:if>>개발</option>
				<option value="2" <c:if test="${user.user_fk_job_num == 2}">selected</c:if>>기획</option>
				<option value="3" <c:if test="${user.user_fk_job_num == 3}">selected</c:if>>디자인</option>
				<option value="4" <c:if test="${user.user_fk_job_num == 4}">selected</c:if>>마케팅</option>
				<option value="5" <c:if test="${user.user_fk_job_num == 5}">selected</c:if>>영업</option>
				<option value="6" <c:if test="${user.user_fk_job_num == 6}">selected</c:if>>경영</option>
				<option value="7" <c:if test="${user.user_fk_job_num == 7}">selected</c:if>>인사</option>
				<option value="8" <c:if test="${user.user_fk_job_num == 8}">selected</c:if>>경영지원</option>
				<option value="9" <c:if test="${user.user_fk_job_num == 9}">selected</c:if>>인사</option>
			</select> 
			
			<label for="user_fk_dpart_num">소속 부서</label> 
			<select id="user_fk_dpart_num" name="user_fk_dpart_num">
				<option value="1" <c:if test="${user.user_fk_dpart_num == 1}">selected</c:if>>영업부</option>
				<option value="2" <c:if test="${user.user_fk_dpart_num == 2}">selected</c:if>>기술부</option>
				<option value="3" <c:if test="${user.user_fk_dpart_num == 3}">selected</c:if>>생산부</option>
				<option value="4" <c:if test="${user.user_fk_dpart_num == 4}">selected</c:if>>경영지원부</option>
				<option value="5" <c:if test="${user.user_fk_dpart_num == 5}">selected</c:if>>인사부</option>
			</select> 
			
			<label for="user_fk_acc_authornum">계정 권한</label>
			<select id="user_fk_acc_authornum" name="user_fk_acc_authornum">
				<option value="1" <c:if test="${user.user_fk_acc_authornum == 1}">selected</c:if>>유저</option>
				<option value="2" <c:if test="${user.user_fk_acc_authornum == 2}">selected</c:if>>프로젝트 관리자</option>
				<option value="3" <c:if test="${user.user_fk_acc_authornum == 3}">selected</c:if>>총 관리자</option>
				<option value="4" <c:if test="${user.user_fk_acc_authornum == 4}">selected</c:if>>사용제한</option>
			</select>
			
			<button type="submit">수정 완료</button>
			<button type="button">취소</button>
		</form>
	</div>

</body>
</html>