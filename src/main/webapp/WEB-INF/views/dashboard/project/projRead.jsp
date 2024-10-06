<%@page import="com.google.gson.Gson"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/asset/2_dashboard/img/apple-icon.png" />
<link rel="icon" type="image/png"
	href="/asset/2_dashboard/img/favicon.png" />
<title>2조 프로젝트</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="asset/2_dashboard/css/nucleo-icons.css" rel="stylesheet" />
<link href="asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle"
	href="asset/2_dashboard/css/argon-dashboard.css?v=2.0.4"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" />

<style>
.profile-container {
	margin-top: 2px;
	/* 위쪽 마진 추가 */
}

.profile-container {
	margin-left: auto;
	/* 오른쪽 정렬을 위해 추가 */
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

@media ( max-width : 1199.98px) {
	/* xl 브레이크포인트 미만에서 적용 */
	.profile-container {
		margin-right: 15px;
		/* 모바일에서 오른쪽 여백 추가 */
	}
}
</style>

<!-- 간트차트 스타일 -->
<style>
* {
	margin: 0;
	/* 마진 제거 */
	padding: 0;
	/*패딩 제거 */
	font-family: sans-serif;
	/* 글꼴 설정 */
}

.chartMenu {
	width: 100vw;
	/*너비 100vw*/
	height: 80px;
	/* 높이 80 px*/
	color: rgba(54, 162, 235, 1);
	/* 텍스트 색상설정 */
}

/*차트 메뉴 내 단락 스타일 */
.chartMenu p {
	padding: 10px;
	/*패딩 추가 */
	font-size: 20px;
	/*글꼴 크기 설정 */
}

/* 차트 카드 스타일 */
.chartCard {
	margin-left: -1rem;
	/* 카드 왼쪽 여백 조정 */
	width: calc(100% + 15rem);
	/* 너비를 동적으로 조정 */
	max-width: 80%;
	/* 최대 너비 80%로 설정 */
	height: 60vh;
	/* 차트 높이를 뷰포트 높이의 60%로 설정 */
	overflow: hidden;
	/* 콘텐츠가 넘칠 경우 숨기기 */
	/*transform: scale(0.9);*/
	/* 차트 크기 90%로 축소 */
}

/* 차트 박스 스타일 */
.chartBox {
	width: 80%;
	/* 너비 80% */
	padding: 0px;
	/* 패딩 0으로 설정 */
	border-radius: 20px;
	/* 둥근 모서리 설정 */
	border: solid 3px rgba(255, 0, 0, 0);
	/* 투명한 테두리 설정 */
	background: white;
	/* 배경색 흰색 */
}

/* 작업(Task) 스타일 */
.Task {
	max-width: 20%;
	/* 최대 너비 20%로 설정 */
	margin-top: 50px;
	/* 상단 여백 50px */
	font-size: 15px;
	/* 글꼴 크기 설정 */
}

/* 작업(Task) 내부의 입력, 선택, 버튼 스타일 */
.Task input, .Task select, .Task button {
	width: 70%;
	/* 입력, 선택, 버튼의 너비 70%로 설정 */
	margin-bottom: 10px;
	/* 요소 간의 하단 여백 추가 */
	padding: 8px;
	/* 패딩 추가하여 터치 영역 개선 */
	box-sizing: border-box;
	/* 패딩이 너비에 영향을 주지 않도록 설정 */
}
.treeTable{
	width:100%;
	padding-left:0;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body class="g-sidenav-show bg-gray-100">
	<jsp:include page="/asset/2_dashboard/page/navBar&profile.jsp"></jsp:include>

	<!-- End Navbar -->
	<!--  프로젝트 상태 창 -->
	<jsp:include page="/asset/2_dashboard/page/projectStatus.jsp"></jsp:include>
	<jsp:include page="/asset/2_dashboard/page/taskTree.jsp"></jsp:include>
	
	
	<!-- 게시판 끝 -->

	<!-- 이번주 나의 업무 -->


	<!-- 간트차트 시작 -->
<jsp:include page="/asset/2_dashboard/page/gantt.jsp"></jsp:include>

	<!-- 간트차트 끝 -->

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
						class="btn btn-link text-dark p-0 fixed-plugin-close-button">
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
				<!-- Sidenav Type -->
				<div class="mt-3">
					<h6 class="mb-0">Sidenav Type</h6>
					<p class="text-sm">Choose between 2 different sidenav types.</p>
				</div>
				<div class="d-flex">
					<button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2"
						data-class="bg-white" onclick="sidebarType(this)">White</button>
					<button class="btn bg-gradient-primary w-100 px-3 mb-2"
						data-class="bg-default" onclick="sidebarType(this)">Dark
					</button>
				</div>
				<p class="text-sm d-xl-none d-block mt-2">You can change the
					sidenav type just on desktop view.</p>
				<!-- Navbar Fixed -->
				<div class="d-flex my-3">
					<h6 class="mb-0">Navbar Fixed</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="navbarFixed" onclick="navbarFixed(this)" />
					</div>
				</div>
				<hr class="horizontal dark my-sm-4" />
				<div class="mt-2 mb-5 d-flex">
					<h6 class="mb-0">Light / Dark</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="dark-version" onclick="darkMode(this)" />
					</div>
				</div>
				<a class="btn bg-gradient-dark w-100"
					href="https://www.creative-tim.com/product/argon-dashboard">Free
					Download</a> <a class="btn btn-outline-dark w-100"
					href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard">View
					documentation</a>
				<div class="w-100 text-center">
					<a class="github-button"
						href="https://github.com/creativetimofficial/argon-dashboard"
						data-icon="octicon-star" data-size="large" data-show-count="true"
						aria-label="Star creativetimofficial/argon-dashboard on GitHub">Star</a>
					<h6 class="mt-3">Thank you for sharing!</h6>
					<a
						href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard"
						class="btn btn-dark mb-0 me-2" target="_blank"> <i
						class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
					</a> <a
						href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/argon-dashboard"
						class="btn btn-dark mb-0 me-2" target="_blank"> <i
						class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
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

</html>