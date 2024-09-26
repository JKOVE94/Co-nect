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

<%@ page contentType="text/html;charset=UTF-8" %>
  <html lang="kor">
  <a class="nav-link" href="${pageContext.request.contextPath}/manage?fn=ADMIN_USERSET">테스트</a>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/asset/2_dashboard/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/asset/2_dashboard/img/favicon.png">
    <title>
      Argon Dashboard 2 by Creative Tim
    </title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <!-- Nucleo Icons -->
    <link href="${pageContext.request.contextPath}/asset/2_dashboard/css/nucleo-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="${pageContext.request.contextPath}/asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link id="pagestyle" href="${pageContext.request.contextPath}/asset/2_dashboard/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  </head>

  <body class="g-sidenav-show   bg-gray-100">

    <div class="min-height-300 bg-primary position-absolute w-100"></div>
    <aside
      class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
      id="sidenav-main">
      <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
          aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html "
          target="_blank">
          <img src="${pageContext.request.contextPath}/asset/2_dashboard/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
          <span class="ms-1 font-weight-bold">Argon Dashboard 2</span>
        </a>
      </div>
      <hr class="horizontal dark mt-0">
      <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="./pages/dashboard.html">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="/main/dashboard?fn=FREE_LIST">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">자유게시판</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="./pages/billing.html">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Billing</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="./pages/virtual-reality.html">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-app text-info text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Virtual Reality</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">RTL</span>
            </a>
          </li>
          <li class="nav-item mt-3">
            <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account pages</h6>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Profile</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/dashboard?fn=JOIN">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-single-copy-04 text-warning text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Sign In</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-collection text-info text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Sign Up</span>
            </a>
          </li>
        </ul>
      </div>
    </aside>
    <main class="main-content position-relative border-radius-lg ">
      <!-- Navbar -->
      <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur"
        data-scroll="false">
        <div class="container-fluid py-1 px-3">
          <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
            <div class="ms-md-auto pe-md-3 d-flex align-items-center">
              <div class="input-group">
                <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                <input type="text" class="form-control" placeholder="Type here...">
              </div>
            </div>
            <ul class="navbar-nav  justify-content-end">
              <li class="nav-item d-flex align-items-center">
                <a href="javascript:;" class="nav-link text-white font-weight-bold px-0">
                  <i class="fa fa-user me-sm-1"></i>
                  <span class="d-sm-inline d-none">Sign In</span>
                </a>
              </li>
              <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                  <div class="sidenav-toggler-inner">
                    <i class="sidenav-toggler-line bg-white"></i>
                    <i class="sidenav-toggler-line bg-white"></i>
                    <i class="sidenav-toggler-line bg-white"></i>
                  </div>
                </a>
              </li>
              <li class="nav-item px-3 d-flex align-items-center">
                <a href="javascript:;" class="nav-link text-white p-0">
                  <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
                </a>
              </li>
              <li class="nav-item dropdown pe-2 d-flex align-items-center">
                <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <i class="fa fa-bell cursor-pointer"></i>
                </a>
                <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                  <li class="mb-2">
                    <a class="dropdown-item border-radius-md" href="javascript:;">
                      <div class="d-flex py-1">
                        <div class="my-auto">
                          <img src="${pageContext.request.contextPath}/asset/2_dashboard/img/team-2.jpg" class="avatar avatar-sm  me-3 ">
                        </div>
                        <div class="d-flex flex-column justify-content-center">
                          <h6 class="text-sm font-weight-normal mb-1">
                            <span class="font-weight-bold">New message</span> from Laur
                          </h6>
                          <p class="text-xs text-secondary mb-0">
                            <i class="fa fa-clock me-1"></i>
                            13 minutes ago
                          </p>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li class="mb-2">
                    <a class="dropdown-item border-radius-md" href="javascript:;">
                      <div class="d-flex py-1">
                        <div class="my-auto">
                          <img src="${pageContext.request.contextPath}/asset/2_dashboard/img/small-logos/logo-spotify.svg"
                            class="avatar avatar-sm bg-gradient-dark  me-3 ">
                        </div>
                        <div class="d-flex flex-column justify-content-center">
                          <h6 class="text-sm font-weight-normal mb-1">
                            <span class="font-weight-bold">New album</span> by Travis Scott
                          </h6>
                          <p class="text-xs text-secondary mb-0">
                            <i class="fa fa-clock me-1"></i>
                            1 day
                          </p>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item border-radius-md" href="javascript:;">
                      <div class="d-flex py-1">
                        <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                          <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1"
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <title>credit-card</title>
                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                              <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                                <g transform="translate(1716.000000, 291.000000)">
                                  <g transform="translate(453.000000, 454.000000)">
                                    <path class="color-background"
                                      d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z"
                                      opacity="0.593633743"></path>
                                    <path class="color-background"
                                      d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z">
                                    </path>
                                  </g>
                                </g>
                              </g>
                            </g>
                          </svg>
                        </div>
                        <div class="d-flex flex-column justify-content-center">
                          <h6 class="text-sm font-weight-normal mb-1">
                            Payment successfully completed
                          </h6>
                          <p class="text-xs text-secondary mb-0">
                            <i class="fa fa-clock me-1"></i>
                            2 days
                          </p>
                        </div>
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->

      <div class="container-fluid py-4">
        <div class="row">
          <div class="col-12 px-0">
            <div class="card">
              <div class="card-body p-3">
                <div class="row mx-0">
                  <!-- 프로젝트 번호 -->
                  <div class="col-md-2 px-2"> <!-- 너비 감소 -->
                    <div class="numbers">
                      <p class="text-sm mb-0 text-uppercase font-weight-bold">프로젝트 번호</p>
                      <h5 class="font-weight-bolder">PJ-2024-001</h5>
                      <p class="mb-0">
                        <span class="text-success text-sm font-weight-bolder">등록일:</span>
                        2024-01-15
                      </p>
                    </div>
                  </div>

                  <!-- 프로젝트 제목 -->
                  <div class="col-md-4 px-2"> <!-- 너비 증가 -->
                    <div class="numbers">
                      <p class="text-sm mb-0 text-uppercase font-weight-bold">프로젝트 제목</p>
                      <h5 class="font-weight-bolder mb-2">네비게이션 시스템 개발</h5>
                      <p class="mb-0">
                        <span class="text-success text-sm font-weight-bolder">상태:</span>
                        진행 중
                      </p>
                    </div>
                  </div>

                  <!-- 담당자, 마감일자, 진행도 -->
                  <div class="col-md-6 px-2">
                    <div class="row mx-0">
                      <div class="col-md-4 px-1">
                        <div class="numbers">
                          <p class="text-sm mb-0 text-uppercase font-weight-bold">담당자</p>
                          <h5 class="font-weight-bolder">홍길동</h5>
                          <p class="mb-0">
                            <span class="text-success text-sm font-weight-bolder">직책:</span>
                            프로젝트 매니저
                          </p>
                        </div>
                      </div>
                      <div class="col-md-4 px-1"> <!-- 마감일자 섹션 너비 유지 -->
                        <div class="numbers">
                          <p class="text-sm mb-0 text-uppercase font-weight-bold">마감일자</p>
                          <h5 class="font-weight-bolder">2024년 12월 31일</h5>
                          <p class="mb-0">
                            <span class="text-warning text-sm font-weight-bolder">남은 기간:</span>
                            100일
                          </p>
                        </div>
                      </div>
                      <div class="col-md-4 px-1">
                        <div class="numbers">
                          <p class="text-sm mb-0 text-uppercase font-weight-bold">진행도</p>
                          <h5 class="font-weight-bolder">75%</h5>
                          <p class="mb-0">
                            <span class="text-primary text-sm font-weight-bolder">상태:</span>
                            정상 진행 중
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>



        <div class="row mt-4">
          <div class="col-lg-7 mb-lg-0 mb-4">

            <!-- 게시판 -->

            <div class="card" style="height: 60%;">
              <div class="card-header pb-0 p-3">
                <h6 class="mb-0 text-center">게시판</h6>
              </div>
              <div class="card-body p-3">
                <ul class="list-group">
                  <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                    <div class="d-flex align-items-center">
                      <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                        <i class="ni ni-notification-70 text-white opacity-10"></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">공지사항</h6>
                        <span class="text-xs">2024년 9월 회식 안내</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-10
                      <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i
                          class="ni ni-bold-right" aria-hidden="true"></i></button>
                    </div>
                  </li>
                  <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                    <div class="d-flex align-items-center">
                      <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                        <i class="ni ni-calendar-grid-58 text-white opacity-10"></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">일정 공유</h6>
                        <span class="text-xs">프로젝트 중간 발표 일정</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-08
                      <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i
                          class="ni ni-bold-right" aria-hidden="true"></i></button>
                    </div>
                  </li>
                  <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                    <div class="d-flex align-items-center">
                      <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                        <i class="ni ni-single-copy-04 text-white opacity-10"></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">회의록</h6>
                        <span class="text-xs">9월 첫째 주 팀 미팅 회의록</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-05
                      <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i
                          class="ni ni-bold-right" aria-hidden="true"></i></button>
                    </div>
                  </li>
                  <li class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
                    <div class="d-flex align-items-center">
                      <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                        <i class="ni ni-satisfied text-white opacity-10"></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">자유게시판</h6>
                        <span class="text-xs">주말 등산 모임 안내</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-03
                      <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i
                          class="ni ni-bold-right" aria-hidden="true"></i></button>
                    </div>
                  </li>
                </ul>
              </div>
            </div>


            <!-- 게시판 끝 -->

            <hr>

            <!-- 아코디언 게시판-->

            <div class="card">
              <div class="card-header pb-0 p-3">
                <div class="d-flex justify-content-between align-items-center">
                  <h6 class="mb-0">게시판</h6>
                  <button class="btn btn-link text-dark p-0 m-0" type="button" data-bs-toggle="collapse"
                    data-bs-target="#boardCollapse" aria-expanded="false" aria-controls="boardCollapse">
                    <i class="fas fa-chevron-down"></i>
                  </button>
                </div>
              </div>
              <div class="collapse show" id="boardCollapse">
                <div class="card-body p-3">
                  <ul class="list-group">
                    <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                      <div class="d-flex align-items-center">
                        <div class="icon icon-shape icon-sm me-3 bg-gradient-primary shadow text-center">
                          <i class="ni ni-notification-70 text-white opacity-10"></i>
                        </div>
                        <div class="d-flex flex-column">
                          <h6 class="mb-1 text-dark text-sm">2024년 9월 회식 안내</h6>
                          <span class="text-xs text-secondary">공지사항</span>
                        </div>
                      </div>
                      <div class="d-flex align-items-center text-sm">
                        <span class="me-2">2024-09-10</span>
                        <button class="btn btn-link text-dark p-0 m-0" onclick="showPostDetails('post1')">
                          <i class="fas fa-arrow-right text-xs"></i>
                        </button>
                      </div>
                    </li>
                    <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                      <div class="d-flex align-items-center">
                        <div class="icon icon-shape icon-sm me-3 bg-gradient-info shadow text-center">
                          <i class="ni ni-calendar-grid-58 text-white opacity-10"></i>
                        </div>
                        <div class="d-flex flex-column">
                          <h6 class="mb-1 text-dark text-sm">프로젝트 중간 발표 일정</h6>
                          <span class="text-xs text-secondary">일정 공유</span>
                        </div>
                      </div>
                      <div class="d-flex align-items-center text-sm">
                        <span class="me-2">2024-09-08</span>
                        <button class="btn btn-link text-dark p-0 m-0" onclick="showPostDetails('post2')">
                          <i class="fas fa-arrow-right text-xs"></i>
                        </button>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>


            <!-- 아코디언 게시판 끝 -->

            <!-- 이번주 나의 업무 -->


          </div>
          <div class="col-lg-5">

            <div class="card" style="height: 60%;">
              <div class="card-header pb-0 p-3">
                <div class="d-flex justify-content-center">
                  <h6 class="mb-2 text-center">이번 주 나의 업무</h6>
                </div>
              </div>
              <div class="card-body p-3" style="max-height: calc(100vh - 200px); overflow-y: auto;">
                <div class="table-responsive">
                  <table class="table align-items-center">
                    <tbody>
                      <tr>
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
                      <tr>
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
                        <td>W
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
                      <tr>
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
                      <tr>
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
                      <tr>
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
                      <tr>
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
                      <tr>
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
                      <tr>
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
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <!-- 업무 -->

            <div></div>
            <hr>

            <div class="card">
              <div class="card-header pb-0 p-3">
                <h6 class="mb-0 text-center">프로젝트</h6>
              </div>
              <div class="card-body p-3">
                <div class="table-responsive">
                  <table class="table align-items-center mb-0">
                    <thead>
                      <tr>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">프로젝트</th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">마감일</th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">상태
                        </th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">진행도
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div class="d-flex flex-column justify-content-center">
                              <h6 class="mb-0 text-sm">팀프로젝트</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">2024-09-21</p>
                        </td>
                        <td class="align-middle text-center text-sm">
                          <span class="badge badge-sm bg-gradient-success">진행 중</span>
                        </td>
                        <td class="align-middle text-center">
                          <div class="d-flex align-items-center justify-content-center">
                            <span class="me-2 text-xs font-weight-bold">60%</span>
                            <div>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="60"
                                  aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                              </div>
                            </div>
                          </div>
                        </td>
                      </tr>
                      <!-- 나머지 프로젝트들에 대해 위와 같은 구조로 반복 -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

          </div>
        </div>


        <footer class="footer pt-3  ">
          <div class="container-fluid">
            <div class="row align-items-center justify-content-lg-between">
              <div class="col-lg-6 mb-lg-0 mb-4">

              </div>
              <div class="col-lg-6">
                <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                  <li class="nav-item">
                    <a href="" class="nav-link text-muted" target="_blank">2team</a>
                  </li>
                  <li class="nav-item">
                    <a href="" class="nav-link text-muted" target="_blank">About Us</a>
                  </li>
                  <li class="nav-item">
                    <a href="" class="nav-link text-muted" target="_blank">Githup</a>
                  </li>
                  <li class="nav-item">
                    <a href="" class="nav-link pe-0 text-muted" target="_blank">License</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </main>
    <div class="fixed-plugin">
      <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
        <i class="bi bi-chat"></i>
      </a>
      <div class="card shadow-lg">
        <div class="card-header pb-0 pt-3 ">
          <div class="float-start">
            <h5 class="mt-3 mb-0">Argon Configurator</h5>
            <p>See our dashboard options.</p>
          </div>
          <div class="float-end mt-4">
            <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
              <i class="fa fa-close"></i>
            </button>
          </div>
          <!-- End Toggle Button -->
        </div>
        <hr class="horizontal dark my-1">
        <div class="card-body pt-sm-3 pt-0 overflow-auto">
          <!-- Sidebar Backgrounds -->
          <div>
            <h6 class="mb-0">Sidebar Colors</h6>
          </div>
          <a href="javascript:void(0)" class="switch-trigger background-color">
            <div class="badge-colors my-2 text-start">
              <span class="badge filter bg-gradient-primary active" data-color="primary"
                onclick="sidebarColor(this)"></span>
              <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
              <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
              <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
              <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
              <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
            </div>
          </a>
          <!-- Sidenav Type -->
          <div class="mt-3">
            <h6 class="mb-0">Sidenav Type</h6>
            <p class="text-sm">Choose between 2 different sidenav types.</p>
          </div>
          <div class="d-flex">
            <button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2" data-class="bg-white"
              onclick="sidebarType(this)">White</button>
            <button class="btn bg-gradient-primary w-100 px-3 mb-2" data-class="bg-default"
              onclick="sidebarType(this)">Dark</button>
          </div>
          <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
          <!-- Navbar Fixed -->
          <div class="d-flex my-3">
            <h6 class="mb-0">Navbar Fixed</h6>
            <div class="form-check form-switch ps-0 ms-auto my-auto">
              <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
            </div>
          </div>
          <hr class="horizontal dark my-sm-4">
          <div class="mt-2 mb-5 d-flex">
            <h6 class="mb-0">Light / Dark</h6>
            <div class="form-check form-switch ps-0 ms-auto my-auto">
              <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
            </div>
          </div>
          <a class="btn bg-gradient-dark w-100" href="https://www.creative-tim.com/product/argon-dashboard">Free
            Download</a>
          <a class="btn btn-outline-dark w-100"
            href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard">View documentation</a>
          <div class="w-100 text-center">
            <a class="github-button" href="https://github.com/creativetimofficial/argon-dashboard"
              data-icon="octicon-star" data-size="large" data-show-count="true"
              aria-label="Star creativetimofficial/argon-dashboard on GitHub">Star</a>
            <h6 class="mt-3">Thank you for sharing!</h6>
            <a href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard"
              class="btn btn-dark mb-0 me-2" target="_blank">
              <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
            </a>
            <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/argon-dashboard"
              class="btn btn-dark mb-0 me-2" target="_blank">
              <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
            </a>
          </div>
        </div>
      </div>
    </div>
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/asset/2_dashboard/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/2_dashboard/js/core/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/2_dashboard/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/2_dashboard/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/2_dashboard/js/plugins/chartjs.min.js"></script>
    <script>
      var ctx1 = document.getElementById("chart-line").getContext("2d");

      var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

      gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
      gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
      gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
      new Chart(ctx1, {
        type: "line",
        data: {
          labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
          datasets: [{
            label: "Mobile apps",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#5e72e4",
            backgroundColor: gradientStroke1,
            borderWidth: 3,
            fill: true,
            data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
            maxBarThickness: 6

          }],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              display: false,
            }
          },
          interaction: {
            intersect: false,
            mode: 'index',
          },
          scales: {
            y: {
              grid: {
                drawBorder: false,
                display: true,
                drawOnChartArea: true,
                drawTicks: false,
                borderDash: [5, 5]
              },
              ticks: {
                display: true,
                padding: 10,
                color: '#fbfbfb',
                font: {
                  size: 11,
                  family: "Open Sans",
                  style: 'normal',
                  lineHeight: 2
                },
              }
            },
            x: {
              grid: {
                drawBorder: false,
                display: false,
                drawOnChartArea: false,
                drawTicks: false,
                borderDash: [5, 5]
              },
              ticks: {
                display: true,
                color: '#ccc',
                padding: 20,
                font: {
                  size: 11,
                  family: "Open Sans",
                  style: 'normal',
                  lineHeight: 2
                },
              }
            },
          },
        },
      });
    </script>
    <script>
      var win = navigator.platform.indexOf('Win') > -1;
      if (win && document.querySelector('#sidenav-scrollbar')) {
        var options = {
          damping: '0.5'
        }
        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
      }

      const content = document.querySelector('.accordion-content');
      const height = content.scrollHeight;

      content.style.height = '0px';
      content.style.transition = 'height 0.3s ease-out';

      // 열 때
      content.style.height = height + 'px';

      // 닫을 때
      content.style.height = '0px';
    </script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/asset/2_dashboard/js/argon-dashboard.min.js?v=2.0.4"></script>


  </body>

  </html>