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
<%@page import="db.dto.PostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="apple-touch-icon" sizes="76x76"
	href="asset/2_dashboard/img/apple-icon.png" />
<link rel="icon" type="image/png"
	href="asset/2_dashboard/img/favicon.png" />
<title>Co-nect</title>
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
.search {
	position: relative;
	top: -10px;
	float: right;
}

.title {
	font-size: 20px;
	font-weight: bold;
}

th {
	text-align: center;
}

.center {
	text-align: center;
}
</style>
</head>
<%
request.setCharacterEncoding("utf-8");

// 페이징에 필요한 변수들
int totalRecord = 0; // 총 글의 갯수
int numPerPage = 8; // 한 페이지당 보여질 글의 갯수
int totalPage = 0; // 총 페이지 수
int nowPage = 1; // 현재 페이지
int beginPerPage = 0; // 페이지별 시작번호
int pagePerBlock = 5; // 블럭당 페이지 수 여러 페이지를 하나로 묶은 단위
int totalBlock = 0; // 총 블럭 수
int nowBlock = 0; // 현재 블럭

ArrayList<PostDTO> list = (ArrayList) session.getAttribute("list");

// 총 글의 수 계산 
totalRecord = list.size();
// 전체 페이지 수
totalPage = (int) Math.ceil((double) totalRecord / numPerPage); // 페이지를 소수로 나눈 후 그것을 정수형으로 변경해서 페이지 갯수 구하기

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage")); // 문자열 이기 때문에 정수형으로 변환
}

nowPage = (nowPage < 1) ? 1 : (nowPage > totalPage) ? totalPage : nowPage;

// 현재 페이지에서 보여줄 글의 시작 인덱스 계산
beginPerPage = (nowPage - 1) * numPerPage;

// 총 블록 수 계산
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

if (request.getParameter("nowBlock") != null) {
	nowBlock = Integer.parseInt(request.getParameter("nowBlock")); // 문자열 이기 때문에 정수형으로 변환
}

