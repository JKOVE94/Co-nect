const colours = [
        "rgba(255 ,26, 104, 1)",
        "rgba(255,159,64,1)",
        "rgba(75,192,192,1)",
      ];

      // setup
      const data = {
        //  labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        datasets: [
          {
            label: "Weekly Sales",
            data: [
              {
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
          const icons = ["\uf00d", "\uf110", "\uf00c"]; // 아이콘
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
                right + paddingRight / 1.5,
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
                right + paddingRight / 2.2 + 16,
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

      function chartFilter(date) {
        const year = date.value.substring(0, 4);
        const month = date.value.substring(5, 7);

        const lastDay = (y, m) => {
          return new Date(y, m, 0).getDate();
        };

        const startDate = `${year}-${month}-01`;
        const endDate = `${year}-${month}-${lastDay(year, month)}`;

        myChart.config.options.scales.x.min = startDate;
        myChart.config.options.scales.x.max = endDate;
        myChart.update();
      }
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