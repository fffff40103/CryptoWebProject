<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Market</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <style>
    /*
    Css RWD排版規則，由大排到小，同屬性的話會單獨排，如果只有單一屬性會在最下面   
    */


    /*把背景顏色設定成:#181a20*/
    body {

      background-color: #181a20;
    }

    /*整個加密貨幣價格的parent*/
    .cryptoBody {
      min-height: 100vh;
      /*設定最小高度為視窗高度大小，如果超出就會增加*/

      display: flex;
      justify-content: start;
      flex-direction: column;
      /*把flex設定為column*/
      align-items: center;

    }

    /*黑色被景色的框框以及標題*/
    .title {
      background-color: #090808;
      width: 80vw;
      /*把黑框範圍設定成螢幕可視度的80%*/
      height: 8vh;


      display: flex;
      /*設定標題排版*/
      justify-content: space-between;
      /*設定標題排版*/

      color: white;
      /*標題字體顏色*/
      font-weight: 500;
      /*設定標題粗度*/
      font-size: 2rem;
      /*設定標題字體大小*/
    }

    /*把標題裡面的文字左右距離加1rem*/
    .title p {
      padding-right: 1rem;
      padding-left: 1rem;
    }

    /*設定市場價格排版*/
    .marketPrice {
      width: 80vw;
      /*把黑框範圍設定成螢幕可視度的80%*/
    }

    /*設定市場價格幣種圖片大小*/
    .marketPrice img {
      width: 25px;
      height: 25px;
    }

    /*在每個不同的幣種相同的uniquePrice設定相同的屬性*/
    .uniquePrice {
      display: flex;
      /*設定標題排版*/
      justify-content: space-between;
      /*設定標題排版*/

      font-size: 1.5rem;
      /*設定字體大小*/
      color: white;

      padding: 1rem 1rem 0rem 1rem;
      /*設定每個價格之間的距離*/
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
      background: #f6f6f6;
      border-radius: 5px;

    }

    .logoutButton a {
      text-decoration: none;
      color: black;


    }

    /*讓導覽列左右各有3個字的距離*/
    .navRWD {
      margin-left: 3rem;
      margin-right: 3rem'

    }

    /*登出按鈕RWD設定*/


    @media(max-width:800px) {
      .logoutButton {
        height: 10vh;
        width: 5vw;
      }
    }



    /*在寬度為450時讓導覽列左右沒有距離*/
    @media(max-width:450px) {
      nav {
        margin-left: 0rem;
      }
    }

    /*在寬度在365以下時把標題背景寬度設定為視窗最大寬度*/
    @media(max-width:365px) {
      .title {
        width: 100vw;
        font-size: 1.5rem;
        /*把標題字體縮小做RWD*/
        font-weight: 200;
      }
    }

    /*在螢幕寬度350以下時讓幣價都呈現為螢幕最大寬度，並且把字體縮小*/
    @media(max-width:350px) {
      .marketPrice {
        width: 100vw;
      }

      .uniquePrice p {
        font-size: 1rem;
      }
    }

    /*在寬度為320時讓導覽列的button右邊有3個字的距離*/
    @media(max-width:320px) {
      .buttonRWD {
        margin-right: 3rem;
      }
    }

    @media(max-width:330px) {
      .logoutButton {
        width: 8vw;
      }
    }

    /*在寬度為300時讓導覽列的右半邊部分沒有距離*/
    @media(max-width:300px) {
      .navRWD {
        margin-left: 0rem;
      }
    }

    /*在螢幕250以下時讓標題高度為11vh並且讓user字體變小*/
    @media(max-width:250px) {
      .title {
        height: 11vh;
      }

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
            <a class="nav-link active text-light" aria-current="page" href="./market">Markets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-light" href="./chart">Chart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-light" href="./staking">Staking</a>
          </li>


        </ul>
      </div>

      <!--rigth side navbar-->
      <div class="rightPartNav">
        <a class="nav-link text-light" href="./userAsset">Assets</a>
        <i class="bi bi-person-circle text-light h5 mb-0  d-md-block userIcon" onclick="./login"></i>
        <a class="nav-link text-light" href="./userAsset">username</a>
      </div>
    </div>
  </nav>
  <!--Crpto行情以及標題內容-->
  <div class="cryptoBody">
    <!--Crypto標題-->
    <div class="title">
      <p>名稱</p>
      <p>價格</p>
      <p>漲跌</p>
    </div>
    <!--市場價格-->
    <div class="marketPrice">
      <!--XRP-->
      <div class="xrp uniquePrice">
        <p><img src="./img/xrp.png" alt="">XRP</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <!--BTC-->
      <div class="btc uniquePrice">
        <p><img src="./img/bitcoin.png" alt="">BTC</p>
        <p>43011$</p>
        <p style="color:green">22.5%</p>
      </div>
      <!--BNB-->
      <div class="bnb uniquePrice">
        <p><img src="./img/bnb.png" alt="">BNB</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <!--ETH-->
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <!--USDT-->
      <div class="usdt uniquePrice">
        <p><img src="./img/usdt.png" alt="">USDT</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <!--Prisma-->
      <div class="prisma uniquePrice">
        <p><img src="./img/prisma-finance.png" alt="">PRIS</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <!--還沒處理-->
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>50.8$</p>
        <p style="color:green">22.5%</p>
      </div>


    </div>

  </div>
</body>
<script>
  /*對貨幣名稱超過4個字的貨幣位置微調*/
  adjustPadding()
  function adjustPadding() {
    let divElement = document.querySelector(".marketPrice .usdt")
    console.log(divElement)
    let firstPelement = divElement.getElementsByTagName("p");
    let nameTag = firstPelement[0];
    let priceTag = firstPelement[1];
    if (nameTag.innerText.length > 3) {
      priceTag.style.paddingRight = "1rem";
    }
    console.log(nameTag.innerText);
    console.log(priceTag)
  }

  


</script>

</html>>