// 현재 블록의 페이지 목록을 세팅
if (list.size() >= 1) {
	ArrayList<PostDTO> currentPageList = new ArrayList<>(
	list.subList(beginPerPage, Math.min(beginPerPage + numPerPage, totalRecord)));
	session.setAttribute("list", currentPageList);
}
%>
<body class="g-sidenav-show bg-gray-100">
	<c:set var="Nmap" value="${sessionScope.getUserNameMap}"/>
	<jsp:include page="/asset/2_dashboard/page/navBar&profile.jsp"></jsp:include>

	<!-- 프로젝트 시작 -->

	<div style="margin-top: -8px;" class="container-fluid py-4">
		<div class="row">
			<div class="col-12">

				<div class="card mb-4">
					<div class="card-header pb-0">

						<span class="title">자유게시글 목록</span>

						<!-- 검색 기능 구현 -->
						<form
							action="${pageContext.request.contextPath}/dashboard?fn=FREE_LIST"
							name="search" method="post" class="search">

							<span> <select name="keyField" size="1">
									<option value="post_name">제목&nbsp;
									<option value="user_name">작성자
							</select> <input type="text" size="20" name="keyWord"
								placeholder="검색어를 입력하세요"> <!-- input type="submit" value="검색" onClick="check()"-->
								<button type="submit" class="btn btn-secondary">검색</button>
							</span>

						</form>
					</div>
					<div class="card-body px-0 pt-0 pb-2">
						<div class="table-responsive p-0">
							<c:set var="Nmap" value="${sessionScope.getUserNameMap}" />
							<c:set var="Mmap" value="${sessionScope.getUserMailMap}" />
							<table
								class="table align-items-center justify-content-center mb-0"
								style="width: 95%; margin-left: 2em">
								<thead>
									<tr>
										<th
											class="w-1 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
											즐겨찾기</th>
										<th
											class="w-5 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
											글번호</th>
										<th
											class="w-30 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
											제목</th>
										<th
											class="w-10 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
											작성자</th>

										<th
											class="w-5 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
											등록일</th>
										<th
											class="w-20 text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">
											조회수</th>
										<th class="w-10"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:forEach var="l" items="${sessionScope.list}">
											<td class="justify-content-center"><input
												type="checkbox" id="favorite" class="favorite"
												style="position: relative; left: 1em"
												value="${l.post_pk_num}"
												<c:if test="${l.favoriteCheck == true}">
						 	 checked
						  	</c:if>>
											</td>
											<td class="center">
												<!-- 글번호 --> <span class="text-xs font-weight-bold">${l.post_pk_num}</span>
											</td>
											<td>
												<div class="d-flex px-2">

													<div class="my-auto">
														<a
															href="${pageContext.request.contextPath}/dashboard?fn=FREE_READ&post_pk_num=${l.post_pk_num}">
															<!-- 글제목 -->
															<h6 class="mb-0 text-sm">${l.post_name}</h6>
														</a>
													</div>
												</div>
											</td>
											<td>
												<!-- 작성자 -->
												<h6 class="mb-0 text-sm"> ${Nmap[l.post_fk_user_num.toString()]}</h6>

											</td>
											<!-- 등록일 -->
											<td class="center"><span
												class="text-xs font-weight-bold"> ${l.post_regdate} </span></td>
											<!-- 조회수 -->
											<td class="align-middle text-center">
												<div>${l.post_view}</div>
											</td>
											<td class="align-middle"><a href="freeRead.jsp">
													<button class="btn btn-link text-secondary mb-0">
														<i class="fa fa-ellipsis-v text-xs"></i>
													</button>
											</a></td>
									</tr>
									</c:forEach>
									</tr>
								</tbody>
							</table>
							<div>
								<button type="button" class="btn btn-primary"
									style="float: left; position: relative; left: 1.5em; top: 0.5em"
									onclick="location.href='${pageContext.request.contextPath}/dashboard?fn=FREE_POST'">
									새 게시글 생성</button>
								<ul class="pagination justify-content-center"
									style="position: relative; top: 0.5em">
									<!-- 이전 블럭으로 이동 -->
									<%
									if (nowBlock > 0) {
									%>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/dashboard?fn=FREE_LIST&nowPage=${ (nowBlock-1) * pagePerBlock + 1}&nowBlock=<%=nowBlock-1%>">
											Prev </a></li>
									<%
									}
									%>

									<!-- 블럭 내 페이지 링크 표시 -->
									<%
									for (int i = 0; i < pagePerBlock; i++) {
										int pageNum = nowBlock * pagePerBlock + i + 1;
										if (pageNum > totalPage)
											break;
									%>
									<li class="page-item <%=(pageNum == nowPage) ? "active" : ""%>">
										<a class="page-link"
										href="${pageContext.request.contextPath}/dashboard?fn=FREE_LIST&nowPage=<%=pageNum%>&nowBlock=<%=nowBlock%>">
											<%=pageNum%></a>
									</li>
									<%
									}
									%>

									<!-- 다음 블럭으로 이동 -->
									<%
									if (nowBlock < totalBlock - 1) {
									%>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/dashboard?fn=FREE_LIST&nowPage=${(nowBlock+1) * pagePerBlock + 1}&nowBlock=${ nowBlock+1 }">
											Next </a></li>
									<%
									}
									%>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 프로젝트 끝-->
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
						data-class="bg-default" onclick="sidebarType(this)">Dark</button>
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
	<script>
  //즐겨찾기 관련 script
    const favoriteToggle = document.querySelectorAll('#favorite');
    	for(let i=0; i<favoriteToggle.length; i++){
    	favoriteToggle[i].addEventListener('click',() => {
    		if (favoriteToggle[i].checked){
    			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_CREATE&post_pk_num=`+favoriteToggle[i].value+`&url=LIST`;
    		} else {
    			location.href = `${pageContext.request.contextPath}/favorites?fn=FAVOR_DEL&post_pk_num=`+favoriteToggle[i].value+`&url=LIST`;
    		}
    	})
    }
    //
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
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example prototype etc -->
	<script src="asset/2_dashboard/js/argon-dashboard.min.js?v=2.0.4"></script>
	<script>
      document.addEventListener('DOMContentLoaded', function() {
        const toggleButton = document.getElementById('toggleButton');
        const taskList = document.getElementById('taskList');
        const tasks = [
          {task: '프로젝트 계획 수립', due_date: '2024-09-20', priority: '높음', status: '진행 중', icon: 'bi-clipboard-check text-primary'},
          {task: '팀 미팅 준비', due_date: '2024-09-18', priority: '중간', status: '완료', icon: 'bi-people text-info'},
          {task: '보고서 작성', due_date: '2024-09-22', priority: '높음', status: '시작 전', icon: 'bi-file-earmark-text text-warning'},
          {task: '코드 리뷰', due_date: '2024-09-21', priority: '중간', status: '진행 중', icon: 'bi-code-square text-success'},
          {task: '시스템 유지보수', due_date: '2024-09-23', priority: '낮음', status: '시작 전', icon: 'bi-gear text-secondary'}
        ];

        // 중요도에 따른 정렬 순서 정의
        const priorityOrder = {'높음': 1, '중간': 2, '낮음': 3};

        // 중요도에 따라 tasks 배열 정렬
        tasks.sort((a, b) => priorityOrder[a.priority] - priorityOrder[b.priority]);

        function createTaskRow(task) {
          const row = document.createElement('tr');
          row.className = `task-row ${task.priority == '높음' ? 'high-priority' : ''}`;
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
        tasks.forEach(task => {
          taskList.appendChild(createTaskRow(task));
        });

        toggleButton.addEventListener('click', function() {
          const allTasks = document.querySelectorAll('.task-row');
          allTasks.forEach(task => task.classList.toggle('show-all'));
          toggleButton.textContent = toggleButton.textContent === '접기' ? '모두 보기' : '접기';
        });
      });
    </script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="asset/2_dashboard/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

<%--  <jsp:include page="/asset/2_dashboard/page/footer.jsp"></jsp:include>--%>

</html>
