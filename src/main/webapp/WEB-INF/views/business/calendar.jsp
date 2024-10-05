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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <link rel="apple-touch-icon"sizes="76x76" href="asset/2_dashboard/img/apple-icon.png"/>
  <link rel="icon" type="image/png" href="asset/2_dashboard/img/favicon.png" />
  <title>2조 프로젝트</title>
  
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
  <!-- Nucleo Icons -->
  <link href="asset/2_dashboard/css/nucleo-icons.css" rel="stylesheet" />
  <link href="asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  
  <!-- 캘린더 관련 moment:날짜형식, fuulcalendar:캘린더라이브러리, jquery:ajax -->
  <script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  
  <!-- 캘린더 툴팁 관련 -->
  <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
  <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
  
  <!-- 캘린더 관련 js코드 -->
  <script type="module">
	
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
 
		//캘린더 초기화 - body> div id=calendar 에 캘린더 들어감 426줄
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth', 
		  //today버튼, 이전달, 다음달 조회 버튼, 제목, 일정추가 버튼 추가
		  headerToolbar:{
			start : 'today prev,next',
			center : 'title',
			end :'addEventButton'
		  },
		  timeZone : 'local',
		 // 서블릿에서 db정보를 json으로 받아와 event 추가
		  eventSources : [{
				events : function(info, successCallback, failureCallback){
					$.ajax({
							url : '${pageContext.request.contextPath}/calendar?fn=GET',
							type : 'GET',
							dataType : 'json',
							success: function(data) {
								successCallback(data);
							}
					})
				}
		  }],
		 //input박스에 값을 넣고 일정추가 버튼을 누르면 todo db에 저장되고 이벤트 추가됨
		  customButtons : {
			addEventButton: {
				text:'일정추가',
				click: function(){
					const titleText = document.getElementById('title').value;
					const content = document.getElementById('content').value;
					const startDate = document.getElementById('startDate').value;
					const endDate = document.getElementById('endDate').value;
					//json형식으로 만들기
					const requestData = {
											title:titleText, 
											content : content,
											start : startDate, 
											end : endDate
										};
					//DB 데이터 저장
					$.ajax({
						url : '${pageContext.request.contextPath}/calendar',
						type:'POST',
						data : JSON.stringify(requestData),
						contentType: 'application/json; charset=utf-8',
						success : function(data){
							calendar.addEvent({
								title : titleText,
								start : startDate, 
								content : content,
								end : endDate,
								num : data.num
							});
						}
					})

					document.getElementById('title').value = '';
					document.getElementById('content').value = '';
					document.getElementById('startDate').value = '';
					document.getElementById('endDate').value = '';
				}
			 }
		  },
		//이벤트를 클릭할 경우 실행
		eventClick: function(info){
			const num = info.event._def.extendedProps.num;
			const content = info.event._def.extendedProps.content;
			const requestData = {
									pknum : num
								};
			//pknum이 null이 아닐경우 (proj이벤트가 아닌 todo이벤트일 경우 실행)
			if(num!=null){
				if(confirm("일정명 : " + info.event.title +"\n내용 : "+ content
					+ "\n\n해당 일정을 삭제하시겠습니까?"))
				{	
					//캘린더 내 이벤트 삭제
					info.event.remove();
					//DB에서 데이터 삭제
					$.ajax({
						url : '${pageContext.request.contextPath}/calendar',
						type:'DELETE',
						dataType:'json',
						data : JSON.stringify(requestData),
						contentType: 'application/json; charset=utf-8'
					})
				}
			}
		},
		//이벤트를 끌어다 다른 날짜로 옮길 경우 실행
		eventDrop : function(info){
			
			const num = info.event._def.extendedProps.num;
			const start = info.event._instance.range.start;
			const end = info.event._instance.range.end;
			//pknum이 없다면 proj일정이므로 수정불가하게 해줌S
			if(num==null){
				alert('프로젝트 일정은 수정할 수 없습니다');
				//이벤트 원래 자리로 돌아가기
				info.revert();
			} else {
				const requestData = {
   					pknum : num,
					startDate : moment(start).format('YYYY-MM-DD hh:mm:ss'),
					endDate : moment(end).format('YYYY-MM-DD hh:mm:ss')
				};
				//DB에서 데이터 수정
				$.ajax({
					url : '${pageContext.request.contextPath}/calendar',
					type:'PUT',
					dataType:'json',
					data : JSON.stringify(requestData),
					contentType: 'application/json; charset=utf-8'
				})
			}
		},
		//이벤트에 마우스 올릴 경우 해당 이벤트의 content(내용)을 툴팁으로 표시
		eventDidMount:function(info){
			//tippy.js 사용
			tippy(info.el,{
				content: info.event._def.extendedProps.content
			});
		},
		  editable : true,
		  dayMaxEventRows: true,
        });
        calendar.render();
      });

    </script>
  <link href="asset/2_dashboard/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link
          id="prototypetyle"
          href="asset/2_dashboard/css/argon-dashboard.css?v=2.0.4"
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
  <img src="asset/1_landing/co-nect logo + text (w).svg" alt="Logo" class="sidenav-logo" style="margin-top:-0.75rem">
