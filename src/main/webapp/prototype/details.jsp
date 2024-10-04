<%@ page contentType="text/html;charset=UTF-8" %>
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
		margin: 0; /* 마진 제거 */
		padding: 0; /*패딩 제거 */
		font-family: sans-serif; /* 글꼴 설정 */
	}
	.chartMenu {
		width: 100vw; /*너비 100vw*/
		height: 80px; /* 높이 80 px*/
		color: rgba(54, 162, 235, 1); /* 텍스트 색상설정 */
	}
	/*차트 메뉴 내 단락 스타일 */
	.chartMenu p {
		padding: 10px; /*패딩 추가 */
		font-size: 20px; /*글꼴 크기 설정 */
	}
	/* 차트 카드 스타일 */
	.chartCard {
		margin-left: -1rem; /* 카드 왼쪽 여백 조정 */
		width: calc(100% + 15rem); /* 너비를 동적으로 조정 */
		max-width: 80%; /* 최대 너비 80%로 설정 */
		height: 60vh; /* 차트 높이를 뷰포트 높이의 60%로 설정 */
		overflow: hidden; /* 콘텐츠가 넘칠 경우 숨기기 */
		transform: scale(0.9); /* 차트 크기 90%로 축소 */
	}
	/* 차트 박스 스타일 */
	.chartBox {
		width: 80%; /* 너비 80% */
		padding: 0px; /* 패딩 0으로 설정 */
		border-radius: 20px; /* 둥근 모서리 설정 */
		border: solid 3px rgba(255, 0, 0, 0); /* 투명한 테두리 설정 */
		background: white; /* 배경색 흰색 */
	}
	/* 작업(Task) 스타일 */
	.Task {
		max-width: 20%; /* 최대 너비 20%로 설정 */
		margin-top: 50px; /* 상단 여백 50px */
		font-size: 15px; /* 글꼴 크기 설정 */
	}
	/* 작업(Task) 내부의 입력, 선택, 버튼 스타일 */
	.Task input, .Task select, .Task button {
		width: 70%; /* 입력, 선택, 버튼의 너비 70%로 설정 */
		margin-bottom: 10px; /* 요소 간의 하단 여백 추가 */
		padding: 8px; /* 패딩 추가하여 터치 영역 개선 */
		box-sizing: border-box; /* 패딩이 너비에 영향을 주지 않도록 설정 */
	}
