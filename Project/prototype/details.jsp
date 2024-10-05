<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>프로젝트 차트</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 100px; }
    </style>
</head>
<body>
    <div class="chartCard">
        <div class="chartBox">
            <canvas id="myChart"></canvas>
            <input type="month" onchange="chartFilter(this)" />
        </div>
    </div>
    
    <hr>
    
    <form action="${pageContext.request.contextPath}/dashProj?fn=Proj" method="post">
        <input type="hidden" name="action" value="create"/>
        <input type="hidden" name="proj_tag" value="red"/>
        <input type="hidden" name="proj_tagcol" value="red"/>
        <input type="hidden" name="proj_fk_comp_num" value="1"/>
        <input type="hidden" name="proj_fk_post_num" value="26"/>
        
        <div class="form-group">
            <label for="proj_name">프로젝트 이름:</label>
            <input type="text" id="task_title" name="task_title" required>
        </div>
        
        <div class="form-group">
            <label for="task_startdate">시작일:</label>
            <input type="date" id="task_startdate" name="task_startdate" required>
        </div>
        
        <div class="form-group">
            <label for="task_enddate">마감일:</label>
            <input type="date" id="task_enddate" name="task_enddate" required>
        </div>
        
        <div class="form-group">
            <label for="task_status">프로젝트 상태:</label>
            <select id="task_status" name="task_status" required>
                <option value="">선택하세요</option>
                <option value="예정">예정</option>
                <option value="진행중">진행중</option>
                <option value="완료">완료</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="task_desc">프로젝트 중요도:</label>
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

    <script>
        // 차트 관련 JavaScript 코드
        const ctx = document.getElementById('myChart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        function chartFilter(date) {
            console.log(date.value);
        }
    </script>
</body>
</html>