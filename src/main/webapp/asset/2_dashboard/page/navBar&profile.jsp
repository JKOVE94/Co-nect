<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<html>

	<body>
		<div class="min-height-300 bg-primary position-absolute w-100"></div>

		<div class="sidenav-logo-container">
			<a class="navbar-brand m-0" href="<%=request.getContextPath()%>/dashboard?fn=HOME"><img
					src="asset/1_landing/co-nect logo + text (w).svg" alt="Logo" class="sidenav-logo"
					style="margin-top: -0.75rem"></a>
		</div>

		<aside
			class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl  fixed-start ms-4 "
			id="sidenav-main">
			<!-- 사이드바 제목(로고) -->
			<div class="sidenav-header">
				<i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
					aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
					href="<%=request.getContextPath()%>/dashboard?fn=HOME"> <img
						src="asset/1_landing/co-nect logo + text (1E74B1).svg" class="navbar-brand-img h-100"
						alt="main_logo"> <span class="ms-1 font-weight-bold">(주)코난2조</span>
				</a>
			</div>

			<hr class="horizontal dark mt-0">

			<div class="collapse navbar-collapse  w-auto h-auto" id="sidenav-collapse-main">
				<!-- 사이드 바 하위 항목 시작 -->
				<ul class="navbar-nav">
					<!-- 1) 즐겨찾기 -->
					<li class="nav-item"><a class="nav-link active" data-bs-toggle="collapse"
							data-bs-target="#favorites-collapse" aria-expanded="false" id="resourceManager">
							<div
								class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
								<i class="bi bi-star text-primary text-sm opacity-10"></i>
							</div> <span class="nav-link-text ms-1">즐겨찾기</span>
						</a> <!-- 즐겨찾기 하위 메뉴 ( 프로젝트 ) -->
						<div class="collapse" id="favorites-collapse">
							<ul>
								<li style="list-style: none; text-align: center;"><a class="nav-link"
										href="<%=request.getContextPath()%>/favorites?fn=FAVOR_PROJLIST">
										프로젝트 </a></li>
							</ul>
							<ul>
								<li style="list-style: none; text-align: center;"><a class="nav-link"
										href="<%=request.getContextPath()%>/favorites?fn=FAVOR_POSTLIST">
										자유게시판 </a></li>
							</ul>
						</div>
					</li>

					<!-- 2) 프로젝트 -->
					<li class="nav-item"><a class="nav-link active"
							href="<%=request.getContextPath()%>/prototype/virtual-reality.html"
							data-bs-toggle="collapse" data-bs-target="#project-collapse" aria-expanded="false"
							id="resourceManager">
							<div
								class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
								<i class="ni ni-app text-info text-sm opacity-10"></i>
							</div> <span class="nav-link-text ms-1">프로젝트</span>
						</a> <!-- 프로젝트 하위 메뉴 -->
						<div class="collapse" id="project-collapse">
							<ul>
								<li style="list-style: none; text-align: center;"><a class="nav-link"
										href="<%=request.getContextPath()%>/dashboard?fn=PROJ_LIST">
										프로젝트 목록 </a></li>
							</ul>
						</div>

					</li>

					<!-- 3) 게시판 -->
					<li class="nav-item"><a class="nav-link active" data-bs-toggle="collapse"
							data-bs-target="#board-collapse" aria-expanded="false" id="resourceManager">
							<div
								class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
								<i class="ni ni-credit-card text-success text-sm opacity-10"></i>
							</div> <span class="nav-link-text ms-1">게시판</span>
						</a> <!-- 게시판 하위 메뉴 -->
						<div class="collapse" id="board-collapse">
							<ul>

								<li style="list-style: none; text-align: center;"><a class="nav-link"
										href="<%=request.getContextPath()%>/dashboard?fn=FREE_LIST">
										자유 게시판 </a></li>
							</ul>
						</div>
					</li>


					<!-- 4) 업무 관리 -->
					<li class="nav-item"><a class="nav-link active" data-bs-toggle="collapse"
							data-bs-target="#works-collapse" aria-expanded="false" id="resourceManager">
							<div
								class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
								<i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
							</div> <span class="nav-link-text ms-1">업무 관리</span>
						</a> <!-- 업무관리 하위 메뉴 -->
						<div class="collapse" id="works-collapse">
							<ul>
								<li style="list-style: none; text-align: center;"><a class="nav-link"
										href="${pageContext.request.contextPath}/calendar?fn=PAGE">
										일정 관리 </a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</aside>

		<main class="main-content position-relative border-radius-lg">

			<!-- Navbar -->

			<nav style="padding-top: 17px;"
				class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur"
				data-scroll="false">
				<div class="container-fluid py-1 px-3">
					<div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
						<div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
						<ul class="navbar-nav align-items-center ml-auto">
							<li class="nav-item d-xl-none ps-3 d-flex align-items-center">
								<a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
									<div class="sidenav-toggler-inner">
										<i class="sidenav-toggler-line bg-white"></i> <i
											class="sidenav-toggler-line bg-white"></i> <i
											class="sidenav-toggler-line bg-white"></i>
									</div>
								</a>
							</li>
							<li class="nav-item px-3 d-flex align-items-center profile-container">
								<a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton"
									data-bs-toggle="dropdown" aria-expanded="false">
									<div class="profile-photo-small">
										<img src="path/to/profile-photo.jpg" alt="프로필 사진" class="rounded-circle"
											onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
										<i class="bi bi-person-circle default-icon"></i>
									</div>
								</a>
								<ul class="dropdown-menu dropdown-menu-end px-2 py-1 me-sm-5"
									aria-labelledby="dropdownMenuButton">
									<li class="mb-2"><a class="dropdown-item border-radius-md"
											href="<%=request.getContextPath()%>/prototype/profile.jsp">
											<div class="d-flex py-1">
												<div class="my-auto">
													<i
														class="bi bi-person-circle avatar avatar-sm bg-white text-dark me-3"></i>
												</div>
												<div class="d-flex flex-column justify-content-center">
													<h6 class="text-sm font-weight-normal mb-1">
														<span class="font-weight-bold" style="">마이 페이지</span>
													</h6>
													<p class="text-xs text-secondary mb-0">
														<i class="bi bi-bell me-1"></i> 1 new
													</p>
												</div>
											</div>
										</a></li>
									<li class="mb-2"><a class="dropdown-item border-radius-md"
											href="${pageContext.request.contextPath}/manage?fn=ADMIN_MANAGE">
											<div class="d-flex py-1">
												<div class="my-auto">
													<i
														class="bi bi-gear-fill avatar avatar-sm bg-white text-dark me-3"></i>
												</div>
												<div class="d-flex flex-column justify-content-center">
													<h6 class="text-sm font-weight-normal mb-1">
														<span class="font-weight-bold" style="color: black">관리자
															페이지</span>
													</h6>
													<p class="text-xs text-secondary mb-0">
														<i class="bi bi-bell me-1"></i> 1 new
													</p>
												</div>
											</div>
										</a></li>
								</ul>
					</div>
				</div>
			</nav>
	</body>

	</html>