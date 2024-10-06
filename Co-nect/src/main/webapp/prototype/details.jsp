<%@page import="java.sql.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="db.dto.TaskDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
List<TaskDTO> tasks = (List<TaskDTO>) request.getAttribute("taskList");
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <link
          rel="apple-touch-icon"
          sizes="76x76"
          href="./assets/img/apple-icon.png"
  />
  <link rel="icon" type="image/png" href="./assets/img/favicon.png" />
  <title>2조 프로젝트</title>
  <!--     Fonts and icons     -->
  <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
          rel="stylesheet"
  />
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script
          src="https://kit.fontawesome.com/42d5adcbca.js"
          crossorigin="anonymous"
  ></script>
  <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link
          id="pagestyle"
          href="./assets/css/argon-dashboard.css?v=2.0.4"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
  />

  <style>
    .profile-container {
      margin-top:2px; /* 위쪽 마진 추가 */
    }
    .profile-container {
      margin-left: auto; /* 오른쪽 정렬을 위해 추가 */
    }

    .profile-photo-small {
      width: 36px;
      height: 36px;
      position: relative;
      overflow: hidden;
    }

    .profile-photo-small img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .profile-photo-small .default-icon {
      display: none;
      width: 100%;
      height: 100%;
      justify-content: center;
      align-items: center;
      font-size: 36px;
      color: #f1f1f1;
      background-color: transparent;
    }

    @media (max-width: 1199.98px) {
      /* xl 브레이크포인트 미만에서 적용 */
      .profile-container {
        margin-right: 15px; /* 모바일에서 오른쪽 여백 추가 */
      }
    }
  </style>

  <style>
    #tree {
      display: inline-block;
      padding: 10px;

    }

    #tree * {
      box-sizing: border-box;
    }

    #tree .branch {
      padding: 5px 0 5px 20px;
    }

    #tree .branch:not(:first-child) {
      margin-left: 170px;
    }

    #tree .branch:not(:first-child):after {
      content: "";
      width: 20px;
      border-top: 1px solid #ccc;
      position: absolute;
      left: 150px;
      top: 50%;
      margin-top: 1px;
    }

    .entry {
      position: relative;
      min-height: 42px;
      display: block;
    }

    .entry:before {
      content: "";
      height: 100%;
      border-left: 1px solid #ccc;
      position: absolute;
      left: -20px;
    }

    .entry:first-child:after {
      height: 10px;
      border-radius: 10px 0 0 0;
    }

    .entry:first-child:before {
      width: 10px;
      height: 50%;
      top: 50%;
      margin-top: 1px;
      border-radius: 10px 0 0 0;
    }

    .entry:after {
      content: "";
      width: 20px;
      transition: border 0.5s;
      border-top: 1px solid #ccc;
      position: absolute;
      left: -20px;
      top: 50%;
      margin-top: 1px;
    }

    /* 기존 CSS 코드 */

    #tree > .branch > .entry:first-child:after {
      content: none;
    }

    .entry:last-child:before {
      width: 10px;
      height: 50%;
      border-radius: 0 0 0 10px;
    }
    .entry:last-child:after {
      height: 10px;
      border-top: none;
      transition: border 0.5s;
      border-bottom: 1px solid #ccc;
      border-radius: 0 0 0 10px;
      margin-top: -9px;
    }

    .entry:only-child:after {
      width: 10px;
      height: 0px;
      margin-top: 1px;
      border-radius: 0px;
    }

    .entry:only-child:before {
      display: none;
    }

    .entry span {
      border: 1px solid #ccc;
      display: block;
      min-width: 150px;
      padding: 5px 10px;
      line-height: 20px;
      text-align: center;
      position: absolute;
      left: 0;
      top: 50%;
      margin-top: -15px;
      color: #666;
      font-family: arial, verdana, tahoma;
      font-size: 10px;
      display: inline-block;
      border-radius: 5px;
      transition: all 0.5s;
    }

    #tree .entry span:hover,
    #tree .entry span:hover + .branch .entry span {
      background: #e6e6e6;
      color: #000;
      border-color: #a6a6a6;
    }

    #tree .entry span:hover + .branch .entry::after,
    #tree .entry span:hover + .branch .entry::before,
    #tree .entry span:hover + .branch::before,
    #tree .entry span:hover + .branch .branch::before {
      border-color: #a6a6a6;
    }
  </style>
  <!-- 간트차트 스타일 -->
  <style>
  		* {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }
        .chartMenu {
            width: 100vw;
            height: 80px;
            color: rgba(54, 162, 235, 1);
        }
        .chartMenu p {
            padding: 10px;
            font-size: 20px;
        }
          .chartCard {
        margin-left: -1rem; /* Adjust this value if necessary */
        width: calc(100% + 15rem); /* Make the width responsive */
        max-width: 80%; /* Prevent overflow */
        height: 60vh; /* Set chart height */
        overflow: hidden; /* Prevent content overflow */
        transform: scale(0.9);
    }
		.chartBox {
    		width: 80%; 
    		padding: 0px; 
    		border-radius: 20px;
    		border: solid 3px rgba(255,0,0,0); 
    		background: white;
		}
		
    .Task {
        max-width: 20%; 
        margin-top: 50px; 
        font-size: 15px; 
    }
    .Task input, .Task select, .Task button {
        width: 70%; /* Make inputs and buttons full width */
        margin-bottom: 10px; /* Add some space between elements */
        padding: 8px; /* Add padding for better touch targets */
        box-sizing: border-box; /* Ensure padding doesn't affect width */
    }
    
