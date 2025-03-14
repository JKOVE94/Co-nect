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

    <aside
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
                  <a class="nav-link" href="Project.jsp">
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
              href="./virtual-reality.jsp"
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
                  <a class="nav-link" href="Project.jsp">
                    프로젝트 개요
                  </a>
                </li>
              </ul>
            </div>

            <div class="collapse" id="project-collapse">
              <ul>
                <li style="list-style: none; text-align: center">
                  <a class="nav-link" href="details.jsp">
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
                <li style="list-style: none; text-align: center">
                  <a class="nav-link" href="tables.jsp">
                    사내 게시판
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
    <div class="main-content position-relative max-height-vh-100 h-100">
      <div class="card shadow-lg mx-4 card-profile-bottom">
        <div class="card-body p-3">
          <div class="row gx-4">
            <div class="col-auto">
              <div class="avatar avatar-xl position-relative">
                <img
                  src="./assets/img/team-1.jpg"
                  alt="profile_image"
                  class="w-100 border-radius-lg shadow-sm"
                />
              </div>
            </div>
            <div class="col-auto my-auto">
              <div class="h-100">
                <h5 class="mb-1">Sayo Kravits</h5>
                <p class="mb-0 font-weight-bold text-sm">Public Relations</p>
              </div>
            </div>
            <div
              class="col-lg-4 col-md-6 my-sm-auto ms-sm-auto me-sm-0 mx-auto mt-3"
            >
              <div class="nav-wrapper position-relative end-0">
                <ul class="nav nav-pills nav-fill p-1" role="tablist">
                  <li class="nav-item">
                    <a
                      class="nav-link mb-0 px-0 py-1 active d-flex align-items-center justify-content-center"
                      data-bs-toggle="tab"
                      href="javascript:;"
                      role="tab"
                      aria-selected="true"
                    >
                      <i class="ni ni-app"></i>
                      <span class="ms-2">App</span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a
                      class="nav-link mb-0 px-0 py-1 d-flex align-items-center justify-content-center"
                      data-bs-toggle="tab"
                      href="javascript:;"
                      role="tab"
                      aria-selected="false"
                    >
                      <i class="ni ni-email-83"></i>
                      <span class="ms-2">Messages</span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a
                      class="nav-link mb-0 px-0 py-1 d-flex align-items-center justify-content-center"
                      data-bs-toggle="tab"
                      href="javascript:;"
                      role="tab"
                      aria-selected="false"
                    >
                      <i class="ni ni-settings-gear-65"></i>
                      <span class="ms-2">Settings</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid py-4">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header pb-0">
                <div class="d-flex align-items-center">
                  <p class="mb-0">Edit Profile</p>
                  <button class="btn btn-primary btn-sm ms-auto">
                    Settings
                  </button>
                </div>
              </div>
              <div class="card-body">
                <p class="text-uppercase text-sm">User Information</p>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >Username</label
                      >
                      <input
                        class="form-control"
                        type="text"
                        value="lucky.jesse"
                      />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >Email address</label
                      >
                      <input
                        class="form-control"
                        type="email"
                        value="jesse@example.com"
                      />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >First name</label
                      >
                      <input class="form-control" type="text" value="Jesse" />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >Last name</label
                      >
                      <input class="form-control" type="text" value="Lucky" />
                    </div>
                  </div>
                </div>
                <hr class="horizontal dark" />
                <p class="text-uppercase text-sm">Contact Information</p>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >Address</label
                      >
                      <input
                        class="form-control"
                        type="text"
                        value="Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09"
                      />
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >City</label
                      >
                      <input
                        class="form-control"
                        type="text"
                        value="New York"
                      />
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >Country</label
                      >
                      <input
                        class="form-control"
                        type="text"
                        value="United States"
                      />
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >Postal code</label
                      >
                      <input class="form-control" type="text" value="437300" />
                    </div>
                  </div>
                </div>
                <hr class="horizontal dark" />
                <p class="text-uppercase text-sm">About me</p>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="example-text-input" class="form-control-label"
                        >About me</label
                      >
                      <input
                        class="form-control"
                        type="text"
                        value="A beautiful Dashboard for Bootstrap 5. It is Free and Open Source."
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-profile">
              <img
                src="./assets/img/bg-profile.jpg"
                alt="Image placeholder"
                class="card-img-top"
              />
              <div class="row justify-content-center">
                <div class="col-4 col-lg-4 order-lg-2">
                  <div class="mt-n4 mt-lg-n6 mb-4 mb-lg-0">
                    <a href="javascript:;">
                      <img
                        src="./assets/img/team-2.jpg"
                        class="rounded-circle img-fluid border border-2 border-white"
                      />
                    </a>
                  </div>
                </div>
              </div>
              <div
                class="card-header text-center border-0 pt-0 pt-lg-2 pb-4 pb-lg-3"
              >
                <div class="d-flex justify-content-between">
                  <a
                    href="javascript:;"
                    class="btn btn-sm btn-info mb-0 d-none d-lg-block"
                    >Connect</a
                  >
                  <a
                    href="javascript:;"
                    class="btn btn-sm btn-info mb-0 d-block d-lg-none"
                    ><i class="ni ni-collection"></i
                  ></a>
                  <a
                    href="javascript:;"
                    class="btn btn-sm btn-dark float-right mb-0 d-none d-lg-block"
                    >Message</a
                  >
                  <a
                    href="javascript:;"
                    class="btn btn-sm btn-dark float-right mb-0 d-block d-lg-none"
                    ><i class="ni ni-email-83"></i
                  ></a>
                </div>
              </div>
              <div class="card-body pt-0">
                <div class="row">
                  <div class="col">
                    <div class="d-flex justify-content-center">
                      <div class="d-grid text-center">
                        <span class="text-lg font-weight-bolder">22</span>
                        <span class="text-sm opacity-8">Friends</span>
                      </div>
                      <div class="d-grid text-center mx-4">
                        <span class="text-lg font-weight-bolder">10</span>
                        <span class="text-sm opacity-8">Photos</span>
                      </div>
                      <div class="d-grid text-center">
                        <span class="text-lg font-weight-bolder">89</span>
                        <span class="text-sm opacity-8">Comments</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="text-center mt-4">
                  <h5>Mark Davis<span class="font-weight-light">, 35</span></h5>
                  <div class="h6 font-weight-300">
                    <i class="ni location_pin mr-2"></i>Bucharest, Romania
                  </div>
                  <div class="h6 mt-4">
                    <i class="ni business_briefcase-24 mr-2"></i>Solution
                    Manager - Creative Tim Officer
                  </div>
                  <div>
                    <i class="ni education_hat mr-2"></i>University of Computer
                    Science
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <footer class="footer pt-3">
          <div class="container-fluid">
            <div class="row align-items-center justify-content-lg-between">
              <div class="col-lg-6 mb-lg-0 mb-4">
                <div
                  class="copyright text-center text-sm text-muted text-lg-start"
                >
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with <i class="fa fa-heart"></i> by
                  <a
                    href="https://www.creative-tim.com"
                    class="font-weight-bold"
                    target="_blank"
                    >Creative Tim</a
                  >
                  for a better web.
                </div>
              </div>
              <div class="col-lg-6">
                <ul
                  class="nav nav-footer justify-content-center justify-content-lg-end"
                >
                  <li class="nav-item">
                    <a
                      href="https://www.creative-tim.com"
                      class="nav-link text-muted"
                      target="_blank"
                      >Creative Tim</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      href="https://www.creative-tim.com/presentation"
                      class="nav-link text-muted"
                      target="_blank"
                      >About Us</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      href="https://www.creative-tim.com/blog"
                      class="nav-link text-muted"
                      target="_blank"
                      >Blog</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      href="https://www.creative-tim.com/license"
                      class="nav-link pe-0 text-muted"
                      target="_blank"
                      >License</a
                    >
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
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
