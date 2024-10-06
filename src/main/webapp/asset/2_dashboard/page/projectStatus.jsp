<%@page import="db.dto.ProjectDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 사번으로 유저정보를 찾을 수 있는 Map -->
<c:set var="umap" value="${sessionScope.getUserNameMap}" />
<!-- 부가적인 proj 기능 Map / RD : remain Date, PG : Progress -->
<c:set var="fnmap" value="${sessionScope.projSubFn}" />
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-12 px-0">
				<div class="card mx-auto" style="max-width: 98%;">
					<div class="card-body p-3">
						<div class="row mx-0">
							<!-- 프로젝트 번호 -->
							<div class="col-md-2 px-2">
								<!-- 너비 감소 -->
								<div class="numbers">
									<p class="text-sm mb-0 text-uppercase font-weight-bold">
										프로젝트 번호</p>
									<h5 class="font-weight-bolder">${sessionScope.getProjDTO.proj_pk_num}
									</h5>
									<p class="mb-0">
										<span class="text-success text-sm font-weight-bolder">등록일:</span>
										${sessionScope.getProjDTO.proj_created}
									</p>
								</div>
							</div>

							<!-- 프로젝트 제목 -->
							<div class="col-md-4 px-2">
								<!-- 너비 증가 -->
								<div class="numbers">
									<p class="text-sm mb-0 text-uppercase font-weight-bold">
										프로젝트 제목</p>
									<h5 class="font-weight-bolder mb-2">${sessionScope.getProjDTO.proj_name}
									</h5>
									<p class="mb-0">
										<span class="text-success text-sm font-weight-bolder">상태:</span>
										${sessionScope.getProjDTO.proj_status}
									</p>
								</div>
							</div>

							<!-- 담당자, 마감일자, 진행도 -->
							<div class="col-md-6 px-2">
								<div class="row mx-0">
									<div class="col-md-4 px-1">
										<div class="numbers">
											<p class="text-sm mb-0 text-uppercase font-weight-bold">
												담당자</p>
											<h5 class="font-weight-bolder">${umap[sessionScope.getProjDTO.proj_fk_user_num.toString()]}</h5>
											<p class="mb-0">
												<span class="text-success text-sm font-weight-bolder">직책:</span>
												프로젝트 매니저
											</p>
										</div>
									</div>
									<div class="col-md-4 px-1">
										<!-- 마감일자 섹션 너비 유지 -->
										<div class="numbers">
											<p class="text-sm mb-0 text-uppercase font-weight-bold">
												마감일자</p>
											<h5 class="font-weight-bolder">${sessionScope.getProjDTO.proj_enddate}</h5>
											<p class="mb-0">
												<span class="text-warning text-sm font-weight-bolder">남은
													기간:</span> ${fnmap['RD']}
											</p>
										</div>
									</div>
									<div class="col-md-4 px-1">
										<div class="numbers">
											<p class="text-sm mb-0 text-uppercase font-weight-bold">
												진행도</p>
											<h5 class="font-weight-bolder"> ${fnmap['PG']}</h5>
											<p class="mb-0">
												<span class="text-primary text-sm font-weight-bolder">상태:</span>
												${sessionScope.getProjDTO.proj_status}
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>