</style>
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body class="g-sidenav-show bg-gray-100">
<div
        class="position-absolute w-100 min-height-300 top-0"
        style="
        background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/profile-layout-header.jpg');
        background-position-y: 50%;
      "
>
  <span class="mask bg-primary opacity-6"></span>
</div>
<div class="sidenav-logo-container">
  <img
          src="../asset/1_landing/co-nect logo + text (w).svg"
          alt="Logo"
          class="sidenav-logo"
  />
</div>

<aside style="height: calc(100vh);"
       class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl fixed-start ms-4"
       id="sidenav-main"
>
  <!-- 사이드바 제목(로고) -->
  <div class="sidenav-header">
    <i
            class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
            aria-hidden="true"
            id="iconSidenav"
    ></i>
    <a class="navbar-brand m-0" href="<%=request.getContextPath()%>/dashboard?fn=HOME">
      <img
              src="../asset/1_landing/co-nect logo + text (1E74B1).svg"
              class="navbar-brand-img h-100"
              alt="main_logo"
      />
      <span class="ms-1 font-weight-bold">(주)코난2조</span>
    </a>
  </div>

  <!-- 사이드바 항목 -->
  <!-- 구분선 -->
  <hr class="horizontal dark mt-0" />

  <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
    <!-- 사이드 바 하위 항목 시작 -->
    <ul class="navbar-nav">
      <!-- 1) 즐겨찾기 -->
      <li class="nav-item">
        <a
                class="nav-link active"
                data-bs-toggle="collapse"
                data-bs-target="#favorites-collapse"
                aria-expanded="false"
                id="resourceManager"
        >
          <div
                  class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
          >
            <i class="bi bi-star text-primary text-sm opacity-10"></i>
          </div>
          <span class="nav-link-text ms-1">즐겨찾기</span>
        </a>

        <!-- 즐겨찾기 하위 메뉴 ( 프로젝트 ) -->
        <div class="collapse" id="favorites-collapse">
          <ul>
            <li style="list-style: none; text-align: center">
              <a class="nav-link" href="./Project.html">
                프로젝트
              </a>
            </li>
          </ul>
        </div>
      </li>

      <!-- 2) 프로젝트 -->
      <li class="nav-item">
        <a
                class="nav-link active"
                href="./virtual-reality.html"
                data-bs-toggle="collapse"
                data-bs-target="#project-collapse"
                aria-expanded="false"
                id="resourceManager"
        >
          <div
                  class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
          >
            <i class="ni ni-app text-info text-sm opacity-10"></i>
          </div>
          <span class="nav-link-text ms-1">프로젝트</span>
        </a>
        <!-- 프로젝트 하위 메뉴 -->
        <div class="collapse" id="project-collapse">
          <ul>
            <li style="list-style: none; text-align: center">
              <a class="nav-link" href="./Project.html">
                프로젝트 개요
              </a>
            </li>
          </ul>
        </div>

        <div class="collapse" id="project-collapse">
          <ul>
            <li style="list-style: none; text-align: center">
              <a class="nav-link" href="./details.html">
                프로젝트 일정
              </a>
            </li>
          </ul>
        </div>
      </li>

      <!-- 3) 게시판 -->
      <li class="nav-item">
        <a
                class="nav-link active"
                data-bs-toggle="collapse"
                data-bs-target="#board-collapse"
                aria-expanded="false"
                id="resourceManager"
        >
          <div
                  class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
          >
            <i
                    class="ni ni-credit-card text-success text-sm opacity-10"
            ></i>
          </div>
          <span class="nav-link-text ms-1">게시판</span>
        </a>
        <!-- 게시판 하위 메뉴 -->
        <div class="collapse" id="board-collapse">
          <ul>
            <li style="list-style: none; text-align: center;">
              <a class="nav-link" href="<%=request.getContextPath()%>/prototype/tables.jsp">
                사내 게시판
              </a>
            </li>
            <li style="list-style: none; text-align: center;">
              <a class="nav-link" href="<%=request.getContextPath()%>/dashboard?fn=FREE_LIST">
                자유 게시판
              </a>
            </li><li style="list-style: none; text-align: center;">
            <a class="nav-link" href="<%=request.getContextPath()%>/dashboard?fn=PROJ_LIST">
              프로젝트 게시판
            </a>
          </li>
          </ul>
        </div>
      </li>

      <!-- 4) 업무 관리 -->
      <li class="nav-item">
        <a
                class="nav-link active"
                data-bs-toggle="collapse"
                data-bs-target="#works-collapse"
                aria-expanded="false"
                id="resourceManager"
        >
          <div
                  class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
          >
            <i
                    class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"
            ></i>
          </div>
          <span class="nav-link-text ms-1">업무 관리</span>
        </a>
        <!-- 업무관리 하위 메뉴 -->
        <div class="collapse" id="works-collapse">
          <ul>
            <li style="list-style: none; text-align: center">
              <a class="nav-link"> 일정 관리 </a>
            </li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