</div>

<aside
        class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl  fixed-start ms-4 "
        id="sidenav-main">
  <!-- 사이드바 제목(로고) -->
  <div class="sidenav-header">
    <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
       aria-hidden="true" id="iconSidenav"></i>
    <a class="navbar-brand m-0" href="<%=request.getContextPath()%>/dashboard?fn=HOME">
      <img src="asset/1_landing/co-nect logo + text (1E74B1).svg" class="navbar-brand-img h-100" alt="main_logo">
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
              <a class="nav-link" href="<%=request.getContextPath()%>/favorites?fn=FAVOR_POSTLIST">
                자유게시판
              </a>
            </li>
            <li style="list-style: none; text-align: center;">
              <a class="nav-link" href="<%=request.getContextPath()%>/favorites?fn=FAVOR_PROJLIST">
                프로젝트
              </a>
            </li>
          </ul>
        </div>
      </li>

      <!-- 2) 프로젝트 -->
      <li class="nav-item">
        <a class="nav-link active" href="<%=request.getContextPath()%>/prototype/virtual-reality.html" data-bs-toggle="collapse"
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
              <a class="nav-link" href="<%=request.getContextPath()%>/prototype/Project.jsp">
                프로젝트 개요
              </a>
            </li>
          </ul>
        </div>

        <div class="collapse" id="project-collapse">
          <ul>
            <li style="list-style: none; text-align: center;">
              <a class="nav-link" href="<%=request.getContextPath()%>/prototype/details.jsp">
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
              <a class="nav-link" href="${pageContext.request.contextPath}/dashboard?fn=">
                일정 관리
              </a>
            </li>
            <li style="list-style: none; text-align: center;">
              <a class="nav-link" href="${pageContext.request.contextPath}/calendar">
                캘린더
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

  <div style="margin-top: -8px;"class="container-fluid py-4">
    <div class="row">
      <div class="col-12">
        <div class="card mb-4">
          <div class="card-header pb-0 d-flex justify-content-between align-items-center mb-3">
            <div class="d-flex justify-content-center" style="padding-left: 45%;">
              <h5 class="mb-0">캘린더</h5>
            </div>
          </div>
          <div class="card-body px-0 pt-0 pb-2 d-flex justify-content-center">
	          <div  id='calendar' style="width:800px;height:800px;margin-bottom:100px;">
	    	
			   </div>
			   <div style="margin-left:30px;">
				    <label for="title">제목  </label>
				    <input type="text" class="form-control" id="title"/><br>
				    
				    <label for="content">내용  </label>
				    <textarea class="form-control" id="content" ></textarea><br>
				    
				    <label for="startDate">시작날짜</label>
				    <input type="datetime-local" class="form-control" id="startDate"/><br>
				    	
				    <label for="endDate">종료날짜</label>
				    <input type="datetime-local" class="form-control" id="endDate"/><br>
	          </div>
          </div>
          
        </div>
      </div>
    </div>
   </div>
</main>
<footer  class="footer footer2team">
  <div class="container-fluid fix footer2con">
    <div class="row align-items-center justify-content-lg-between">
      <div class="col-lg-6 mb-lg-0 mb-4"></div>
      <div class="col-lg-6">
        <ul
                class="nav nav-footer justify-content-center justify-content-lg-end"
        >
          <li class="nav-item">
            <a href="" class="nav-link text-muted" target="_blank"
            >2team</a
            >
          </li>
          <li class="nav-item">
            <a href="" class="nav-link text-muted" target="_blank"
            >About Us</a
            >
          </li>
          <li class="nav-item">
            <a href="" class="nav-link text-muted" target="_blank"
            >Githup</a
            >
          </li>
          <li class="nav-item">
            <a href="" class="nav-link pe-0 text-muted" target="_blank"
            >License</a
            >
          </li>
        </ul>
      </div>
    </div>
  </div>
</footer>

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
</body>
</html>
