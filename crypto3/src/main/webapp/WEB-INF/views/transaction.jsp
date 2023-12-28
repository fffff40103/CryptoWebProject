<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!--Bootstrap setting part-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Staking</title>
  <style>
    /*把背景顏色設定成:#181a20*/
    body {

      background-color: black;
    }

    /*設定內容部分排版*/
    .content {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /*設定餘額部分*/
    .balance {
      width: 300px;
      height: 300px;
      border-radius: 50%;
      background-color: #D9D9D9;
      margin-right: 5rem;
      background-image: url(./img/usdt.png);
      background-repeat: no-repeat;
      background-position: center top;
      background-size: auto;
    }

    /*設定交易部分表單*/
    form {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    /*設定交易部分表單的輸入框*/
    form input {
      width: 20rem;
      height: 3rem;
      margin: 2rem 0;
      background-color: #D9D9D9;
    }

    /*設定交易部分表單的按鈕*/
    form button {
      width: 10rem;
      height: 3rem;
      background-color: #D9D9D9;
      font-weight: bolder;
    }

    /*設定買入以及轉出按鈕*/
    .transactionButton {
      display: flex;
      justify-content: space-evenly;

    }

    /*設定買入以及轉出a標籤*/
    .transactionButton a {
      font-size: 2rem;
      background-color: #D9D9D9;
      margin: 2rem;
      text-decoration: none;
      color: black;

    }

    /*讓導覽列左右各有3個字的距離*/
    .navRWD {
      margin-left: 3rem;
      margin-right: 3rem'

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

    /*讓input的placeholder致中*/
    input::placeholder {
      text-align: center;
      /* 文字水平居中 */
      vertical-align: middle;


    }

    /*讓input的輸入文字置中*/
    input {
      text-align: center;
      /* 输入框内文本水平居中 */

    }


    /*讓導覽列按鈕在RWD出現之後可以變換顏色*/
    .navbar-toggler {
      background-color: #D9D9D9;
    }

    /*在螢幕寬度700以上設置與上方距離5的字大小*/
    @media(min-width:700px) {
      .content {
        margin-top: 5rem;
      }
    }


    /*在螢幕寬度700以下變成直欄排列，並設定為寬度為螢幕寬度*/
    @media(max-width:700px) {
      .content {
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }

      .transId {
        width: 100vw;
      }

      .transaction {
        margin-right: 1.5rem;
      }

      .balance {
        width: 250px;
        height: 250px;
        margin-left: 5rem;
      }
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

    /*在寬度為450時讓導覽列左右沒有距離*/
    @media(max-width:450px) {
      nav {
        margin-left: 0rem;
      }
    }

    /*在寬度為320時讓導覽列的button右邊有3個字的距離*/
    @media(max-width:320px) {
      .buttonRWD {
        margin-right: 3rem;
      }
    }

    /*在寬度為300時讓導覽列的右半邊部分沒有距離*/
    @media(max-width:300px) {
      .navRWD {
        margin-left: 0rem;
      }
    }

    /*在螢幕寬度400以下時設置買入以及轉出標籤與上方距離*/
    @media(max-width:400px) {
      .transactionButton {
        margin-top: 2rem;
      }

      /*設置圓形餘額大小*/
      .balance {
        width: 200px;
        height: 200px;

      }
    }

    /*因轉出以及轉入標籤在寬段260以下時會被壓縮，所以把他轉為直欄排列*/
    @media(max-width:260px) {
      .transactionButton {
        flex-direction: column;
      }

      .buy {
        margin-bottom: 0.5rem;
      }

    }

    /*在螢幕250以下時讓user字體變小*/
    @media(max-width:250px) {

      .rightPartNav {
        font-size: 15px;
      }


    }
  </style>
</head>

<body>


  <!--navbar-->

  <nav class="navbar navbar-expand-lg navbar-light  ">
    <!--Left side navbar-->
    <div class="container-fluid  fs-5 navRWD ">
      <a class="navbar-brand text-light fs-2 fw-bolder" href="#">ZheZhe</a>
      <button class="navbar-toggler buttonRWD text-light" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarNavDropdown " aria-controls="navbarNavDropdown" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon "></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active text-light" aria-current="page" href="#">Markets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-light" href="#">Chart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-light" href="#">Staking</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-light" href="./transaction">Transaction</a>
          </li>


        </ul>
      </div>

      <!--rigth side navbar-->
      <div class="rightPartNav">
        <a class="nav-link text-light" href="#">Assets</a>
        <i class="bi bi-person-circle text-light h5 mb-0  d-md-block userIcon"></i>
        <a class="nav-link text-light" href="#">username</a>
        <div class="logoutButton d-none ">
          <a href="" onclick="">登出</a>
        </div>
      </div>
    </div>
  </nav>
  <!--餘額內容-->
  <div class="content">
    <div class="balance">

    </div>
    <div class="transaction">
      <form action="">
        <div class="transactionButton">
          <div class="buy">
            <a href="">買入</a>
          </div>
          <div class="transfer">
            <a href="">轉出</a>
          </div>
        </div>
        <input type="text " class="transId" placeholder="From">
        <input type="text" class="transId" placeholder="To">
        <button>提交</button>
      </form>
    </div>
  </div>
</body>
<script>

  /*設定登出按鈕*/
  let test = document.querySelector(".userIcon");
  let test1 = document.querySelector(".logoutButton");
  test.addEventListener("click", (e) => {
    test1.classList.toggle("d-none");
  })
</script>

</html>