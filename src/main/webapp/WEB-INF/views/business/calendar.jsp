<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="module">
	
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
		  footerToolbar:{
			center:'addEventButton'
		  },
		  eventSources : [{
				events : function(info, successCallback, failureCallback){
					$.ajax({
							url : '${pageContext.request.contextPath}/calendar?fn=GET',
							type : 'POST',
							dataType : 'json',
							success: function(data) {
								successCallback(data);
							}
					});
				}
		  }],
		  customButtons : {
			addEventButton: {
				text:'일정추가',
				click: function(){
					const titleText = document.getElementById('title').value;
					const startDate = document.getElementById('startDate').value;
					const endDate = document.getElementById('endDate').value;
					const requestData = {
											title:titleText, 
											start : startDate, 
											end : endDate
										};
					calendar.addEvent({
						title : titleText,
						start : startDate, 
						end : endDate
					});

					$.ajax({
						url : '${pageContext.request.contextPath}/calendar?fn=SET',
						type:'POST',
						data : JSON.stringify(requestData),
						contentType: 'application/json; charset=utf-8'
					})

					document.getElementById('title').value = '';
					document.getElementById('startDate').value = '';
					document.getElementById('endDate').value = '';
				}
			 }
		  },
		  dayMaxEventRows: true,
        });
        calendar.render();
      });
	  
	

    </script>
  </head>
  <body>
    <div id='calendar' style="width:800px;height:800px;">
    	
   </div>
   <div style="margin-top:30px;">
	    <label for="title">제목</label>
	    <input type="text" id="title"/>
	    	
	    <label for="startDate">시작날짜</label>
	    <input type="datetime-local" id="startDate"/>
	    	
	    <label for="endDate">종료날짜</label>
	    <input type="datetime-local" id="endDate"/>
    	
    </div>
  </body>
</html>