<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top: -8px;" class="container-fluid py-4">
        <div class="row">
          <div class="col-12">
            <div class="card mb-4">
              <div class="card-header pb-0">
                <button type="button" class="btn btn-primary" style="float: right; position: relative" onclick="location.href='${pageContext.request.contextPath}/dashboard?fn=PROJ_POST'"> 프로젝트 생성</button>
                <h6>프로젝트 목록</h6>
              </div>
              <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                  <c:set var="Nmap" value="${sessionScope.getUserNameMap}"/>
                  <c:set var="Mmap" value="${sessionScope.getUserMailMap}"/>
                  <table
                    class="table align-items-center justify-content-center mb-0"
                  >
                    <thead>
                      <tr>
                        <th
                          class="w-20 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                        >
                          프로젝트
                        </th>
                        <th
                          class="w-20 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                          담당자
                        </th>
                        <th
                          class="w-15 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                          상태
                        </th>
                        <th
                          class="w-15 text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                          기한
                        </th>
                        <th
                          class="w-20 text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2"
                        >
                          진행도
                        </th>
                        <th class="w-10"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <c:forEach var="l" items="${sessionScope.list}">
                        <td>
                          <div class="d-flex px-2">
                            <!-- 프로젝트 아이콘 -->
                            <div>
                              &nbsp;<span  class="${l.proj_icon}" style="color:${l.proj_tagcol}"></span> &nbsp;
                            </div>
                            <div class="my-auto">
                              <a href="${pageContext.request.contextPath}/dashboard?fn=PROJ_READ&proj_pk_num=${l.proj_pk_num}">
                                <!-- 프로젝트 명 -->
                                <h6 class="mb-0 text-sm">${l.proj_name}</h6>
                              </a>
                            </div>
                          </div>
                        </td>
                        <td>
                          <!-- 프로젝트 담당자 -->
                          <h6 class="mb-0 text-sm">
                              ${Nmap[l.proj_fk_user_num.toString()]}
                          </h6>
                          <p class="text-xs text-secondary mb-0">
                            <!-- 프로젝트 담당자 이메일 -->
                              ${Mmap[l.proj_fk_user_num.toString()]}
                          </p>
                        </td>
                        <td>
                          <!-- 프로젝트 상태 -->
                          <span class="text-xs font-weight-bold">${l.proj_status}</span>
                        </td>
                        <td>
                          <span class="text-xs font-weight-bold">
                            <!-- 프로젝트 마감일 -->
                            ${l.proj_enddate}</span>
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
                          <a href="projRead.jsp">
                            <button class="btn btn-link text-secondary mb-0">
                              <i class="fa fa-ellipsis-v text-xs"></i>
                            </button>
                          </a>
                        </td>
                      </tr>
                      </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>