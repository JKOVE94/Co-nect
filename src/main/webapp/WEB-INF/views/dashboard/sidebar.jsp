<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body class="g-sidenav-show bg-gray-100">

	<div class="min-height-300 bg-primary position-absolute w-100"></div>
		<!-- 팀 메인 로고 -->
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
          
          <!-- 회사 이름 및 로고 -->
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
                  <a class="nav-link" href="<%=request.getContextPath()%>/dashboard?fn=FREE_LIST">
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
</body>
</html>