</aside>
<main class="main-content position-relative border-radius-lg">
  <!-- Navbar -->
  <nav style="padding-top: 17px;"
       class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
       id="navbarBlur"
       data-scroll="false"
  >
    <div  class="container-fluid py-1 px-3">
      <div
              class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
              id="navbar"
      >
        <div class="ms-md-auto pe-md-3 d-flex align-items-center">

        </div>
        <ul class="navbar-nav align-items-center ml-auto">
          <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
            <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
              <div class="sidenav-toggler-inner">
                <i class="sidenav-toggler-line bg-white"></i>
                <i class="sidenav-toggler-line bg-white"></i>
                <i class="sidenav-toggler-line bg-white"></i>
              </div>
            </a>
          </li>
          <li class="nav-item px-3 d-flex align-items-center profile-container">
            <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
              <div class="profile-photo-small">
                <img src="path/to/profile-photo.jpg" alt="프로필 사진" class="rounded-circle" onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                <i class="bi bi-person-circle default-icon"></i>
              </div>
            </a>
            <ul class="dropdown-menu dropdown-menu-end px-2 py-1 me-sm-5" aria-labelledby="dropdownMenuButton">
              <li class="mb-2">
                <a class="dropdown-item border-radius-md" href="<%=request.getContextPath()%>/prototype/profile.jsp">
                  <div class="d-flex py-1">
                    <div class="my-auto">
                      <i class="bi bi-person-circle avatar avatar-sm bg-white text-dark me-3"></i>
                    </div>
                    <div class="d-flex flex-column justify-content-center">
                      <h6 class="text-sm font-weight-normal mb-1">
                        <span class="font-weight-bold" style="color=black">마이 페이지</span>
                      </h6>
                      <p class="text-xs text-secondary mb-0">
                        <i class="bi bi-bell me-1"></i>
                        1 new
                      </p>
                    </div>
                  </div>
                </a>
              </li>
              <li class="mb-2">
                <a class="dropdown-item border-radius-md" href="${pageContext.request.contextPath}/manage?fn=ADMIN_MANAGE">
                  <div class="d-flex py-1">
                    <div class="my-auto">
                      <i class="bi bi-gear-fill avatar avatar-sm bg-white text-dark me-3"></i>
                    </div>
                    <div class="d-flex flex-column justify-content-center">
                      <h6 class="text-sm font-weight-normal mb-1">
                        <span class="font-weight-bold" style="color:black">관리자 페이지</span>
                      </h6>
                      <p class="text-xs text-secondary mb-0">
                        <i class="bi bi-bell me-1"></i>
                        1 new
                      </p>
                    </div>
                  </div>
                </a>
              </li>
            </ul>

      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div style="margin-top: -15px;" class="container-fluid py-4">
    <div class="row mt-4">
      <div class="col-lg-7 mb-lg-0 mb-4">
        <div style="height: 100%;" class="card">
          <div class="card-header pb-0 p-3">
            <div style="margin-top: 15px;"
                 class="d-flex justify-content-between align-items-center mb-3"
            >
              <h6 class="mb-0 ms-4">스포티파이 코딩 작업</h6>
            </div>
          </div>
          <div style="overflow: auto;" id="cardContent" class="card-body p-3">
            <div style="margin-left: 3rem; margin-top: -1.5rem; margin-bottom: -1.3rem;"  id="tree">
              <div class="branch">
                <div class="entry"><span>프로젝트</span>
                  <div class="branch">
                    <div class="entry"><span>프론트엔드</span>
                      <div class="branch">
                        <div class="entry"><span>리액트</span>
                          <div class="branch">
                            <div class="entry"><span>컴포넌트</span></div>
                            <div class="entry"><span>상태관리</span></div>
                          </div>
                        </div>
                        <div class="entry"><span>자바스크립트</span>
                          <div class="branch">
                            <div class="entry"><span>ES6+</span></div>
                            <div class="entry"><span>DOM 조작</span></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="entry"><span>백엔드</span>
                      <div class="branch">
                        <div class="entry"><span>데이터베이스</span>
                          <div class="branch">
                            <div class="entry"><span>MySQL</span></div>
                            <div class="entry"><span>MongoDB</span></div>
                          </div>
                        </div>
                        <div class="entry"><span>서버</span>
                          <div class="branch">
                            <div class="entry"><span>Node.js</span></div>
                            <div class="entry"><span>Express</span></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 게시판 끝 -->

      <!-- 이번주 나의 업무 -->

      <div class="col-lg-5">
        <div class="card">
          <div class="card-header pb-0 p-3">
            <h6 class="mb-0 ms-4">이번 주 나의 업무</h6>
          </div>
          <div class="card-body p-6">
            <table class="table align-items-center">
              <tbody>
              <tr class="task-row high-priority">
                <td class="w-30">
                  <div class="d-flex px-2 py-1 align-items-center">
                    <div>
                      <i class="bi bi-clipboard-check text-primary" style="font-size: 1.5rem;"></i>
                    </div>
                    <div class="ms-4">
                      <p class="text-xs font-weight-bold mb-0">업무:</p>
                      <h6 class="text-sm mb-0">프로젝트 계획 수립</h6>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">마감일:</p>
                    <h6 class="text-sm mb-0">2024-09-20</h6>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">중요도:</p>
                    <h6 class="text-sm mb-0">높음</h6>
                  </div>
                </td>
                <td class="align-middle text-sm">
                  <div class="col text-center">
                    <p class="text-xs font-weight-bold mb-0">진행상태:</p>
                    <h6 class="text-sm mb-0">진행 중</h6>
                  </div>
                </td>
              </tr>
              <tr class="task-row">
                <td class="w-30">
                  <div class="d-flex px-2 py-1 align-items-center">
                    <div>
                      <i class="bi bi-people text-info" style="font-size: 1.5rem;"></i>
                    </div>
                    <div class="ms-4">
                      <p class="text-xs font-weight-bold mb-0">업무:</p>
                      <h6 class="text-sm mb-0">팀 미팅 준비</h6>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">마감일:</p>
                    <h6 class="text-sm mb-0">2024-09-18</h6>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">중요도:</p>
                    <h6 class="text-sm mb-0">중간</h6>
                  </div>
                </td>
                <td class="align-middle text-sm">
                  <div class="col text-center">
                    <p class="text-xs font-weight-bold mb-0">진행상태:</p>
                    <h6 class="text-sm mb-0">완료</h6>
                  </div>
                </td>
              </tr>
              <tr class="task-row high-priority">
                <td class="w-30">
                  <div class="d-flex px-2 py-1 align-items-center">
                    <div>
                      <i class="bi bi-file-earmark-text text-warning" style="font-size: 1.5rem;"></i>
                    </div>
                    <div class="ms-4">
                      <p class="text-xs font-weight-bold mb-0">업무:</p>
                      <h6 class="text-sm mb-0">보고서 작성</h6>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">마감일:</p>
                    <h6 class="text-sm mb-0">2024-09-22</h6>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">중요도:</p>
                    <h6 class="text-sm mb-0">높음</h6>
                  </div>
                </td>
                <td class="align-middle text-sm">
                  <div class="col text-center">
                    <p class="text-xs font-weight-bold mb-0">진행상태:</p>
                    <h6 class="text-sm mb-0">시작 전</h6>
                  </div>
                </td>
              </tr>
              <tr class="task-row">
                <td class="w-30">
                  <div class="d-flex px-2 py-1 align-items-center">
                    <div>
                      <i class="bi bi-code-square text-success" style="font-size: 1.5rem;"></i>
                    </div>
                    <div class="ms-4">
                      <p class="text-xs font-weight-bold mb-0">업무:</p>
                      <h6 class="text-sm mb-0">코드 리뷰</h6>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">마감일:</p>
                    <h6 class="text-sm mb-0">2024-09-21</h6>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">중요도:</p>
                    <h6 class="text-sm mb-0">중간</h6>
                  </div>
                </td>
                <td class="align-middle text-sm">
                  <div class="col text-center">
                    <p class="text-xs font-weight-bold mb-0">진행상태:</p>
                    <h6 class="text-sm mb-0">진행 중</h6>
                  </div>
                </td>
              </tr>
              <tr class="task-row">
                <td class="w-30">
                  <div class="d-flex px-2 py-1 align-items-center">
                    <div>
                      <i class="bi bi-gear text-secondary" style="font-size: 1.5rem;"></i>
                    </div>
                    <div class="ms-4">
                      <p class="text-xs font-weight-bold mb-0">업무:</p>
                      <h6 class="text-sm mb-0">시스템 유지보수</h6>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">마감일:</p>
                    <h6 class="text-sm mb-0">2024-09-23</h6>
                  </div>
                </td>
                <td>
                  <div class="text-center">
                    <p class="text-xs font-weight-bold mb-0">중요도:</p>
                    <h6 class="text-sm mb-0">낮음</h6>
                  </div>
                </td>
                <td class="align-middle text-sm">
                  <div class="col text-center">
                    <p class="text-xs font-weight-bold mb-0">진행상태:</p>
                    <h6 class="text-sm mb-0">시작 전</h6>
                  </div>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>


