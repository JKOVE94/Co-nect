<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
=========================================================
* Argon Dashboard 2 - v2.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <%-------------------- 헤드 섹션: 메타데이터 및 스타일시트 ---------------------%>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="apple-touch-icon" sizes="76x76"
          href="asset/3_manage/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="asset/3_manage/img/favicon.png" />
    <title>Argon Dashboard 2 by Creative Tim</title>
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
            rel="stylesheet" />
    <link href="asset/3_manage/css/nucleo-icons.css" rel="stylesheet" />
    <link href="asset/3_manage/css/nucleo-svg.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/42d5adcbca.js"
            crossorigin="anonymous"></script>
    <link id="pagestyle" href="asset/3_manage/css/argon-dashboard.css?v=2.0.4"
          rel="stylesheet" />
</head>

<body class="g-sidenav-show bg-gray-100">
<%-------------------- 헤더 섹션: 배경 이미지 ---------------------%>
<div class="position-absolute w-100 min-height-300 top-0"
     style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/profile-layout-header.jpg'); background-position-y: 50%;">
    <span class="mask bg-primary opacity-6"></span>
</div>

<%-------------------- 사이드바 섹션: 내비게이션 메뉴 ---------------------%>
<aside
        class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4"
        id="sidenav-main">
    <div class="collapse navbar-collapse w-auto"
         id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <!-- 모든 사용자 정보 조회 기능 --> <a class="nav-link"
                                            href="<%=request.getContextPath()%>/manage?fn=ADMIN_USERLIST_PROC">
                <div
                        class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                    <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
                </div> <span class="nav-link-text ms-1">모든 사용자 정보</span>
            </a>
            </li>
            <li class="nav-item">
                <!-- 사용자 등록 기능 --> <a class="nav-link"
                                      href="<%=request.getContextPath()%>/manage?fn=ADMIN_USERSET">
                <div
                        class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                    <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
                </div> <span class="nav-link-text ms-1">사용자 등록</span>
            </a>
            </li>
            <li class="nav-item">
                <!-- 사용자 잠금 해제 기능 --> <a class="nav-link"
                                         href="<%=request.getContextPath()%>/manage?fn=ADMIN_LOCKUSER">
                <div
                        class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                    <i class="ni ni-app text-info text-sm opacity-10"></i>
                </div> <span class="nav-link-text ms-1">사용자 잠금 해제</span>
            </a>
            </li><li class="nav-item">
                <!-- 사용자 잠금 해제 기능 --> <a class="nav-link"
                                         href="<%=request.getContextPath()%>/dashboard?fn=HOME">
                <div
                        class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                    <i class="ni ni-laptop text-info text-sm opacity-10"></i>
                </div> <span class="nav-link-text ms-1">대시보드로 돌아가기</span>
            </a>
            </li>
        </ul>
    </div>
</aside>
<main>
	<div style="margin-top: 116px; margin-left:300px; max-width:800px;" >
			<div class="card  ">
			<form method="post" action="${pageContext.request.contextPath}/manage?fn=ADMIN_USERUPDATE_PROC" enctype="multipart/form-data">
				<div class="card-header pb-0 d-flex justify-content-between">
					<h2>회원 정보 수정</h2> <button type="submit" class="btn btn-primary" >수정</button>
				</div>
				<div class="col-10 mx-auto mb-5" >
					<input type="hidden" name="user_fk_comp_num" value="${user.user_fk_comp_num}" />
					
					<label for="user_pic">사진</label> 
					<div style="width:100px; height:100px;border:1px solid black; border-radius : 5px;overflow:hidden;">
						<img src="${user.user_pic}"/>
					</div>
					* 파일 선택 시 기존 사진은 삭제 됩니다 *
					<input class="form-control" type="file" id="user_pic" name="user_pic"  value="${user.user_pic}"> 
					<!-- 파일 선택 취소하는 버튼 넣기 -->
					
					<label for="user_pk_num">사번</label> 
					<input class="form-control" type="number" id="user_pk_num" name="user_pk_num" value="${user.user_pk_num}" readonly="readonly"> 
					
					<label for="user_name">이름</label>
					<input class="form-control" type="text" id="user_name" name="user_name" value="${user.user_name}">
		
					<label for="user_pw">임시비밀번호</label> 
					<input class="form-control" type="password" id="user_pw" name="user_pw" value="${user.user_pw}">
					
					<label for="user_mail">이메일</label>
					<input class="form-control" type="email" id="user_mail" name="user_mail" value="${user.user_mail}">
		
					<label for="user_regdate">입사일</label> 
					<input class="form-control" type="date" id="user_regdate" name="user_regdate" value="${user.user_regdate}"> 
					
					<label for="user_rank">직급</label> 
					<select class="form-control" name="user_rank" id="user_rank">
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
					<select class="form-control" name="user_fk_job_num" id="user_fk_job_num">
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
					<select class="form-control" id="user_fk_dpart_num" name="user_fk_dpart_num">
						<option value="1" <c:if test="${user.user_fk_dpart_num == 1}">selected</c:if>>영업부</option>
						<option value="2" <c:if test="${user.user_fk_dpart_num == 2}">selected</c:if>>기술부</option>
						<option value="3" <c:if test="${user.user_fk_dpart_num == 3}">selected</c:if>>생산부</option>
						<option value="4" <c:if test="${user.user_fk_dpart_num == 4}">selected</c:if>>경영지원부</option>
						<option value="5" <c:if test="${user.user_fk_dpart_num == 5}">selected</c:if>>인사부</option>
					</select> 
					
					<label for="user_fk_acc_authornum">계정 권한</label>
					<select class="form-control" id="user_fk_acc_authornum" name="user_fk_acc_authornum">
						<option value="1" <c:if test="${user.user_fk_acc_authornum == 1}">selected</c:if>>유저</option>
						<option value="2" <c:if test="${user.user_fk_acc_authornum == 2}">selected</c:if>>프로젝트 관리자</option>
						<option value="3" <c:if test="${user.user_fk_acc_authornum == 3}">selected</c:if>>총 관리자</option>
						<option value="4" <c:if test="${user.user_fk_acc_authornum == 4}">selected</c:if>>사용제한</option>
					</select>
				</div>
			</form>
		</div>
	</div>
