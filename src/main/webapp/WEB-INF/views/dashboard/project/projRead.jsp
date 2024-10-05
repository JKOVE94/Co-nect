<%@page import="db.dto.TaskDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.dto.ProjectDTO"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
          href="asset/2_dashboard/img/apple-icon.png"
  />
  <link rel="icon" type="image/png" href="asset/2_dashboard/img/favicon.png" />
  <title>2조 프로젝트</title>
  <!--     Fonts and icons     -->
  <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
          rel="stylesheet"
  />
  <!-- Nucleo Icons -->
  <link href="asset/2_dashboard/css/nucleo-icons.css" rel="stylesheet" />
  <link href="asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script
          src="https://kit.fontawesome.com/42d5adcbca.js"
          crossorigin="anonymous"
  ></script>
  <link href="asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link
          id="pagestyle"
          href="asset/2_dashboard/css/argon-dashboard.css?v=2.0.4"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
  />

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
  <style>
    :root {
      --white: #fff;
      --divider: lightgrey;
      --body: #f5f7f8;
    }

    * {
      padding: 0;
      margin: 0;
      box-sizing: border-box;
    }

    ul {
      list-style: none;
    }

    a {
      text-decoration: none;
      color: inherit;
    }

    .chart-wrapper {
      max-width: 1150px;
      padding: 0 10px;
      margin: 0 auto;
    }

    /* CHART-VALUES
  –––––––––––––––––––––––––––––––––––––––––––––––––– */
    .chart-wrapper .chart-values {
      position: relative;
      display: flex;
      margin-bottom: 20px;
      font-weight: bold;
      font-size: 1.2rem;
    }

    .chart-wrapper .chart-values li {
      flex: 1;
      min-width: 140px; /* 너비 증가 */
      text-align: center;
    }
    .chart-wrapper .chart-values li:not(:last-child) {
      position: relative;
    }

    .chart-wrapper .chart-values li:not(:last-child)::before {
      content: "";
      position: absolute;
      right: 0;
      height: 600px;
      border-right: 1px solid var(--divider);
    }

    /* CHART-BARS
  –––––––––––––––––––––––––––––––––––––––––––––––––– */
    .chart-wrapper .chart-bars li {
      position: relative;
      color: var(--white);
      margin-bottom: 15px;
      font-size: 16px;
      border-radius: 20px;
      padding: 10px 20px;
      width: 100%; /* 너비 100%로 설정 */
      opacity: 1; /* 투명도 1로 설정 */
      transition: all 0.65s linear 0.2s;
    }

    @media screen and (max-width: 600px) {
      .chart-wrapper .chart-bars li {
        padding: 10px;
        width: 100%; /* 너비 100%로 설정 */
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
      font-size: 14px;
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
</head>
<%
ProjectDTO getProjDTO = (ProjectDTO) request.getAttribute("getProjDTO");
ArrayList getTaskList = (ArrayList) request.getAttribute("getTaskList");
%>

<body class="g-sidenav-show bg-gray-100">

<jsp:include page="/asset/2_dashboard/page/navBar&profile.jsp"></jsp:include>

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


  <!-- 업무 -->

  <div style="margin-top: -1rem;"  class="container-fluid py-4">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="chart-wrapper">
            <ul class="chart-values">
              <li>일</li>
              <li>월</li>
              <li>화</li>
              <li>수</li>
              <li>목</li>
              <li>금</li>
              <li>토</li>
            </ul>
            <ul class="chart-bars">
              <li data-duration="화½-수" data-color="#b03532">
                스포티파이 기능 구현
              </li>
              <li data-duration="수-토" data-color="#33a8a5">
                스포티파이 API 통합
              </li>
              <li data-duration="일-화" data-color="#30997a">
                스포티파이 데이터 분석
              </li>
              <li data-duration="화½-목" data-color="#6a478f">
                스포티파이 UI 디자인
              </li>
              <li data-duration="월-화½" data-color="#da6f2b">
                스포티파이 버그 수정
              </li>
              <li data-duration="수-수" data-color="#3d8bb1">
                스포티파이 테스트
              </li>
              <li data-duration="목-금½" data-color="#e03f3f">
                스포티파이 최적화
              </li>
              <li data-duration="월½-수½" data-color="#59a627">
                스포티파이 문서화
              </li>
              <li data-duration="금-토" data-color="#4464a1">
                스포티파이 리뷰
              </li>
            </ul>
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
<script src="asset/2_dashboard/js/core/popper.min.js"></script>
<script src="asset/2_dashboard/js/core/bootstrap.min.js"></script>
<script src="asset/2_dashboard/js/plugins/perfect-scrollbar.min.js"></script>
<script src="asset/2_dashboard/js/plugins/smooth-scrollbar.min.js"></script>
<script src="asset/2_dashboard/js/plugins/chartjs.min.js"></script>
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
<script src="asset/2_dashboard/js/argon-dashboard.min.js?v=2.0.4"></script>
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
<%--<jsp:include page="/asset/2_dashboard/page/footer.jsp"></jsp:include>--%>
</html>
