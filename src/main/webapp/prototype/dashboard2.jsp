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
      .task-row {
        display: none;
      }
      .task-row.high-priority,
      .task-row.show-all {
        display: table-row;
      }
    </style>
    <style>
      .profile-container {
        margin-top: 8px; /* 위쪽 마진 추가 */
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
  </head>

  <body class="g-sidenav-show bg-gray-100">
    <div class="min-height-300 bg-primary position-absolute w-100"></div>
    <aside
      class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4"
      id="sidenav-main"
    >
      <div class="sidenav-header">
        <i
          class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
          aria-hidden="true"
          id="iconSidenav"
        ></i>
        <a
          class="navbar-brand m-0"
          href=" https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html ">
          <img
            src="./assets/img/logo-ct-dark.png"
            class="navbar-brand-img h-100"
            alt="main_logo"
          />
          <span class="ms-1 font-weight-bold">Argon Dashboard 2</span>
        </a>
      </div>
      <hr class="horizontal dark mt-0" />
      <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="<%=request.getContextPath()%>/dashboard?fn=HOME">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="tables.jsp">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i
                  class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"
                ></i>
              </div>
              <span class="nav-link-text ms-1">Tables</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./billing.html">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i
                  class="ni ni-credit-card text-success text-sm opacity-10"
                ></i>
              </div>
              <span class="nav-link-text ms-1">Billing</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./virtual-reality.html">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-app text-info text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Virtual Reality</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">RTL</span>
            </a>
          </li>
          <li class="nav-item mt-3">
            <h6
              class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6"
            >
              Account pages
            </h6>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Profile</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i
                  class="ni ni-single-copy-04 text-warning text-sm opacity-10"
                ></i>
              </div>
              <span class="nav-link-text ms-1">Sign In</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-collection text-info text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Sign Up</span>
            </a>
          </li>
        </ul>
      </div>
    </aside>
    <main class="main-content position-relative border-radius-lg">
      <!-- Navbar -->
      <nav
        class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
        id="navbarBlur"
        data-scroll="false"
      >
        <div class="container-fluid py-1 px-3">
          <div
            class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
            id="navbar"
          >
            <div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
            <ul class="navbar-nav align-items-center ml-auto">
              <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                <a
                  href="javascript:;"
                  class="nav-link text-white p-0"
                  id="iconNavbarSidenav"
                >
                  <div class="sidenav-toggler-inner">
                    <i class="sidenav-toggler-line bg-white"></i>
                    <i class="sidenav-toggler-line bg-white"></i>
                    <i class="sidenav-toggler-line bg-white"></i>
                  </div>
                </a>
              </li>
              <li
                class="nav-item px-3 d-flex align-items-center profile-container"
              >
                <a class="nav-link" href="profile.jsp">
                  <div class="profile-photo-small">
                    <img
                      src="path/to/profile-photo.jpg"
                      alt="프로필 사진"
                      class="rounded-circle"
                      onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
                    />
                    <i class="bi bi-person-circle default-icon"></i>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->

      <div class="container-fluid py-4">
        <div class="row mt-4">
          <div class="col-lg-7 mb-lg-0 mb-4">
            <div class="card">
              <div class="card-header pb-0 p-3">
                <h6 class="mb-0 text-center">
                  <a class="nav-link" href="tables.jsp">게시판</a>
                </h6>
              </div>
              <div class="card-body p-3">
                <ul class="list-group">
                  <li
                    class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"
                  >
                    <div class="d-flex align-items-center">
                      <div
                        class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"
                      >
                        <i
                          class="ni ni-notification-70 text-white opacity-10"
                        ></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">공지사항</h6>
                        <span class="text-xs">2024년 9월 회식 안내</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-10
                      <button
                        class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"
                      >
                        <i class="ni ni-bold-right" aria-hidden="true"></i>
                      </button>
                    </div>
                  </li>
                  <li
                    class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"
                  >
                    <div class="d-flex align-items-center">
                      <div
                        class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"
                      >
                        <i
                          class="ni ni-calendar-grid-58 text-white opacity-10"
                        ></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">일정 공유</h6>
                        <span class="text-xs">프로젝트 중간 발표 일정</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-08
                      <button
                        class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"
                      >
                        <i class="ni ni-bold-right" aria-hidden="true"></i>
                      </button>
                    </div>
                  </li>
                  <li
                    class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"
                  >
                    <div class="d-flex align-items-center">
                      <div
                        class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"
                      >
                        <i
                          class="ni ni-single-copy-04 text-white opacity-10"
                        ></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">회의록</h6>
                        <span class="text-xs">9월 첫째 주 팀 미팅 회의록</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-05
                      <button
                        class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"
                      >
                        <i class="ni ni-bold-right" aria-hidden="true"></i>
                      </button>
                    </div>
                  </li>
                  <li
                    class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg"
                  >
                    <div class="d-flex align-items-center">
                      <div
                        class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center"
                      >
                        <i class="ni ni-satisfied text-white opacity-10"></i>
                      </div>
                      <div class="d-flex flex-column">
                        <h6 class="mb-1 text-dark text-sm">자유게시판</h6>
                        <span class="text-xs">주말 등산 모임 안내</span>
                      </div>
                    </div>
                    <div class="d-flex align-items-center text-sm">
                      2024-09-03
                      <button
                        class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"
                      >
                        <i class="ni ni-bold-right" aria-hidden="true"></i>
                      </button>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!-- 게시판 끝 -->

          <!-- 이번주 나의 업무 -->

          <div class="col-lg-5">
            <div class="card">
              <div class="card-header pb-0 p-3">
                <div
                  class="d-flex justify-content-between align-items-center mb-3"
                >
                  <h6 class="mb-0 ms-4">이번 주 나의 업무</h6>
                  <button
                    id="toggleButton"
                    class="btn btn-outline-primary btn-sm"
                  >
                    모두 보기
                  </button>
                </div>
              </div>
              <div id="cardContent" class="card-body p-3">
                <div class="table-responsive">
                  <table class="table align-items-center">
                    <tbody id="taskList"></tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 업무 -->

      <div class="container-fluid py-4">
        <div class="row">
          <div class="col-12">
            <div class="card mb-4">
              <div
                class="card-header pb-0 d-flex justify-content-between align-items-center mb-3"
              >
                <div
                  class="d-flex justify-content-center"
                  style="padding-left: 45%"
                >
                  <h5 class="mb-0">프로젝트 테이블</h5>
                </div>
                <a href="Project.jsp">
                  <button id="" class="btn btn-outline-primary btn-sm">
                    더 보기
                  </button>
                </a>
              </div>
              <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                  <table
                    class="table align-items-center justify-content-center mb-0"
                  >
                    <thead>
                      <tr>
                        <th
                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                        >
                          프로젝트
                        </th>
                        <th
                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                          예산
                        </th>
                        <th
                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                          상태
                        </th>
                        <th
                          class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2"
                        >
                          진행도
                        </th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="d-flex px-2">
                            <div>
                              <img
                                src="./assets/img/small-logos/logo-spotify.svg"
                                class="avatar avatar-sm rounded-circle me-2"
                                alt="spotify"
                              />
                            </div>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">Spotify</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-sm font-weight-bold mb-0">$2,500</p>
                        </td>
                        <td>
                          <span class="text-xs font-weight-bold">working</span>
                        </td>
                        <td class="align-middle text-center">
                          <div
                            class="d-flex align-items-center justify-content-center"
                          >
                            <span class="me-2 text-xs font-weight-bold"
                              >60%</span
                            >
                            <div>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-info"
                                  role="progressbar"
                                  aria-valuenow="60"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                  style="width: 60%"
                                ></div>
                              </div>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <button class="btn btn-link text-secondary mb-0">
                            <i class="fa fa-ellipsis-v text-xs"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="d-flex px-2">
                            <div>
                              <img
                                src="./assets/img/small-logos/logo-invision.svg"
                                class="avatar avatar-sm rounded-circle me-2"
                                alt="invision"
                              />
                            </div>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">Invision</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-sm font-weight-bold mb-0">$5,000</p>
                        </td>
                        <td>
                          <span class="text-xs font-weight-bold">done</span>
                        </td>
                        <td class="align-middle text-center">
                          <div
                            class="d-flex align-items-center justify-content-center"
                          >
                            <span class="me-2 text-xs font-weight-bold"
                              >100%</span
                            >
                            <div>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-success"
                                  role="progressbar"
                                  aria-valuenow="100"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                  style="width: 100%"
                                ></div>
                              </div>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <button
                            class="btn btn-link text-secondary mb-0"
                            aria-haspopup="true"
                            aria-expanded="false"
                          >
                            <i class="fa fa-ellipsis-v text-xs"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="d-flex px-2">
                            <div>
                              <img
                                src="./assets/img/small-logos/logo-jira.svg"
                                class="avatar avatar-sm rounded-circle me-2"
                                alt="jira"
                              />
                            </div>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">Jira</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-sm font-weight-bold mb-0">$3,400</p>
                        </td>
                        <td>
                          <span class="text-xs font-weight-bold">canceled</span>
                        </td>
                        <td class="align-middle text-center">
                          <div
                            class="d-flex align-items-center justify-content-center"
                          >
                            <span class="me-2 text-xs font-weight-bold"
                              >30%</span
                            >
                            <div>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-danger"
                                  role="progressbar"
                                  aria-valuenow="30"
                                  aria-valuemin="0"
                                  aria-valuemax="30"
                                  style="width: 30%"
                                ></div>
                              </div>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <button
                            class="btn btn-link text-secondary mb-0"
                            aria-haspopup="true"
                            aria-expanded="false"
                          >
                            <i class="fa fa-ellipsis-v text-xs"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="d-flex px-2">
                            <div>
                              <img
                                src="./assets/img/small-logos/logo-slack.svg"
                                class="avatar avatar-sm rounded-circle me-2"
                                alt="slack"
                              />
                            </div>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">Slack</h6>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-sm font-weight-bold mb-0">$1,000</p>
                        </td>
                        <td>
                          <span class="text-xs font-weight-bold">canceled</span>
                        </td>
                        <td class="align-middle text-center">
                          <div
                            class="d-flex align-items-center justify-content-center"
                          >
                            <span class="me-2 text-xs font-weight-bold"
                              >0%</span
                            >
                            <div>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-success"
                                  role="progressbar"
                                  aria-valuenow="0"
                                  aria-valuemin="0"
                                  aria-valuemax="0"
                                  style="width: 0%"
                                ></div>
                              </div>
                            </div>
                          </div>
                        </td>
                        <td class="align-middle">
                          <button
                            class="btn btn-link text-secondary mb-0"
                            aria-haspopup="true"
                            aria-expanded="false"
                          >
                            <i class="fa fa-ellipsis-v text-xs"></i>
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
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
    <script>
      var win = navigator.platform.indexOf("Win") > -1;
      if (win && document.querySelector("#sidenav-scrollbar")) {
        var options = {
          damping: "0.5",
        };
        Scrollbar.init(document.querySelector("#sidenav-scrollbar"), options);
      }

      const content = document.querySelector(".accordion-content");
      const height = content.scrollHeight;

      content.style.height = "0px";
      content.style.transition = "height 0.3s ease-out";

      // 열 때
      content.style.height = height + "px";

      // 닫을 때
      content.style.height = "0px";
    </script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const toggleButton = document.getElementById("toggleButton");
        const taskList = document.getElementById("taskList");
        const tasks = [
          {
            task: "프로젝트 계획 수립",
            due_date: "2024-09-20",
            priority: "높음",
            status: "진행 중",
            icon: "bi-clipboard-check text-primary",
          },
          {
            task: "팀 미팅 준비",
            due_date: "2024-09-18",
            priority: "중간",
            status: "완료",
            icon: "bi-people text-info",
          },
          {
            task: "보고서 작성",
            due_date: "2024-09-22",
            priority: "높음",
            status: "시작 전",
            icon: "bi-file-earmark-text text-warning",
          },
          {
            task: "코드 리뷰",
            due_date: "2024-09-21",
            priority: "중간",
            status: "진행 중",
            icon: "bi-code-square text-success",
          },
          {
            task: "시스템 유지보수",
            due_date: "2024-09-23",
            priority: "낮음",
            status: "시작 전",
            icon: "bi-gear text-secondary",
          },
        ];

        // 중요도에 따른 정렬 순서 정의
        const priorityOrder = { 높음: 1, 중간: 2, 낮음: 3 };

        // 중요도에 따라 tasks 배열 정렬
        tasks.sort(
          (a, b) => priorityOrder[a.priority] - priorityOrder[b.priority]
        );

        function createTaskRow(task) {
          const row = document.createElement("tr");
          row.className = `task-row ${
            task.priority === "높음" ? "high-priority" : ""
          }`;
          row.innerHTML = `
            <td class="w-30">
              <div class="d-flex px-2 py-1 align-items-center">
                <div>
                  <i class="bi ${task.icon}" style="font-size: 1.5rem;"></i>
                </div>
                <div class="ms-4">
                  <p class="text-xs font-weight-bold mb-0">업무:</p>
                  <h6 class="text-sm mb-0">${task.task}</h6>
                </div>
              </div>
            </td>
            <td>
              <div class="text-center">
                <p class="text-xs font-weight-bold mb-0">마감일:</p>
                <h6 class="text-sm mb-0">${task.due_date}</h6>
              </div>
            </td>
            <td>
              <div class="text-center">
                <p class="text-xs font-weight-bold mb-0">중요도:</p>
                <h6 class="text-sm mb-0">${task.priority}</h6>
              </div>
            </td>
            <td class="align-middle text-sm">
              <div class="col text-center">
                <p class="text-xs font-weight-bold mb-0">진행상태:</p>
                <h6 class="text-sm mb-0">${task.status}</h6>
              </div>
            </td>
          `;
          return row;
        }

        // 정렬된 tasks 배열을 이용해 행 생성
        tasks.forEach((task) => {
          taskList.appendChild(createTaskRow(task));
        });

        toggleButton.addEventListener("click", function () {
          const allTasks = document.querySelectorAll(".task-row");
          allTasks.forEach((task) => task.classList.toggle("show-all"));
          toggleButton.textContent =
            toggleButton.textContent === "접기" ? "모두 보기" : "접기";
        });
      });
    </script>
  </body>
</html>