</style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
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
	<!-- 카드 컴포넌트 시작 -->
    <div style="margin-left: 3rem" class="card"> 
        <div class="row">
        	<!-- 차트 영역 -->
            <div class="chartCard"> 
                <canvas id="myChart"></canvas> <!-- 차트를 그리기 위한 캔버스 -->
            </div>
            <!-- 작업(Task) 입력 영역 -->
            <div class="Task">
            	<!-- 월 선택기: 월이 변경될 때 차트 필터링 -->
                <input type="month" onchange="chartFilter(this)" /><br>
                <!-- 작업 이름 입력 -->
                <input type="text" id="nameTask" placeholder="Task Name" /><br>
                <!-- 작업 시작일 입력 -->
                <input type="date" id="startDateTask" /><br>
                <!-- 작업 종료일 입력 -->
                <input type="date" id="endDateTask" /><br>
                <!-- 팀원 선택: 데이터 리스트를 사용하여 자동 완성 기능 제공 -->
                <input type="text" id="teamMemberTask" list="names" placeholder="Team Member" /><br>
                <!-- 팀원 이름을 제공하는 데이터 리스트 -->
                <datalist id="names"></datalist>

				<!-- 작업 상태 선택 -->
                <select id="statusTask">
                    <option value="0">Delayed</option> <!-- 지연 상태 -->
                    <option value="1">Pending</option> <!-- 보류 상태 -->
                    <option value="2">Complete</option> <!-- 완료 상태 -->
                </select><br>
                
                <!-- 작업 추가 버튼: 클릭 시 addTask 함수 호출 -->
                <button onclick="addTask()">View Task</button><br>

				<!-- 최소 작업 선택: 변경 시 showTask 함수 호출 -->
                <select id="minTask" onchange="showTask()">
                    <option selected value="0">Task 1</option>
                    <option value="1">Task 2</option>
                    <option value="2">Task 3</option>
                    <option value="3">Task 4</option>
                </select>

				<!-- 최대 작업 선택: 변경 시 showTask 함수 호출 -->
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
<!-- Chart.js 라이브러리 로드 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
<!-- Chart.js Date FNS 어댑터 로드 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
<!-- 사용자 정의 스크립트 로드 -->
<script src="assets/js/gantt.js"></script>

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
<script>
  var ctx1 = document.getElementById("chart-line").getContext("2d");

  var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

  gradientStroke1.addColorStop(1, "rgba(94, 114, 228, 0.2)");
  gradientStroke1.addColorStop(0.2, "rgba(94, 114, 228, 0.0)");
  gradientStroke1.addColorStop(0, "rgba(94, 114, 228, 0)");
  new Chart(ctx1, {
    type: "line",
    data: {
      labels: [
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ],
      datasets: [
        {
          label: "Mobile apps",
          tension: 0.4,
          borderWidth: 0,
          pointRadius: 0,
          borderColor: "#5e72e4",
          backgroundColor: gradientStroke1,
          borderWidth: 3,
          fill: true,
          data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
          maxBarThickness: 6,
        },
      ],
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false,
        },
      },
      interaction: {
        intersect: false,
        mode: "index",
      },
      scales: {
        y: {
          grid: {
            drawBorder: false,
            display: true,
            drawOnChartArea: true,
            drawTicks: false,
            borderDash: [5, 5],
          },
          ticks: {
            display: true,
            padding: 10,
            color: "#fbfbfb",
            font: {
              size: 11,
              family: "Open Sans",
              style: "normal",
              lineHeight: 2,
            },
          },
        },
        x: {
          grid: {
            drawBorder: false,
            display: false,
            drawOnChartArea: false,
            drawTicks: false,
            borderDash: [5, 5],
          },
          ticks: {
            display: true,
            color: "#ccc",
            padding: 20,
            font: {
              size: 11,
              family: "Open Sans",
              style: "normal",
              lineHeight: 2,
            },
          },
        },
      },
    },
  });
</script>

<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
<script>
  function createChart(e) {
    const days = document.querySelectorAll(".chart-values li");
    const tasks = document.querySelectorAll(".chart-bars li");
    const daysArray = [...days];

    tasks.forEach((el) => {
      const duration = el.dataset.duration.split("-");
      const startDay = duration[0];
      const endDay = duration[1];
      let left = 0,
              width = 0;

      if (startDay.endsWith("½")) {
        const filteredArray = daysArray.filter(
                (day) => day.textContent == startDay.slice(0, -1)
        );
        left =
                filteredArray[0].offsetLeft + filteredArray[0].offsetWidth / 2;
      } else {
        const filteredArray = daysArray.filter(
                (day) => day.textContent == startDay
        );
        left = filteredArray[0].offsetLeft;
      }

      if (endDay.endsWith("½")) {
        const filteredArray = daysArray.filter(
                (day) => day.textContent == endDay.slice(0, -1)
        );
        width =
                filteredArray[0].offsetLeft +
                filteredArray[0].offsetWidth / 2 -
                left;
      } else {
        const filteredArray = daysArray.filter(
                (day) => day.textContent == endDay
        );
        width =
                filteredArray[0].offsetLeft + filteredArray[0].offsetWidth - left;
      }

      // apply css
      el.style.left = `${left}px`;
      el.style.width = `${width}px`;
      if (e.type == "load") {
        el.style.backgroundColor = el.dataset.color;
        el.style.opacity = 1;
      }
    });
  }

  window.addEventListener("load", createChart);
  window.addEventListener("resize", createChart);

  const toggleItems = document.querySelectorAll(".toggle-item");

  toggleItems.forEach((item) => {
    item.addEventListener("click", () => {
      const ul = item.nextElementSibling;
      if (ul.style.display === "none") {
        ul.style.display = "block";
      } else {
        ul.style.display = "none";
      }
    });
  });
</script>
</body>
</html>
