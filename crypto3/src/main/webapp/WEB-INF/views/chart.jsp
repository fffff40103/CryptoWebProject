<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
  <!--Bootstrap setting part-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

  <!--Load the AJAX API-->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">

    // Load the Visualization API and the corechart package.
    google.charts.load('current', { 'packages': ['corechart', 'line', 'bar', "table"] });

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(allChartFunction);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function allChartFunction() {
      drawChart()
      drawCurveTypes()
      drawColumnChart()
      drawTable()
    }
    /*Pie chart************************************/
    function drawChart() {

      // Create the data table.
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
      data.addRows([
        ['Mushrooms', 3],
        ['Onions', 1],
        ['Olives', 1],
        ['Zucchini', 1],
        ['Pepperoni', 2]
      ]);

      // Set chart options
      var options = {
        'title': 'Number of people using crypto',
        'width': 500,
        'height': 400,
        'is3D': true
      };

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }

    /*Line chart************************************/
    function drawCurveTypes() {
      var data = google.visualization.arrayToDataTable([
        ['Year', 'Sales', 'Expenses'],
        ['2004', 1000, 400],
        ['2005', 1170, 460],
        ['2006', 660, 1120],
        ['2007', 1030, 540]
      ]);

      var options = {
        title: 'Crypto trend',
        curveType: 'function',
        legend: { position: 'bottom' },
        width: 500,
        height: 400
      };

      var chart = new google.visualization.LineChart(document.getElementById('lineChart_div'));

      chart.draw(data, options);
    }
    /*column chart************************************/

    function drawColumnChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('timeofday', 'Time of Day');
      data.addColumn('number', 'Motivation Level');
      data.addColumn('number', 'Energy Level');

      data.addRows([
        [{ v: [8, 0, 0], f: '8 am' }, 1, .25],
        [{ v: [9, 0, 0], f: '9 am' }, 2, .5],
        [{ v: [10, 0, 0], f: '10 am' }, 3, 1],
        [{ v: [11, 0, 0], f: '11 am' }, 4, 2.25],
        [{ v: [12, 0, 0], f: '12 pm' }, 5, 2.25],
        [{ v: [13, 0, 0], f: '1 pm' }, 6, 3],
        [{ v: [14, 0, 0], f: '2 pm' }, 7, 4],
        [{ v: [15, 0, 0], f: '3 pm' }, 8, 5.25],
        [{ v: [16, 0, 0], f: '4 pm' }, 9, 7.5],
        [{ v: [17, 0, 0], f: '5 pm' }, 10, 10],
      ]);

      var options = {
        "width": 500,
        "height": 400,
        chart: {
          title: 'Motivation and Energy Level Throughout the Day',
          subtitle: 'Based on a scale of 1 to 10'
        },
        hAxis: {
          title: 'Time of Day',
          format: 'h:mm a',
          viewWindow: {
            min: [7, 30, 0],
            max: [17, 30, 0]
          }
        },
        vAxis: {
          title: 'Rating (scale of 1-10)'
        }
      };

      var materialChart = new google.charts.Bar(document.getElementById('columnChart_div'));
      materialChart.draw(data, options);
    }
    /*Table chart************************************/
    function drawTable() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Name');
      data.addColumn('number', 'Salary');
      data.addColumn('boolean', 'Full Time Employee');
      data.addRows([
        ['Mike', { v: 10000, f: '$10,000' }, true],
        ['Jim', { v: 8000, f: '$8,000' }, false],
        ['Alice', { v: 12500, f: '$12,500' }, true],
        ['Bob', { v: 7000, f: '$7,000' }, true]
      ]);

      var table = new google.visualization.Table(document.getElementById('table_div'));

      table.draw(data, { showRowNumber: true, width: '100%', height: '100%' });
    }


    /*設定登出按鈕*/
    let test = document.querySelector(".userIcon");
    let test1 = document.querySelector(".logoutButton");
    test.addEventListener("click", (e) => {
      test1.classList.toggle("d-none");
    })
  </script>
  <!--Css part-->
  <style>
    .chartPart {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /*設動圖表內容上半部分*/
    .upperChart {
      display: flex;
      justify-content: space-evenly;

    }

    /*設定圖表內容下半部分*/
    .bottomChart {
      display: flex;
      justify-content: space-evenly;

    }

    /*設定nav bar右半邊*/
    .rightPartNav {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /*設定使用者圖片*/
    .rightPartNav i {
      cursor: pointer;
    }

    /*設定登出按鈕顯示*/
    .rightPartNav {
      position: relative;
    }

    .logoutButton {
      top: 2.5rem;
      position: absolute;
      width: 3vw;
      height: 5vh;
      background: #f6f6f6;
      border-radius: 5px;
    }

    .logoutButton a {
      text-decoration: none;
      color: black
    }


    /*登出按鈕RWD設定*/
    @media(max-width:1170px) {
      .logoutButton {
        height: 10vh;

      }
    }

    @media(max-width:800px) {
      .logoutButton {
        height: 10vh;
        width: 5vw;
      }
    }

    @media(max-width:330px) {
      .logoutButton {
        width: 8vw;
      }
    }

    @media(max-width:950px) {

      .chartRWD {
        margin-left: 5rem;
        margin-right: 5rem;
        width: 100vw;
      }

      .upperChart {

        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .bottomChart {

        margin-top: 2rem;
        margin-bottom: 2rem;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
    }

    /*在寬度為450時讓導覽列左右沒有距離*/
    @media(max-width:450px) {
      nav {
        margin-left: 0rem;
      }
    }



    @media(max-width:400px) {
      #columnChart_div {
        width: 100vw;
      }
    }

    /*在寬度為320時讓導覽列的button右邊有3個字的距離*/
    @media(max-width:320px) {
      .buttonRWD {
        margin-right: 3rem;
      }
    }

    /*在寬度為300時讓導覽列的右半邊部分沒有距離，讓user的圖片消失*/
    @media(max-width:300px) {
      .navRWD {
        margin-left: 0rem;
      }

      .userIcon {
        display: none;
      }


    }
  </style>
</head>

<body>
  <!--navbar-->

  <nav class="navbar navbar-expand-lg navbar-light  ">
    <!--Left side navbar-->
    <div class="container-fluid  fs-5 navRWD ">
      <a class="navbar-brand text-dark fs-2 fw-bolder" href="#">ZheZhe</a>
      <button class="navbar-toggler buttonRWD text-light" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarNavDropdown " aria-controls="navbarNavDropdown" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon "></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active text-dark" aria-current="page" href="#">Markets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="#">Chart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="#">Staking</a>
          </li>


        </ul>
      </div>

      <!--rigth side navbar-->
      <div class="rightPartNav">
        <a class="nav-link text-dark" href="#">Assets</a>
        <i class="bi bi-person-circle text-dark h5 mb-0  d-md-block userIcon"></i>
        <a class="nav-link text-dark" href="#">username</a>
        <div class="logoutButton d-none ">
          <a href="" onclick="">登出</a>
        </div>
      </div>
    </div>
  </nav>
  <!--Div that will hold the pie chart-->
  <div class="chartPart">
    <!--圖表內容上半部分-->
    <div class="upperChart">
      <div class="pieChart chartRWD" id="chart_div"></div>
      <div class="lineChart chartRWD" id="lineChart_div"></div>
    </div>
    <!--圖表內容下半部分-->
    <div class="bottomChart">
      <div class="pieChart chartRWD" id="columnChart_div"></div>
      <div class="lineChart chartRWD" id="table_div"></div>
    </div>
  </div>

</body>

</html>