<!-- 간트차트 시작 -->

<div class="col-lg-11">
    <div style="margin-left: 3rem" class="card"> 
        <div class="row">
            <div class="chartCard"> 
                <canvas id="myChart"></canvas>
            </div>
            
            <div class="Task">
            <form action="${pageContext.request.contextPath}/dashProj?fn=Proj" method="post">        
        <div class="form-group">
            <label for="proj_name">프로젝트 이름:</label>
            <input type="text" id="task_title" name="task_title" required>
        </div>
        
        <div class="form-group">
            <label for="task_startdate">시작일:</label><br>
            <input type="date" id="task_startdate" name="task_startdate" required>
        </div>
        
        <div class="form-group">
            <label for="task_enddate">마감일:</label><br>
            <input type="date" id="task_enddate" name="task_enddate" required>
        </div>
        
        <div class="form-group">
            <label for="task_status">프로젝트 상태:</label>
            <select id="task_status" name="task_status" required>
                <option value="">선택하세요</option>
                <option value="예정">예정</option>
                <option value="진행중">진행중</option>
                <option value="완료">완료</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="task_desc">프로젝트 중요도:</label>
            <select id="task_desc" name="task_desc" required>
                <option value="">선택하세요</option>
                <option value="낮음">낮음</option>
                <option value="보통">보통</option>
                <option value="중요">중요</option>
                <option value="긴급">긴급</option>
            </select>
        </div>
        
        <button type="submit">제출</button>
    </form>


                <select id="minTask" onchange="showTask()">
                    <option selected value="0">Task 1</option>
                    <option value="1">Task 2</option>
                    <option value="2">Task 3</option>
                    <option value="3">Task 4</option>
                </select>

                <select id="maxTask" onchange="showTask()">
                    <option value="4">Task 5</option>
                    <option value="5">Task 6</option>
                    <option value="6">Task 7</option>
                    <option selected value="7">Task 8</option>
                </select>
            </div>
            
        </div>
    </div>
