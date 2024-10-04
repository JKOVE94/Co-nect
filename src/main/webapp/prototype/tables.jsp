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
    <title>Argon Dashboard 2 by Creative Tim</title>
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
  </head>

  <body class="g-sidenav-show bg-gray-100">
    <div class="min-height-300 bg-primary position-absolute w-100"></div>

    <div class="sidenav-logo-container">
      <img src="../asset/1_landing/co-nect logo + text (w).svg" alt="Logo" class="sidenav-logo">
    </div>

    <aside
      class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl  fixed-start ms-4 "
      id="sidenav-main">
      <!-- 사이드바 제목(로고) -->
      <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
          aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="<%=request.getContextPath()%>/dashboard?fn=HOME">
          <img src="../asset/1_landing/co-nect logo + text (1E74B1).svg" class="navbar-brand-img h-100" alt="main_logo">
          <span class="ms-1 font-weight-bold">(주)코난2조</span>
        </a>
      </div>

      <!-- 사이드바 항목 -->
       <!-- 구분선 -->
      <hr class="horizontal dark mt-0"> 

      <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
        <!-- 사이드 바 하위 항목 시작 -->
        <ul class="navbar-nav">
          <!-- 1) 즐겨찾기 -->
          <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="collapse" 
            data-bs-target="#favorites-collapse" aria-expanded="false" id="resourceManager">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="bi bi-star text-primary text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">즐겨찾기</span>
            </a>

            <!-- 즐겨찾기 하위 메뉴 ( 프로젝트 ) -->
            <div class="collapse" id="favorites-collapse">
              <ul>
                  <li style="list-style: none; text-align: center;">
                    <a class="nav-link" href="Project.jsp">
                      프로젝트       
                    </a>
                  </li>
              </ul>
            </div>
          </li>
          
          <!-- 2) 프로젝트 -->
          <li class="nav-item">
            <a class="nav-link active" href="./virtual-reality.html" data-bs-toggle="collapse"
            data-bs-target="#project-collapse" aria-expanded="false" id="resourceManager">
            <div
            class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            <i class="ni ni-app text-info text-sm opacity-10"></i>
          </div>
          <span class="nav-link-text ms-1">프로젝트</span>
        </a>
        <!-- 프로젝트 하위 메뉴 -->
        <div class="collapse" id="project-collapse">
              <ul>
                <li style="list-style: none; text-align: center;">
                  <a class="nav-link" href="Project.jsp">
                    프로젝트 개요    
                  </a>
                </li>
              </ul>
            </div>
            
            <div class="collapse" id="project-collapse">
              <ul>
                <li style="list-style: none; text-align: center;">
                  <a class="nav-link" href="../WEB-INF/views/dashboard/project/projRead.jsp">
                    프로젝트 일정    
                  </a>
                </li>
              </ul>
            </div>          
          </li>
          
          <!-- 3) 게시판 -->
          <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="collapse"
            data-bs-target="#board-collapse" aria-expanded="false" id="resourceManager">
              <div
              class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
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
            <a class="nav-link active" data-bs-toggle="collapse"
              data-bs-target="#works-collapse" aria-expanded="false" id="resourceManager">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">업무 관리</span>
            </a>
              <!-- 업무관리 하위 메뉴 -->
            <div class="collapse" id="works-collapse">
              <ul>
                  <li style="list-style: none; text-align: center;">
                    <a class="nav-link">
                      일정 관리      
                    </a>
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
      <div style="margin-top: -8px;" class="container-fluid py-4">
        <div class="row">
          <div class="col-12">
            <div class="card mb-4">
              <div class="card-header pb-0 p-3">
                <h6 class="mb-0">게시판</h6>
              </div>
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                      >
                        제목
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                      >
                        카테고리
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                      >
                        상태
                      </th>
                      <th
                        class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                      >
                        작성일
                      </th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <i
                              class="ni ni-bell-55 text-primary text-sm opacity-10"
                            ></i>
                          </div>
                          <div
                            class="d-flex flex-column justify-content-center ms-3"
                          >
                            <h6 class="mb-0 text-sm">2024년 9월 회식 안내</h6>
                            <p class="text-xs text-secondary mb-0">
                              admin@company.com
                            </p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">공지사항</p>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success"
                          >공개</span
                        >
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"
                          >2024-09-10</span
                        >
                      </td>
                      <td class="align-middle">
                        <a
                          href="javascript:;"
                          class="text-secondary font-weight-bold text-xs"
                          data-toggle="tooltip"
                          data-original-title="Edit user"
                        >
                          상세보기
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <i
                              class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"
                            ></i>
                          </div>
                          <div
                            class="d-flex flex-column justify-content-center ms-3"
                          >
                            <h6 class="mb-0 text-sm">
                              프로젝트 중간 발표 일정
                            </h6>
                            <p class="text-xs text-secondary mb-0">
                              project@company.com
                            </p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">일정 공유</p>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success"
                          >공개</span
                        >
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"
                          >2024-09-08</span
                        >
                      </td>
                      <td class="align-middle">
                        <a
                          href="javascript:;"
                          class="text-secondary font-weight-bold text-xs"
                          data-toggle="tooltip"
                          data-original-title="Edit user"
                        >
                          상세보기
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <i
                              class="ni ni-single-copy-04 text-info text-sm opacity-10"
                            ></i>
                          </div>
                          <div
                            class="d-flex flex-column justify-content-center ms-3"
                          >
                            <h6 class="mb-0 text-sm">
                              9월 첫째 주 팀 미팅 회의록
                            </h6>
                            <p class="text-xs text-secondary mb-0">
                              meeting@company.com
                            </p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">회의록</p>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success"
                          >공개</span
                        >
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"
                          >2024-09-05</span
                        >
                      </td>
                      <td class="align-middle">
                        <a
                          href="javascript:;"
                          class="text-secondary font-weight-bold text-xs"
                          data-toggle="tooltip"
                          data-original-title="Edit user"
                        >
                          상세보기
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <i
                              class="ni ni-chat-round text-success text-sm opacity-10"
                            ></i>
                          </div>
                          <div
                            class="d-flex flex-column justify-content-center ms-3"
                          >
                            <h6 class="mb-0 text-sm">주말 등산 모임 안내</h6>
                            <p class="text-xs text-secondary mb-0">
                              hiking@company.com
                            </p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">자유게시판</p>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success"
                          >공개</span
                        >
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"
                          >2024-09-03</span
                        >
                      </td>
                      <td class="align-middle">
                        <a
                          href="javascript:;"
                          class="text-secondary font-weight-bold text-xs"
                          data-toggle="tooltip"
                          data-original-title="Edit user"
                        >
                          상세보기
                        </a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <div class="fixed-plugin">
      <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
        <i class="fa fa-cog py-2"> </i>
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
    <script>
      var win = navigator.platform.indexOf("Win") > -1;
      if (win && document.querySelector("#sidenav-scrollbar")) {
        var options = {
          damping: "0.5",
        };
        Scrollbar.init(document.querySelector("#sidenav-scrollbar"), options);
      }
    </script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
  </body>
</html>
