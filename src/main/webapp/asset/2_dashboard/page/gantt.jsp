<%@page import="java.sql.Date"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="db.dto.TaskDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
List<TaskDTO> tasks = (List<TaskDTO>) request.getAttribute("getTaskList");
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <link
          rel="apple-touch-icon"
          sizes="76x76"
          href="./assets/img/apple-icon.png"
  />
  <link rel="icon" type="image/png" href="./assets/img/favicon.png" />
  <title>2조 프로젝트</title>
  <!--     Fonts and icons     -->
  <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
          rel="stylesheet"
  />
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script
          src="https://kit.fontawesome.com/42d5adcbca.js"
          crossorigin="anonymous"
  ></script>
  <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link
          id="pagestyle"
          href="./assets/css/argon-dashboard.css?v=2.0.4"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
  />

  <style>
    .profile-container {
      margin-top:2px; /* 위쪽 마진 추가 */
    }
    .profile-container {
      margin-left: auto; /* 오른쪽 정렬을 위해 추가 */
    }

    .profile-photo-small {
      width: 36px;
      height: 36px;
      position: relative;
      overflow: hidden;
    }

    .profile-photo-small img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .profile-photo-small .default-icon {
      display: none;
      width: 100%;
      height: 100%;
      justify-content: center;
      align-items: center;
      font-size: 36px;
      color: #f1f1f1;
      background-color: transparent;
    }

    @media (max-width: 1199.98px) {
      /* xl 브레이크포인트 미만에서 적용 */
      .profile-container {
        margin-right: 15px; /* 모바일에서 오른쪽 여백 추가 */
      }
    }
  </style>

  <!-- 간트차트 스타일 -->
  <style>
  		* {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }
        .chartMenu {
            width: 100vw;
            height: 80px;
            color: rgba(54, 162, 235, 1);
        }
        .chartMenu p {
            padding: 10px;
            font-size: 20px;
        }
         
       .chartCard {
    position:relative;
    left:5em;
    top:5em;

    margin-right: auto;
    width: 100%;
    max-width: 80%;
    height: 60vh;
    overflow: hidden;
  }
    }
		.chartBox {
    		width: 80%; 
    		padding: 0px; 
    		border-radius: 20px;
    		border: solid 3px rgba(255,0,0,0); 
    		background: white;
		}
		
    .Task {
        max-width: 20%; 
        margin-top: 50px; 
        font-size: 15px; 
    }
    .Task input, .Task select, .Task button {
        width: 70%; /* Make inputs and buttons full width */
        margin-bottom: 10px; /* Add some space between elements */
        padding: 8px; /* Add padding for better touch targets */
        box-sizing: border-box; /* Ensure padding doesn't affect width */
    }
    
</style>
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<!-- 간트차트 시작 -->

<div class="col-12">
    <div class="card"> 
        <div class="row">
            <div class="chartCard"> 
                <canvas id="myChart"></canvas>
            </div>
            
            <div class="Task">
            <form action="${pageContext.request.contextPath}/dashProj?fn=Proj&proj_pk_num=${sessionScope.getProjDTO.proj_pk_num}" method="post">        
        <div class="form-group">
            <label for="proj_name">업무 명:</label><br>
            <input type="text" id="task_title" name="task_title" required>
        </div>
        
        <div class="form-group">
            <label for="task_startdate">시작일:</label><br>
            <input type="date" id="task_startdate" name="task_startdate" required>
        </div>
        
        <div class="form-group">
            <label for="task_enddate">마감일:</label><br>
            <input type="date" id="task_enddate" name="task_enddate" required>
        </div>
        
        <div class="form-group">
            <label for="task_status">업무 상태:</label><br>
            <select id="task_status" name="task_status" required>
                <option value="">선택하세요</option>
                <option value="예정">예정</option>
                <option value="진행중">진행중</option>
                <option value="완료">완료</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="task_desc">업무 중요도:</label><br>
            <select id="task_desc" name="task_desc" required>
                <option value="">선택하세요</option>
                <option value="낮음">낮음</option>
                <option value="보통">보통</option>
                <option value="중요">중요</option>
                <option value="긴급">긴급</option>
            </select>
        </div>
        
        <button type="submit">제출</button>
    </form>


                <select id="minTask" onchange="showTask()">
                    <option selected value="0">Task 1</option>
                    <option value="1">Task 2</option>
                    <option value="2">Task 3</option>
                    <option value="3">Task 4</option>
                </select>

                <select id="maxTask" onchange="showTask()">
                    <option value="4">Task 5</option>
                    <option value="5">Task 6</option>
                    <option value="6">Task 7</option>
                    <option selected value="7">Task 8</option>
                </select>
            </div>
            
        </div>
    </div>
