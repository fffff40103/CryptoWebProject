<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="/crypto2/css/userAsset.css">
</head>

<body>
  <!--navbar-->

  <nav class="navbar navbar-expand-lg navbar-light  ">
    <!--Left side navbar-->
    <div class="container-fluid  fs-5 navRWD ">
      <a class="navbar-brand text-dark fs-2 fw-bolder" href="#">ZheZhe</a>
      <button class="navbar-toggler buttonRWD text-dark" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarNavDropdown " aria-controls="navbarNavDropdown" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon "></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active text-dark" aria-current="page" href="./market">Markets</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="./chart">Chart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="./staking">Staking</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="./transaction">Transaction</a>
          </li>


        </ul>
      </div>

      <!--rigth side navbar-->
      <div class="rightPartNav">
        <i class="bi bi-person-circle text-dark h5 mb-0  d-md-block userIcon" onclick=""></i>
        <a class="nav-link text-dark" href="#">${ user.username }</a>
        <div class="logoutButton d-none ">
          <a href="./logout" >登出</a>
        </div>
      </div>
    </div>
  </nav>
  <!--錢包餘額-->

	
  </div>
  <!--Crpto行情以及標題內容-->
  <div class="cryptoBody">
    <div class="amount">
      <p>總資產</p>
      <h2>20.2USDT</h2>
      <p class="TWD">≈NT$6.83</p>
    </div>
    <!--Crypto標題-->
    <div class="title">
      <p class="commonRWD cryptoRWD">幣種</p>
      <p class="commonRWD numbersRWD ">數量</p>
      <p class="commonRWD cPriceRWD test">現價</p>
      <p class="commonRWD transRWD test">交易</p>
    </div>
    <!--市場價格-->
    <div class="marketPrice">
      <!--XRP-->
      <div class="xrp uniquePrice">
        <p><img src="./img/xrp.png" alt="">XRP</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <!--BTC-->
      <div class="btc uniquePrice">
        <p><img src="./img/bitcoin.png" alt="">BTC</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <!--BNB-->
      <div class="bnb uniquePrice">
        <p><img src="./img/bnb.png" alt="">BNB</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <!--ETH-->
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div>
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <!--USDT-->
      <div class="usdt uniquePrice">
        <p><img src="./img/usdt.png" alt="">USDT</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>

      </div>
      <!--Prisma-->
      <div class="prisma uniquePrice">
        <p><img src="./img/prisma-finance.png" alt="">PRIS</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <!--還沒處理-->
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>
      <div class="eth uniquePrice">
        <p><img src="./img/eth.png" alt="">ETH</p>
        <p>22569</p>
        <p style="color:green">50.8$</p>
        <div class="trans">
          <button>買入</button>
          <button>賣出</button>
        </div>
      </div>


    </div>

  </div>
</body>
<script>
  /*對貨幣名稱超過4個字的貨幣位置微調*/

  function adjustPadding() {
    let divElement = document.querySelector(".marketPrice .usdt")
    console.log(divElement)
    let firstPelement = divElement.getElementsByTagName("p");
    let nameTag = firstPelement[0];
    let priceTag = firstPelement[1];
    if (nameTag.innerText.length > 3) {
      priceTag.style.paddingRight = "1rem";
    }

  }
  /*設定登出按鈕*/
  let test = document.querySelector(".userIcon");
  let test1 = document.querySelector(".logoutButton");
  test.addEventListener("click", (e) => {
    test1.classList.toggle("d-none");
  })
</script>

</html>