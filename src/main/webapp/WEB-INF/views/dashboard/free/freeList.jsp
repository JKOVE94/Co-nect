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
<%@ page import="db.dto.PostDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://kit.fontawesome.com/b40496895d.js" crossorigin="anonymous"></script>
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="./assets/img/apple-icon.png"
    />
    <link rel="icon" type="image/png" href="./assets/img/favicon.png" />
    <title>게시판</title>
    
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
    	td {
    		text-align : center;
    	}
    </style>
    
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
                    <a class="nav-link" href="<%=request.getContextPath()%>/dashboard?fn=PROJ_LIST">
                      프로젝트       
                    </a>
                  </li>
              </ul>
            </div>
          </li>
          
          <!-- 2) 프로젝트 -->
          <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="collapse"
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
                  <a class="nav-link" href="<%=request.getContextPath()%>/dashboard?fn=PROJ_LIST">
                    프로젝트 개요    
                  </a>
                </li>
              </ul>
            </div>
            
            <div class="collapse" id="project-collapse">
              <ul>
                <li style="list-style: none; text-align: center;">
                  <a class="nav-link" href="details.jsp">
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
                    <a class="nav-link" href="<%=request.getContextPath()%>/calendar/tables.jsp">
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
              <div class="card-header pb-0 d-flex justify-content-between align-items-center mb-3">
                <div class="d-flex justify-content-center" style="padding-left: 0%;">
              		<h5 class="mb-0">사내 게시판</h5>  
              	</div>
              
              <!-- 검색 기능 -->
      <form action="${pageContext.request.contextPath}/dashboard?fn=FREE_LIST" name="search" method="post">
			<table border=0 width=527 align=right cellpadding=4 cellspacing=0>
				<tr>
						<td align=right valign=bottom>
							<select name="keyField" size="1">
								<option value="post_name"> 제목
								<option value="user_name"> 작성자
							</select>
						<input type="text" size="20" name="keyWord" placeholder="검색어를 입력하세요" required="required" >
						<!-- input type="submit" value="검색" onClick="check()"-->
						<button class="search-btn" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
						</td>
				</tr>
			</table>
		</form>
		</div>
              
         <!-- 페이징 기능 구현 -->
		<jsp:useBean id="dao" class="model.dashboard.Free_List"/>
		<%
		request.setCharacterEncoding("utf-8");
		
		// 페이징에 필요한 변수들
		int totalRecord = 0; 	// 총 글의 갯수
		int numPerPage = 8; 	// 한 페이지당 보여질 글의 갯수
		int totalPage = 0; 		// 총 페이지 수
		int nowPage = 1; 		// 현재 페이지
		int beginPerPage = 0;	// 페이지별 시작번호
		int pagePerBlock = 5;	// 블럭당 페이지 수 여러 페이지를 하나로 묶은 단위
		int totalBlock = 0;		// 총 블럭 수
		int nowBlock = 0;		// 현재 블럭
		
		
		ArrayList<PostDTO> list = (ArrayList)session.getAttribute("list");
		
		// 총 글의 수 계산 
		totalRecord = list.size();
		// 전체 페이지 수
		totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // 페이지를 소수로 나눈 후 그것을 정수형으로 변경해서 페이지 갯수 구하기
		
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage")); // 문자열 이기 때문에 정수형으로 변환
		}
		
		nowPage = (nowPage < 1) ? 1: ( nowPage > totalPage) ? totalPage : nowPage;
		
		// 현재 페이지에서 보여줄 글의 시작 인덱스 계산
		beginPerPage = (nowPage -1) * numPerPage;
		
		// 총 블록 수 계산
		totalBlock = (int)Math.ceil((double) totalPage / pagePerBlock);
		
		if(request.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(request.getParameter("nowBlock")); // 문자열 이기 때문에 정수형으로 변환
		}
		
		// 현재 블록의 페이지 목록을 세팅
    if(list.size()>=1){
		 ArrayList<PostDTO> currentPageList = new ArrayList<>(list.subList(beginPerPage, Math.min(beginPerPage + numPerPage, totalRecord)));
		 session.setAttribute("list", currentPageList);
		}
	
		%>
			<div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
              <!-- 테이블 가운데정렬, margin bottom: 0 -->
                <table class="table align-items-center justify-content-center mb-0">
                  <thead>
	                  <!-- 열의 너비 정하기 (왼쪽에서부터 순서대로) -->
	                  <colgroup>
	                  	<col style="width:70px;">
	                  	<col style="width:30px;">
	                  	<col style="width:700px;">
	                  	<col style="width:200px;">
	                  	<col style="width:400px;">
	                  </colgroup>
                  
                    <tr>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        번호
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                        즐겨찾기
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                        제목
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                        작성자
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                        등록일
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                        조회수
                      </th>
                    </tr>
                  </thead>
                  
                  <tbody>
				<c:forEach var="l" items="${sessionScope.list}">
					<tr>
						<!-- post_pk_num -->
						<td style="padding-left: 50px;" >${l.post_pk_num}</td>
						<!-- 즐겨찾기 등록 여부 -->
						<td>
							<input type="checkbox" id="favorite" class="favorite" value="${l.post_pk_num }"
							<c:if test="${l.favoriteCheck == true}">
						 	 checked
						  	</c:if>>
						</td>
						<!-- post_name -->
						<td><a href="<%=request.getContextPath()%>/dashboard?fn=FREE_READ&post_num=${l.post_pk_num}">${l.post_name}</a></td>
						<!-- post_fk_user_num -->
						<td>${l.post_fk_user_num}</td>
						<!-- post_regdate -->
						<td>${l.post_regdate}</td>
						<!-- post_view -->
						<td>${l.post_view}</td>		
					</tr>
				</c:forEach>
				</tbody>
                </table>      
              </div>
              <a href="${pageContext.request.contextPath}/dashboard?fn=" class="btn btn-primary mt-3" style="margin-left: 20px;">새 게시글 작성</a>
			<a href="<%=request.getContextPath()%>/dashboard?fn=HOME" class="btn btn-primary mt-3" style="margin-left: 10px;">메인으로 돌아가기</a>
            </div> <!-- 테이블 끝 -->
            
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
        </div>
      </div>
    </div>
    
    	<!-- 페이지 이동 링크 -->
    	<div>
        	<ul class="pagination justify-content-center">
            <!-- 이전 블럭으로 이동 -->
	            <% if (nowBlock > 0) { %>
	                <li class="page-item">
	                    <a class="page-link" href=
	                    "${pageContext.request.contextPath}/dashboard?fn=FREE_LIST&nowPage=<%= (nowBlock-1) * pagePerBlock + 1%>&nowBlock=<%=nowBlock-1%>">
	                    Prev
	                    </a>
	                </li>
	            <% } %>

            <!-- 블럭 내 페이지 링크 표시 -->
	            <%
	                for (int i = 0; i < pagePerBlock; i++) {
	                    int pageNum = nowBlock * pagePerBlock + i + 1;
	                    if (pageNum > totalPage) break;
	            %>
	                <li class="page-item <%= (pageNum == nowPage) ? "active" : "" %>">
	                    <a class="page-link" href=
	                    "${pageContext.request.contextPath}/dashboard?fn=FREE_LIST&nowPage=<%=pageNum%>&nowBlock=<%=nowBlock%>">
	                    <%=pageNum%></a>
	                </li>
	            <% } %>

            <!-- 다음 블럭으로 이동 -->
	            <% if (nowBlock < totalBlock - 1) { %>
	                <li class="page-item">
	                    <a class="page-link" href=
	                    "${pageContext.request.contextPath}/dashboard?fn=FREE_LIST&nowPage=<%=(nowBlock+1) * pagePerBlock + 1 %>&nowBlock=<%= nowBlock+1 %>">
	                    >
	                    </a>
	                </li>
	            <% } %>
	        </ul>   
    	</div>  	
    <script>
      var win = navigator.platform.indexOf("Win") > -1;
      if (win && document.querySelector("#sidenav-scrollbar")) {
        var options = {
          damping: "0.5",
        };
        Scrollbar.init(document.querySelector("#sidenav-scrollbar"), options);
      }
    </script>
    
    <script>
    
	//즐겨찾기 버튼 check 시 즐겨찾기 등록 command, check 해제 시 즐겨찾기 해제 command로 이동하게 함
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
	</script>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
    <!--   Core JS Files   -->
    <script src="./assets/js/core/popper.min.js"></script>
    <script src="./assets/js/core/bootstrap.min.js"></script>
    <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
    
    
  </body>
</html>