</div>
    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>

    <script>
      const colours = [
        "rgba(255 ,26, 104, 1)",
        "rgba(255,159,64,1)",
        "rgba(75,192,192,1)",
      ];

      // setup
  const data = {
    
    datasets: [
        {
            label: "Tasks",
            data: [
            	<c:set var="taskCounter" value="0" />
                    <c:forEach var="task" items="${taskList}" varStatus="status">
                        <c:if test="${task.task_title eq '인인인'}">
                        <c:set var="taskCounter" value="${taskCounter + 1}" />
                        {
                            x: [
                                "<fmt:formatDate value="${task.task_startdate}" pattern="yyyy-MM-dd"/>",
                                "<fmt:formatDate value="${task.task_enddate}" pattern="yyyy-MM-dd"/>"
                            ],
                            y: "Task ${taskCounter}",
                            name: "${task.task_title}",
                            status: <c:choose>
                                        <c:when test="${task.task_status eq '완료'}">2</c:when>
                                        <c:when test="${task.task_status eq '진행중'}">1</c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                        }<c:if test="${!status.last}">,</c:if>
                        </c:if>
                    </c:forEach>
            ],
            backgroundColor: (ctx) => {
                return colours[ctx.raw.status];
            },
            borderSkipped: false,
            borderRadius: 10,
            barPercentage: 0.5,
        },
    ],
};
      // todayLine plugin block
      const todayLine = {
        id: "todayLine",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            data,
            chartArea: { top, bottom, left, right },
            scales: { x, y },
          } = chart;

          ctx.save();

          if (
            x.getPixelForValue(new Date()) >= left &&
            x.getPixelForValue(new Date()) <= right
          ) {
            ctx.beginPath();
            ctx.lindWidth = 3;
            ctx.strokeStyle = "rgba(102,102,102,1)";
            ctx.setLineDash([6, 6]);
            ctx.moveTo(x.getPixelForValue(new Date()), top);
            ctx.moveTo(x.getPixelForValue(new Date()), bottom);
            ctx.stroke();
            ctx.restore();

            ctx.setLineDash([]);

            ctx.beginPath();
            ctx.lindWidth = 1;
            ctx.strokeStyle = "rgba(102,102,102,1)";
            ctx.fillStyle = "rgba(102,102,102,1)";
            ctx.moveTo(x.getPixelForValue(new Date()), top + 3);
            ctx.lineTo(x.getPixelForValue(new Date()) - 6, top - 6);
            ctx.lineTo(x.getPixelForValue(new Date()) + 6, top - 6);
            ctx.closePath();
            ctx.stroke();
            ctx.fill();

            ctx.font = "bold 12px sans-serif";
            ctx.fillStyle = "rgba(102,102,102,1)";
            ctx.texAlign = "center";
            ctx.fillText("Today", x.getPixelForValue(new Date()), bottom + 15);
          }
        },
      };

      // status plugin block

      const status = {
        id: "status",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            options,
            data,
            chartArea: { top, bottom, left, right },
            scales: { x, y },
          } = chart;
          const icons = ['\uf00d', '\uf110', '\uf00c']; // 아이콘
          const angle = Math.PI / 180;
          const paddingRight = options.layout.padding.right;

          ctx.save();
          ctx.font = "bolder 12px FontAwesome";
          ctx.fillStyle = "black";
          ctx.textBaseline = "middle";
          ctx.texAlign = "center";
          data.datasets[0].data.forEach((datapoint, index) => {
            if (
              y.getPixelForValue(index) > top &&
              y.getPixelForValue(index) < bottom
            ) {
              ctx.beginPath();
              ctx.fillStyle = colours[datapoint.status];
              ctx.arc(
                right + paddingRight / 2,
                y.getPixelForValue(index),
                12,
                0,
                angle * 360,
                false
              );
              ctx.closePath();
              ctx.fill();

              ctx.fillStyle = "white";
              ctx.fillText(
                icons[datapoint.status],
                right + paddingRight / 2.2,
                y.getPixelForValue(index)
              );
            }
          });
          ctx.font = "bolder 12px sans-serif";
          ctx.fillStyle = "black";
          ctx.fillText("Status", right + paddingRight / 2, top - 15);

          ctx.restore();
        },
      };

      // assignedTasks plugin block
      const assignedTasks = {
        id: "assignedTasks",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            data,
            chartArea: { top, bottom, left, right },
            scales: { x, y },
          } = chart;

          ctx.save();
          ctx.font = "bolder 12px sans-serif";
          ctx.fillStyle = "black";
          ctx.textBaseline = "middle";
          ctx.texAlign = "left";
          data.datasets[0].data.forEach((datapoint, index) => {
            ctx.fillText(datapoint.name, 10, y.getPixelForValue(index));
          });
          ctx.fillText("Name", 10, top - 15);
          ctx.restore();
        },
      };

      // weekend plugin block
      const weekend = {
        id: "weekend",
        beforeDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            chartArea: { top, bottom, left, right, width, height },
            scales: { x, y },
          } = chart;

          ctx.save();

          x.ticks.forEach((tick, index) => {
            const day = new Date(tick.value).getDay();
            console.log(day);
            if (day === 6 || day === 0) {
              ctx.fillStyle = pluginOptions.weekendColor;
              ctx.fillRect =
                (x.getPixelForValue(new Date(tick.value).setHours(24)) -
                  x.getPixelForValue(tick.value),
                height);
            }
          });
        },
      };

      // config
      const config = {
        type: "bar",
        data,
        options: {
          layout: {
            padding: {
              left: 100,
              right: 100,
              bottom: 20,
            },
          },
          indexAxis: "y",
          scales: {
            x: {
              position: "top",
              type: "time",
              time: {
                //unit: "day",
                displayFormats: {
                  day: "d",
                },
              },
              min: "2024-10-01",
              max: "2024-10-31",
            },
            y: {
              min: 3,
              max: 5,
              labels: [
                "Task 1",
                "Task 2",
                "Task 3",
                "Task 4",
                "Task 5",
                "Task 6",
                "Task 7",
                "Task 8",
                "Task 9",
              ],
            },
          },
          plugins: {
            weekend: {
              weekendColor: "rgba(102,102,102,0.2)",
            },
            legend: {
              display: false,
            },
            tooltip: {
              displayColors: false,
              yAlign: "bottom",
              callbacks: {
                label: (ctx) => {
                  return "";
                },
                title: (ctx) => {
                  const startDate = new Date(ctx[0].raw.x[0]);
                  const endDate = new Date(ctx[0].raw.x[1]);
                  const formattedStartDate = startDate.toLocaleDateString([], {
                    year: "numeric",
                    month: "short",
                    day: "numeric",
                  });
                  const formattedEndDate = startDate.toLocaleDateString([], {
                    year: "numeric",
                    month: "short",
                    day: "numeric",
                  });
                  return [
                    ctx[0].raw.name,
                    `Task Deadline : ${formattedStartDate} - ${formattedEndDate}`,
                  ];
                },
              },
            },
          },
        },
        plugins: [todayLine, assignedTasks, status, weekend],
      };

      // render init block
      const myChart = new Chart(document.getElementById("myChart"), config);
	
      function addTask() {
          const nameTask = document.getElementById("nameTask");
          const startDateTask = document.getElementById("startDateTask");
          const endDateTask = document.getElementById("endDateTask");
          const teamMemberTask = document.getElementById("teamMemberTask");
          const statusTask = document.getElementById("statusTask");

          const arrayLength = myChart.data.datasets[0].data.length;
          myChart.data.datasets[0].data.push({
            // Use push to add new data
            x: [startDateTask.value, endDateTask.value],
            y: nameTask.value,
            name: teamMemberTask.value,
            status: parseInt(statusTask.value),
          });

          addNames();
          myChart.update();

          // const arrayLength = myChart.data.datasets[0].data.length;
          // myChart.data.datasets[0].data[arrayLength]({x: [startDateTask.value,endDateTask.value], y:nameTask.value, name: teamMemberTask.value, status: parseInt(statusTask.value)});
          // console.log(myChart.data.datasets);
          // myChart.update();
        }
      function addNames() {
          const names = document.getElementById("names");

          console.log(names.firstElementChild);
          while (names.firstElementChild) {
            names.removeChild(names.firstElementChild);
          }

          const namesArray = myChart.data.datasets[0].data.map((datapoint) => {
            return datapoint.name;
          });

          const namesArrayFilter = [...new Set(namesArray)];

          namesArray.forEach((memberName) => {
            const option = document.createElement("option");
            option.value = memberName;
            names.appendChild(option);
          });
        }
        addNames();
        
       
      function showTask() {
        const yScale = myChart.config.options.scales.y;
        const minTask = document.getElementById("minTask").value;
        const maxTask = document.getElementById("maxTask").value;
        yScale.min = yScale.labels[minTask];
        yScale.max = yScale.labels[maxTask];
        myChart.update();
      }
    </script>
  
