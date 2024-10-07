<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.center{
text-align:center;
}
</style>
</head>
<body>
<c:set var="Nmap" value="${sessionScope.getUserNameMap}"/>
 <div class="container-fluid">
  <div class="row">
   <!-- 게시판 -->
   <div class="col-lg-7">
    <div class="card custom-card">
     <div class="card ">
      <div class="table-responsive pb-0 p-3">
       <div class="d-flex justify-content-between align-items-center mb-3">
        <h6 class="mb-0 ms-4">게시판</h6>
        <a href="<%=request.getContextPath()%>/dashboard?fn=FREE_LIST">
         <button style="margin-top: 1rem" id="" class="btn btn-outline-primary btnview btn-sm">더 보기</button>
        </a>
       </div>
      </div>
      <div style="margin-left: 1rem; margin-top: -1rem;" class="card-body p-3">

         <div class="d-flex align-items-center ">
          <div class="d-flex flex-column m-1" style="width:50rem;">
           <table  class="table align-items-center custom-table">
            <thead>
             <tr>
              <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 " >글 번호</th>
              <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 " >제목</th>
              <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 " >작성자</th>
              <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 " >등록일</th>
              <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 " >조회수</th>
             </tr>
            </thead>
            <tbody>
             <c:forEach var="l" items="${AllPost}" begin="0" end="4" step="1">
              <tr>
               <td class="center">${l.post_pk_num}</td>
               <td><a href="<%=request.getContextPath()%>/dashboard?fn=FREE_READ&post_pk_num=${l.post_pk_num}">${l.post_name}</a></td>
               <td class="center">${Nmap[l.post_fk_user_num.toString()]}</td>
               <td class="center">${l.post_regdate}</td>
               <td class="center">${l.post_view}</td>
              </tr>
             </c:forEach>
            </tbody>
           </table>
          </div>
         </div>
             
      </div>
     </div>
    </div>
   </div>
   <!-- 이번주 나의 업무 -->
   <div class="col-lg-5">
    <div style="height: 100%;" class="card custom-card">
     <div class="card-header pb-0 p-3">
      <div class="d-flex justify-content-between align-items-center mb-3">
       <h6 class="mb-0 ms-4">이번 주 나의 업무</h6>
       <a href="<%=request.getContextPath()%>/calendar?fn=PAGE">
        <button class="btn btn-outline-primary btnview btn-sm">더 보기</button>
       </a>
      </div>
     </div>
     <div style="margin-top: -1rem;" id="cardContent" class="card-body p-3">
      <div class="table-responsive">
       <table class="table align-items-center custom-table">
        <tbody id="taskList">
         <c:forEach var="t" items="${AllTodo}">
          <tr>
           <td>${t.todo_pk_num}</td>
           <td>${t.todo_title}</td>
           <td>${t.todo_content}</td>
          </tr>
         </c:forEach>
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