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
 <div style="margin-top: -1.5rem" class="container-fluid">
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
              <th class="text-center text-secondary text-xs font-weight-bolder opacity-7 " >글 번호</th>
              <th class="text-center text-secondary text-xs font-weight-bolder opacity-7 " >제목</th>
              <th class="text-center text-secondary text-xs font-weight-bolder opacity-7 " >작성자</th>
              <th class="text-center text-secondary text-xs font-weight-bolder opacity-7 " >등록일</th>
              <th class="text-center text-secondary text-xs font-weight-bolder opacity-7 " >조회수</th>
             </tr>
            </thead>
            <tbody>
             <c:forEach var="l" items="${AllPost}" begin="0" end="4" step="1">
              <tr>
                <td class="center">
                	<h6 class="text-sm mb-0">${l.post_pk_num}</h6>
                </td>
                <td><a href="<%=request.getContextPath()%>/dashboard?fn=FREE_READ&post_pk_num=${l.post_pk_num}">
                	<h6 class="text-sm mb-0">${l.post_name}</h6>
                </a></td>
                <td class="center">
                	<h6 class="text-sm mb-0">${Nmap[l.post_fk_user_num.toString()]}</h6>
                </td>
                <td class="center">
                	<h6 class="text-sm mb-0">${l.post_regdate}</h6>
                </td>
                <td class="center">
                 <h6 class="text-sm mb-0">${l.post_view}</h6>
                </td>
               
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
           	<td><i style="color: ${t.todo_tagcol};" class="bi" data-icon="${t.todo_icon}"></i></td>
			<td>
			 <div class="ms-4">
              <p class="text-xs font-weight-bold mb-0">업무 번호:</p>
              <h6 class="text-sm mb-0">${t.todo_pk_num}</h6>
             </div>
			</td>
			<td>
			 <div class="ms-4">
              <p class="text-xs font-weight-bold mb-0">업무:</p>
              <h6 class="text-sm mb-0">${t.todo_title}</h6>
             </div>
			</td>
			<td>
			 <div class="ms-4">
              <p class="text-xs font-weight-bold mb-0">마감일:</p>
              <h6 class="text-sm mb-0">${t.todo_end}</h6>
             </div>
			</td>
			<td>
			<div class="ms-4">
              <p class="text-xs font-weight-bold mb-0">내용:</p>
              <h6 class="text-sm mb-0">${t.todo_content}</h6>
             </div>
			</td>
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
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	  function getTaskIcon(number) {
	    const iconMap = {
	      1: 'bi-list-task',
	      2: 'bi-clipboard',
	      3: 'bi-calendar',
	      4: 'bi-check-circle',
	      5: 'bi-alarm',
	      6: 'bi-file-earmark-text',
	      7: 'bi-clock'
	    };
	    return iconMap[number] || 'bi-question-circle-fill';
	  }

	  document.querySelectorAll('i[data-icon]').forEach(icon => {
	    const iconNumber = icon.getAttribute('data-icon');
	    icon.classList.add(getTaskIcon(iconNumber));
	  });
	});
</script>
</html>