<!-- 간트차트 끝 -->
</main>

<div class="fixed-plugin">
  <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
    <i class="bi bi-chat"></i>
  </a>
  <div class="card shadow-lg">
    <div class="card-header pb-0 pt-3">
      <div class="float-start">
        <h5 class="mt-3 mb-0">Argon Configurator</h5>
        <p>See our dashboard options.</p>
      </div>
      <div class="float-end mt-4">
        <button
                class="btn btn-link text-dark p-0 fixed-plugin-close-button"
        >
          <i class="fa fa-close"></i>
        </button>
      </div>
      <!-- End Toggle Button -->
    </div>
    <hr class="horizontal dark my-1" />
    <div class="card-body pt-sm-3 pt-0 overflow-auto">
      <!-- Sidebar Backgrounds -->
      <div>
        <h6 class="mb-0">Sidebar Colors</h6>
      </div>
      <a href="javascript:void(0)" class="switch-trigger background-color">
        <div class="badge-colors my-2 text-start">
              <span
                      class="badge filter bg-gradient-primary active"
                      data-color="primary"
                      onclick="sidebarColor(this)"
              ></span>
          <span
                  class="badge filter bg-gradient-dark"
                  data-color="dark"
                  onclick="sidebarColor(this)"
          ></span>
          <span
                  class="badge filter bg-gradient-info"
                  data-color="info"
                  onclick="sidebarColor(this)"
          ></span>
          <span
                  class="badge filter bg-gradient-success"
                  data-color="success"
                  onclick="sidebarColor(this)"
          ></span>
          <span
                  class="badge filter bg-gradient-warning"
                  data-color="warning"
                  onclick="sidebarColor(this)"
          ></span>
          <span
                  class="badge filter bg-gradient-danger"
                  data-color="danger"
                  onclick="sidebarColor(this)"
          ></span>
        </div>
      </a>
      <!-- Sidenav Type -->
      <div class="mt-3">
        <h6 class="mb-0">Sidenav Type</h6>
        <p class="text-sm">Choose between 2 different sidenav types.</p>
      </div>
      <div class="d-flex">
        <button
                class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2"
                data-class="bg-white"
                onclick="sidebarType(this)"
        >
          White
        </button>
        <button
                class="btn bg-gradient-primary w-100 px-3 mb-2"
                data-class="bg-default"
                onclick="sidebarType(this)"
        >
          Dark
        </button>
      </div>
      <p class="text-sm d-xl-none d-block mt-2">
        You can change the sidenav type just on desktop view.
      </p>
      <!-- Navbar Fixed -->
      <div class="d-flex my-3">
        <h6 class="mb-0">Navbar Fixed</h6>
        <div class="form-check form-switch ps-0 ms-auto my-auto">
          <input
                  class="form-check-input mt-1 ms-auto"
                  type="checkbox"
                  id="navbarFixed"
                  onclick="navbarFixed(this)"
          />
        </div>
      </div>
      <hr class="horizontal dark my-sm-4" />
      <div class="mt-2 mb-5 d-flex">
        <h6 class="mb-0">Light / Dark</h6>
        <div class="form-check form-switch ps-0 ms-auto my-auto">
          <input
                  class="form-check-input mt-1 ms-auto"
                  type="checkbox"
                  id="dark-version"
                  onclick="darkMode(this)"
          />
        </div>
      </div>
      <a
              class="btn bg-gradient-dark w-100"
              href="https://www.creative-tim.com/product/argon-dashboard"
      >Free Download</a
      >
      <a
              class="btn btn-outline-dark w-100"
              href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard"
      >View documentation</a
      >
      <div class="w-100 text-center">
        <a
                class="github-button"
                href="https://github.com/creativetimofficial/argon-dashboard"
                data-icon="octicon-star"
                data-size="large"
                data-show-count="true"
                aria-label="Star creativetimofficial/argon-dashboard on GitHub"
        >Star</a
        >
        <h6 class="mt-3">Thank you for sharing!</h6>
        <a
                href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard"
                class="btn btn-dark mb-0 me-2"
                target="_blank"
        >
          <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
        </a>
        <a
                href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/argon-dashboard"
                class="btn btn-dark mb-0 me-2"
                target="_blank"
        >
          <i class="fab fa-facebook-square me-1" aria-hidden="true"></i>
          Share
        </a>
      </div>
    </div>
  </div>
</div>
<!--   Core JS Files   -->
<script src="./assets/js/core/popper.min.js"></script>
<script src="./assets/js/core/bootstrap.min.js"></script>
<script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
<script src="./assets/js/plugins/chartjs.min.js"></script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>
</html>