</div>
    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>

    <script>
      const colours = [
        "rgba(255 ,26, 104, 1)",
        "rgba(255,159,64,1)",
        "rgba(75,192,192,1)",
      ];

      // setup
  const data = {
    
    datasets: [
        {
            label: "Tasks",
            data: [
            	<c:set var="taskCounter" value="0" />
                    <c:forEach var="task" items="${getTaskList}" varStatus="status">
                    
                        <c:set var="taskCounter" value="${taskCounter + 1}" />
                        {
                            x: [
                                "<fmt:formatDate value="${task.task_startdate}" pattern="yyyy-MM-dd"/>",
                                "<fmt:formatDate value="${task.task_enddate}" pattern="yyyy-MM-dd"/>"
                            ],
                            y: "Task ${taskCounter}",
                            name: "${task.task_title}",
                            status: <c:choose>
                                        <c:when test="${task.task_status eq '완료'}">2</c:when>
                                        <c:when test="${task.task_status eq '진행중'}">1</c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                        }<c:if test="${!status.last}">,</c:if>
            
                    </c:forEach>
            ],
            backgroundColor: (ctx) => {
                return colours[ctx.raw.status];
            },
            borderSkipped: false,
            borderRadius: 10,
            barPercentage: 0.5,
        },
    ],
};
      // todayLine plugin block
      const todayLine = {
        id: "todayLine",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            data,
            chartArea: { top, bottom, left, right },
            scales: { x, y },
          } = chart;

          ctx.save();

          if (
            x.getPixelForValue(new Date()) >= left &&
            x.getPixelForValue(new Date()) <= right
          ) {
            ctx.beginPath();
            ctx.lindWidth = 3;
            ctx.strokeStyle = "rgba(102,102,102,1)";
            ctx.setLineDash([6, 6]);
            ctx.moveTo(x.getPixelForValue(new Date()), top);
            ctx.moveTo(x.getPixelForValue(new Date()), bottom);
            ctx.stroke();
            ctx.restore();

            ctx.setLineDash([]);

            ctx.beginPath();
            ctx.lindWidth = 1;
            ctx.strokeStyle = "rgba(102,102,102,1)";
            ctx.fillStyle = "rgba(102,102,102,1)";
            ctx.moveTo(x.getPixelForValue(new Date()), top + 3);
            ctx.lineTo(x.getPixelForValue(new Date()) - 6, top - 6);
            ctx.lineTo(x.getPixelForValue(new Date()) + 6, top - 6);
            ctx.closePath();
            ctx.stroke();
            ctx.fill();

            ctx.font = "bold 12px sans-serif";
            ctx.fillStyle = "rgba(102,102,102,1)";
            ctx.texAlign = "center";
            ctx.fillText("Today", x.getPixelForValue(new Date()), bottom + 15);
          }
        },
      };

      // status plugin block

      const status = {
        id: "status",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            options,
            data,
            chartArea: { top, bottom, left, right },
            scales: { x, y },
          } = chart;
          const icons = ['\uf00d', '\uf110', '\uf00c']; // 아이콘
          const angle = Math.PI / 180;
          const paddingRight = options.layout.padding.right;

          ctx.save();
          ctx.font = "bolder 12px FontAwesome";
          ctx.fillStyle = "black";
          ctx.textBaseline = "middle";
          ctx.texAlign = "center";
          data.datasets[0].data.forEach((datapoint, index) => {
            if (
              y.getPixelForValue(index) > top &&
              y.getPixelForValue(index) < bottom
            ) {
              ctx.beginPath();
              ctx.fillStyle = colours[datapoint.status];
              ctx.arc(
                right + paddingRight / 2,
                y.getPixelForValue(index),
                12,
                0,
                angle * 360,
                false
              );
              ctx.closePath();
              ctx.fill();

              ctx.fillStyle = "white";
              ctx.fillText(
                icons[datapoint.status],
                right + paddingRight / 2.2,
                y.getPixelForValue(index)
              );
            }
          });
          ctx.font = "bolder 12px sans-serif";
          ctx.fillStyle = "black";
          ctx.fillText("Status", right + paddingRight / 2, top - 15);

          ctx.restore();
        },
      };

      // assignedTasks plugin block
      const assignedTasks = {
        id: "assignedTasks",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            data,
            chartArea: { top, bottom, left, right },
            scales: { x, y },
          } = chart;

          ctx.save();
          ctx.font = "bolder 12px sans-serif";
          ctx.fillStyle = "black";
          ctx.textBaseline = "middle";
          ctx.texAlign = "left";
          data.datasets[0].data.forEach((datapoint, index) => {
            ctx.fillText(datapoint.name, 10, y.getPixelForValue(index));
          });
          ctx.fillText("Name", 10, top - 15);
          ctx.restore();
        },
      };

      // weekend plugin block
      const weekend = {
        id: "weekend",
        beforeDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            chartArea: { top, bottom, left, right, width, height },
            scales: { x, y },
          } = chart;

          ctx.save();

          x.ticks.forEach((tick, index) => {
            const day = new Date(tick.value).getDay();
            console.log(day);
            if (day === 6 || day === 0) {
              ctx.fillStyle = pluginOptions.weekendColor;
              ctx.fillRect =
                (x.getPixelForValue(new Date(tick.value).setHours(24)) -
                  x.getPixelForValue(tick.value),
                height);
            }
          });
        },
      };

      // config
      const config = {
        type: "bar",
        data,
        options: {
          layout: {
            padding: {
              left: 100,
              right: 100,
              bottom: 20,
            },
          },
          indexAxis: "y",
          scales: {
            x: {
              position: "top",
              type: "time",
              time: {
                //unit: "day",
                displayFormats: {
                  day: "d",
                },
              },
              min: "2024-10-01",
              max: "2024-10-31",
            },
            y: {
              min: 3,
              max: 5,
              labels: [
                "Task 1",
                "Task 2",
                "Task 3",
                "Task 4",
                "Task 5",
                "Task 6",
                "Task 7",
                "Task 8",
                "Task 9",
              ],
            },
          },
          plugins: {
            weekend: {
              weekendColor: "rgba(102,102,102,0.2)",
            },
            legend: {
              display: false,
            },
            tooltip: {
              displayColors: false,
              yAlign: "bottom",
              callbacks: {
                label: (ctx) => {
                  return "";
                },
                title: (ctx) => {
                  const startDate = new Date(ctx[0].raw.x[0]);
                  const endDate = new Date(ctx[0].raw.x[1]);
                  const formattedStartDate = startDate.toLocaleDateString([], {
                    year: "numeric",
                    month: "short",
                    day: "numeric",
                  });
                  const formattedEndDate = startDate.toLocaleDateString([], {
                    year: "numeric",
                    month: "short",
                    day: "numeric",
                  });
                  return [
                    ctx[0].raw.name,
                    `Task Deadline : ${formattedStartDate} - ${formattedEndDate}`,
                  ];
                },
              },
            },
          },
        },
        plugins: [todayLine, assignedTasks, status, weekend],
      };

      // render init block
      const myChart = new Chart(document.getElementById("myChart"), config);
	
      function addTask() {
          const nameTask = document.getElementById("nameTask");
          const startDateTask = document.getElementById("startDateTask");
          const endDateTask = document.getElementById("endDateTask");
          const teamMemberTask = document.getElementById("teamMemberTask");
          const statusTask = document.getElementById("statusTask");

          const arrayLength = myChart.data.datasets[0].data.length;
          myChart.data.datasets[0].data.push({
            // Use push to add new data
            x: [startDateTask.value, endDateTask.value],
            y: nameTask.value,
            name: teamMemberTask.value,
            status: parseInt(statusTask.value),
          });

          addNames();
          myChart.update();

          // const arrayLength = myChart.data.datasets[0].data.length;
          // myChart.data.datasets[0].data[arrayLength]({x: [startDateTask.value,endDateTask.value], y:nameTask.value, name: teamMemberTask.value, status: parseInt(statusTask.value)});
          // console.log(myChart.data.datasets);
          // myChart.update();
        }
      function addNames() {
          const names = document.getElementById("names");

          console.log(names.firstElementChild);
          while (names.firstElementChild) {
            names.removeChild(names.firstElementChild);
          }

          const namesArray = myChart.data.datasets[0].data.map((datapoint) => {
            return datapoint.name;
          });

          const namesArrayFilter = [...new Set(namesArray)];

          namesArray.forEach((memberName) => {
            const option = document.createElement("option");
            option.value = memberName;
            names.appendChild(option);
          });
        }
        addNames();
        
       
      function showTask() {
        const yScale = myChart.config.options.scales.y;
        const minTask = document.getElementById("minTask").value;
        const maxTask = document.getElementById("maxTask").value;
        yScale.min = yScale.labels[minTask];
        yScale.max = yScale.labels[maxTask];
        myChart.update();
      }
    </script>
  
<!-- 간트차트 끝 -->
</main>

<!--   Core JS Files   -->
<script src="./assets/js/core/popper.min.js"></script>
<script src="./assets/js/core/bootstrap.min.js"></script>
<script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
<script src="./assets/js/plugins/chartjs.min.js"></script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>
</html>
