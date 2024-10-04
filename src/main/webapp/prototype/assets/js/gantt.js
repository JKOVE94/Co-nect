const colours = [
        "rgba(255 ,26, 104, 1)", //상태 0 색상
        "rgba(255,159,64,1)", //상태 1
        "rgba(75,192,192,1)", //상태 2
      ];

      // 데이터 설정
      const data = {
        //  labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        datasets: [
          {
            label: "Weekly Sales",
            data: [
              {
				//(x: 기간, y : 작업, name ; 담당자, status : 상태)
                x: ["2024-10-03", "2024-10-06"],
                y: "Task 1",
                name: "James",
                status: 2,
              },
              {
                x: ["2024-10-06", "2024-10-12"],
                y: "Task 2",
                name: "Luna",
                status: 2,
              },
              {
                x: ["2024-10-09", "2024-10-12"],
                y: "Task 3",
                name: "David",
                status: 2,
              },
              {
                x: ["2024-10-12", "2024-10-21"],
                y: "Task 4",
                name: "Lilly",
                status: 1,
              },
              {
                x: ["2024-10-15", "2024-10-24"],
                y: "Task 5",
                name: "Santiago",
                status: 0,
              },

              {
                x: ["2024-10-18", "2024-10-30"],
                y: "Task 6",
                name: "James",
                status: 1,
              },
              {
                x: ["2024-11-12", "2024-11-21"],
                y: "Task 7",
                name: "Lilly",
                status: 1,
              },
              {
                x: ["2024-11-15", "2024-11-24"],
                y: "Task 8",
                name: "Santiago",
                status: 0,
              },
              {
                x: ["2024-11-18", "2024-11-30"],
                y: "Task 9",
                name: "James",
                status: 1,
              },
            ],
            backgroundColor: (ctx) => {
			  //상태에 따른 막대 배경색 설정
              return colours[ctx.raw.status];
            },

            borderSkipped: false, //막대 경계선
            borderRadius: 10, // 막대 테두리 
            barPercentage: 0.5, //막대 너비 설정
          },
        ],
      };

      // 오늘 날짜 나타내는 라인 플러그인
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

		  // 현재 날짜에 해당하는 위치에 선 그리기
          if (
            x.getPixelForValue(new Date()) >= left &&  // 오늘 날짜가 왼쪽 경계 안에 있는지 확인
            x.getPixelForValue(new Date()) <= right // 오늘 날짜가 오른쪽 경계 안에 있는지 확인
          ) {
            ctx.beginPath(); // 새로운 경로 시작
            ctx.lineWidth = 3; // 선 굵기 설정
            ctx.strokeStyle = "rgba(102,102,102,1)"; // 선 색상 설정
            ctx.setLineDash([6, 6]); //대쉬 스타일 설정
            ctx.moveTo(x.getPixelForValue(new Date()), top); // 현재 날짜의 x좌표에서 위쪽으로 선 시작
            ctx.moveTo(x.getPixelForValue(new Date()), bottom);  // 현재 날짜의 x좌표에서 아래쪽으로 선 끝
            ctx.stroke(); // 선 그리기
            ctx.restore(); // 상태 복원

			// 오늘 날짜 텍스트 표시
            ctx.setLineDash([]); // 대쉬 스타일 초기화
            ctx.beginPath();
            ctx.lineWidth = 1;
            ctx.strokeStyle = "rgba(102,102,102,1)";
            ctx.fillStyle = "rgba(102,102,102,1)"; // 화살표 채우기 색상 설정
            ctx.moveTo(x.getPixelForValue(new Date()), top + 3); // 화살표 시작 위치 설정
            ctx.lineTo(x.getPixelForValue(new Date()) - 6, top - 6); // 화살표 왼쪽 경계
            ctx.lineTo(x.getPixelForValue(new Date()) + 6, top - 6);  // 화살표 오른쪽 경계
            ctx.closePath(); // 화살표 경로 닫기
            ctx.stroke();  // 화살표 외곽선 그리기
            ctx.fill(); // 화살표 내부 채우기

            ctx.font = "bold 12px sans-serif"; // 오늘 날짜 텍스트 폰트 설정
            ctx.fillStyle = "rgba(102,102,102,1)"; // 텍스트 색상 설정
            ctx.textAlign = "center";
            ctx.fillText("Today", x.getPixelForValue(new Date()), bottom + 15); // 오늘 날짜 텍스트를 차트 하단에 표시
          }
        },
      };

      // 상태 표시 플러그인
      const status = {
        id: "status",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx, 
            options, 
            data, 
            chartArea: { top, bottom, left, right }, //차트 영역
            scales: { x, y }, //x,y축 스케일 정보
          } = chart;
          const icons = ["\uf00d", "\uf110", "\uf00c"]; // 상태를 나타내는 아이콘
          const angle = Math.PI / 180; //원 그리기 각도
          const paddingRight = options.layout.padding.right; // 차트 오른쪽 여백
          ctx.save(); //현재 상태 저장
          ctx.font = "bolder 12px FontAwesome"; // 폰트 설정
          ctx.fillStyle = "black"; //글자 색상 설정
          ctx.textBaseline = "middle"; //텍스트 중앙 정렬
          ctx.textAlign = "center"; //텍스트 가운데 정렬
		  
		  // 각 데이터 포인트에 대해 아이콘과 상태 원 그리기
          data.datasets[0].data.forEach((datapoint, index) => {
			// y축 위치가 차트 영역 안에 있는지 확인
            if (
              y.getPixelForValue(index) > top &&
              y.getPixelForValue(index) < bottom
            ) {
			  //상태 아이콘 원 안에 표시하기
              ctx.beginPath(); // 새로운 경로 시작
              ctx.fillStyle = colours[datapoint.status]; // 상태에 따른 원 색상 설정
              ctx.arc(
                right + paddingRight / 1.5, // 원의 x 좌표
                y.getPixelForValue(index), // 원의 y 좌표
                12, // 원의 반지름
                0,  // 시작 각도
                angle * 360, // 끝 각도 
                false // 시계 방향으로 그리기
              );
              ctx.closePath(); // 경로 닫기
              ctx.fill(); /// 원 채우기
              ctx.fillStyle = "white"; // 아이콘 색상 설정
              ctx.fillText(
                icons[datapoint.status], // 상태에 따른 아이콘 표시
                right + paddingRight / 2 + 17, // 아이콘 x 좌표
                y.getPixelForValue(index) // 아이콘 y 좌표
              );
            }
          });
		  // "Status" 텍스트를 표시 (차트 오른쪽 상단)
          ctx.font = "bolder 12px sans-serif"; // 폰트 설정
          ctx.fillStyle = "black";  // 글자 색상 설정
          ctx.fillText("Status", right + paddingRight / 2 + 20, top - 15); // 텍스트 위치 설정
          ctx.restore();  // 이전 상태 복원
        },
      };

      // 담당자 이름 표시 플러그인
      const assignedTasks = {
        id: "assignedTasks",
        afterDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            data,
            chartArea: { top, bottom, left, right }, // 차트 영역
            scales: { x, y },
          } = chart;

          ctx.save();
          ctx.font = "bolder 12px sans-serif";
          ctx.fillStyle = "black";
          ctx.textBaseline = "middle";
          ctx.textAlign = "left";
		  // 각 데이터 포인트에 대해 task 담당자 이름 표시
          data.datasets[0].data.forEach((datapoint, index) => {
			 ctx.fillText(datapoint.name, 10, y.getPixelForValue(index)); // 담당자 이름과 y축 위치 설정
          });
          ctx.fillText("Name", 10, top - 15); //"Name" 텍스트
          ctx.restore();
        },
      };

      // 주말을 배경색으로 표시
      const weekend = {
        id: "weekend",
        beforeDatasetsDraw(chart, args, pluginOptions) {
          const {
            ctx,
            chartArea: { top, bottom, left, right, width, height },
            scales: { x, y },
          } = chart;

          ctx.save();

		  //각 틱을 확인하여 주말인지 확인
          x.ticks.forEach((tick, index) => {
            const day = new Date(tick.value).getDay(); // 틱의 날짜에서 요일 추출(6: 토, 0: 일)
           
			//주말이면 배경색 칠하기
            if (day === 6 || day === 0) {
              ctx.fillStyle = pluginOptions.weekendColor;
              ctx.fillRect =
                (x.getPixelForValue(new Date(tick.value).setHours(24)) -
                  x.getPixelForValue(tick.value),  // 시작과 끝 x 좌표
                height);
            }
          });
        },
      };

      // 차트 설정
      const config = {
        type: "bar", //막대 차트
        data, //차트에 사용할 데이터
        options: {
          layout: {
            padding: { //왼, 오, 아래쪽 여백설정
              left: 100,
              right: 100,
              bottom: 20,
            },
          },
          indexAxis: "y", // y축에 데이터 표시 (가로형 막대차트)
          scales: {
            x: {
              position: "top",
              type: "time", 
              time: {
                displayFormats: {
                  day: "d", //날짜형식 = 일로 지정
                },
              },
              min: "2024-10-01", //x축 시작 날짜
              max: "2024-10-31", //x축 종료 날짜
            },
            y: {
              min: 3, //y축 최소값
              max: 5, //y축 최대값
              labels: [
				//y축 (작업이름 목록)
                "Task 1",
                "Task 2",
                "Task 3",
                "Task 4",
                "Task 5",
                "Task 6",
                "Task 7",
                "Task 8",
              ],
            },
          },
          plugins: {
            weekend: {
              weekendColor: "rgba(102,102,102,0.2)", //주말 배경색
            },
            legend: {
              display: false, //범례 표시하지 않음
            },
            tooltip: {
              displayColors: false,
              yAlign: "bottom", //위치 y축 아래쪽에 맞춤
              callbacks: {
                label: (ctx) => {
                  return ""; //레이블 표시 안함
                },
                title: (ctx) => {
				  // 툴팁에 표시할 타이틀 설정
                  const startDate = new Date(ctx[0].raw.x[0]); //시작 날짜
                  const endDate = new Date(ctx[0].raw.x[1]); //종료 날짜
				  //시작 날짜를 '년/월/일' 형식으로
                  const formattedStartDate = startDate.toLocaleDateString([], {
                    year: "numeric",
                    month: "short",
                    day: "numeric",
                  });
				  //종료 날짜를 '년/월/일' 형식으로
                  const formattedEndDate = startDate.toLocaleDateString([], {
                    year: "numeric",
                    month: "short",
                    day: "numeric",
                  });
                  return [
                    ctx[0].raw.name, //담당자 이름 표시
                    `Task Deadline : ${formattedStartDate} - ${formattedEndDate}`, //작업기간 표시
                  ];
                },
              },
            },
          },
        },
        plugins: [todayLine, assignedTasks, status, weekend], //플러그인리스트 추가
      };

      // 차트 그리는 함수
      const myChart = new Chart(document.getElementById("myChart"), config);

      function chartFilter(date) {
		//입력 받은 날짜에서 연도 추출
        const year = date.value.substring(0, 4);
		// 월 추출
        const month = date.value.substring(5, 7);

		// 해당 연도와 월의 마지막 날 구하는 함수
        const lastDay = (y, m) => {
          return new Date(y, m, 0).getDate();
        };

		// 월의 첫번째 날을 문자열로 저장
        const startDate = `${year}-${month}-01`;
		// 마지막날을 문자열로 저장
        const endDate = `${year}-${month}-${lastDay(year, month)}`;

		// 차트 x축 시작 날짜 설정
        myChart.config.options.scales.x.min = startDate;
		// 차트 x축 종료 날짜 설정
        myChart.config.options.scales.x.max = endDate;
		// 차트 업데이트
        myChart.update();
      }
	  
      function addTask() {
		// 가져오기
        const nameTask = document.getElementById("nameTask"); // 새 작업 이름 
        const startDateTask = document.getElementById("startDateTask"); // 작업 시작 날짜
        const endDateTask = document.getElementById("endDateTask"); // 작업 종료 날짜
        const teamMemberTask = document.getElementById("teamMemberTask"); // 팀 구성원 이름
        const statusTask = document.getElementById("statusTask"); // 작업 상태

		// 차트 데이터 배열의 길이 가져오기
        const arrayLength = myChart.data.datasets[0].data.length;
		// 새 작업 데이터를 차트 데이터에 추가
        myChart.data.datasets[0].data.push({
          x: [startDateTask.value, endDateTask.value], // 작업기간(시작,종료일)
          y: nameTask.value, //작업 이름
          name: teamMemberTask.value, //담당자 이름
          status: parseInt(statusTask.value), //작업 상태(숫자로)
        });

		// 작업 담당자 목록 업데이트 함수 호출
        addNames();
        myChart.update();

       
      }

      function addNames() {
		// datalist 태그 요소 가져오기
        const names = document.getElementById("names"); 

        console.log(names.firstElementChild);
		// 기존에 존재하는 첫번째 자식요소 제거
        while (names.firstElementChild) {
          names.removeChild(names.firstElementChild);
        }

		// 차트 데이터에서 담당자 이름만 추출 -> 배열로 
        const namesArray = myChart.data.datasets[0].data.map((datapoint) => {
          return datapoint.name;
        });

		// 중복을 제거한 담당자 이름 배열 생성
        const namesArrayFilter = [...new Set(namesArray)];

		// 각 담당자 이름을 option태그로 만들어 datalist에 추가
        namesArray.forEach((memberName) => {
          const option = document.createElement("option");
          option.value = memberName;
          names.appendChild(option);
        });
      }
	  // 페이지 로드 시 처음으로 담당자 이름 목록 업데이트
      addNames();

      function showTask() {
        const yScale = myChart.config.options.scales.y; //차트 y축 가져옴
        // 입력받은 최소 작업목록 가져옴
		const minTask = document.getElementById("minTask").value; 
        //최대 작업목록 가져옴
		const maxTask = document.getElementById("maxTask").value;
        yScale.min = yScale.labels[minTask]; // y축의 최소 작업 설정
        yScale.max = yScale.labels[maxTask]; // y축 최대 작업 설정
        myChart.update(); 
      }