</main>
<%-------------------- 플러그인 섹션: 설정 옵션 ---------------------%>
<div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
        <i class="fa fa-cog py-2"></i>
    </a>
    <div class="card shadow-lg">
        <div class="card-header pb-0 pt-3">
            <div class="float-start">
                <h5 class="mt-3 mb-0">Argon Configurator</h5>
                <p>대시보드 옵션을 확인하세요.</p>
            </div>
            <div class="float-end mt-4">
                <button
                        class="btn btn-link text-dark p-0 fixed-plugin-close-button">
                    <i class="fa fa-close"></i>
                </button>
            </div>
        </div>
        <hr class="horizontal dark my-1" />
        <div class="card-body pt-sm-3 pt-0 overflow-auto">
            <div>
                <h6 class="mb-0">사이드바 색상</h6>
            </div>
            <a href="javascript:void(0)" class="switch-trigger background-color">
                <div class="badge-colors my-2 text-start">
						<span class="badge filter bg-gradient-primary active"
                              data-color="primary" onclick="sidebarColor(this)"></span> <span
                        class="badge filter bg-gradient-dark" data-color="dark"
                        onclick="sidebarColor(this)"></span> <span
                        class="badge filter bg-gradient-info" data-color="info"
                        onclick="sidebarColor(this)"></span> <span
                        class="badge filter bg-gradient-success" data-color="success"
                        onclick="sidebarColor(this)"></span> <span
                        class="badge filter bg-gradient-warning" data-color="warning"
                        onclick="sidebarColor(this)"></span> <span
                        class="badge filter bg-gradient-danger" data-color="danger"
                        onclick="sidebarColor(this)"></span>
                </div>
            </a>
            <div class="mt-3">
                <h6 class="mb-0">사이드바 유형</h6>
                <p class="text-sm">두 가지 사이드바 유형 중에서 선택하세요.</p>
            </div>
            <div class="d-flex">
                <button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2"
                        data-class="bg-white" onclick="sidebarType(this)">화이트</button>
                <button class="btn bg-gradient-primary w-100 px-3 mb-2"
                        data-class="bg-default" onclick="sidebarType(this)">다크</button>
            </div>
            <p class="text-sm d-xl-none d-block mt-2">사이드바 유형은 데스크탑 보기에서만
                변경할 수 있습니다.</p>
            <hr class="horizontal dark my-sm-4" />
            <div class="mt-2 mb-5 d-flex">
                <h6 class="mb-0">라이트 / 다크 모드</h6>
                <div class="form-check form-switch ps-0 ms-auto my-auto">
                    <input class="form-check-input mt-1 ms-auto" type="checkbox"
                           id="dark-version" onclick="darkMode(this)" />
                </div>
            </div>
            <a class="btn bg-gradient-dark w-100"
               href="https://www.creative-tim.com/product/argon-dashboard">무료
                다운로드</a> <a class="btn btn-outline-dark w-100"
                            href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard">문서
            보기</a>
            <div class="w-100 text-center">
                <a class="github-button"
                   href="https://github.com/creativetimofficial/argon-dashboard"
                   data-icon="octicon-star" data-size="large" data-show-count="true"
                   aria-label="Star creativetimofficial/argon-dashboard on GitHub">Star</a>
                <h6 class="mt-3">공유해 주셔서 감사합니다!</h6>
                <a
                        href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard"
                        class="btn btn-dark mb-0 me-2" target="_blank"> <i
                        class="fab fa-facebook-square me-1" aria-hidden="true"></i> 공유
                </a>
            </div>
        </div>
    </div>
</div>

<%-------------------- 핵심 JS 파일 섹션 ---------------------%>
<script src="asset/3_manage/js/core/popper.min.js"></script>
<script src="asset/3_manage/js/core/bootstrap.min.js"></script>
<script src="asset/3_manage/js/plugins/perfect-scrollbar.min.js"></script>
<script src="asset/3_manage/js/plugins/smooth-scrollbar.min.js"></script>
<script>

    <%-------------------- 스크롤바 옵션 초기화 ---------------------%>
    var win = navigator.platform.indexOf("Win") > -1;
    if (win && document.querySelector("#sidenav-scrollbar")) {
        var options = {
            damping : "0.5",
        };
        Scrollbar.init(document.querySelector("#sidenav-scrollbar"),
            options);
    }
</script>

<%-------------------- GitHub 버튼 섹션 ---------------------%>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<%-------------------- 대시보드 제어 센터: 패럴랙스 효과, 예제 페이지 스크립트 등 ---------------------%>
<script src="asset/3_manage/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>
</html>
