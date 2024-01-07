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
  <style>
  	
/*   Css RWD排版規則，由大排到小，同屬性的話會單獨排，如果只有單一屬性會在最下面    */
	  
	
*{
	margin:0;
	padding:0;
	box-sizing:border-box;

}

img{
	width: 2rem;
	height: 2rem;
}

body {
	background-color: white;
	
}



/*黑色被景色的框框以及標題*/
.title {
	
	padding-bottom:1rem;
	display: flex;

	/*設定標題排版*/
	font-size: 2rem;
	/*設定字體大小*/
	color: black;
	padding-top:1rem;
	
	font-weight:bold;

}







.amount{
	background-color:#f6f6f6;
}
/*設定市場價格幣種圖片大小*/


/*在每個不同的幣種相同的uniquePrice設定相同的屬性*/
.uniquePrice {
	display: flex;
	/*設定標題排版*/
	justify-content: space-between;

	/*設定標題排版*/
	font-size: 1.5rem;
	/*設定字體大小*/
	color: black;
	padding-top:1.5rem;
	

	
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
	margin-right: 3rem;
}


@media(min-width:1500px){

	.navRWD {
		margin-left: 10rem;
		margin-right: 10rem;
	}
}

/*登出按鈕RWD設定*/
@media ( max-width :800px) {
	.logoutButton {
		height: 10vh;
		width: 5vw;
	}
	
	
}


@media(max-width:600px){
	.container{
		width:100%;
	}

	.container div{
		font-size:1rem;
	}
	
	.amount {
		  width: 100vw;
		  text-align: center;
	}
}


/*在寬度為450時讓導覽列左右沒有距離*/
@media ( max-width :450px) {
	nav {
		margin-left: 0rem;
	}
}

/*在寬度在365以下時把標題背景寬度設定為視窗最大寬度*/
@media ( max-width :365px) {
	.title {
		width: 100vw;
		font-size: 1.5rem;
		/*把標題字體縮小做RWD*/
		font-weight: 200;
	}
	
	
}

/*在螢幕寬度350以下時讓幣價都呈現為螢幕最大寬度，並且把字體縮小*/
@media ( max-width :350px) {
	
	.uniquePrice div  {
		font-size: 1rem;
		
	}
	
	.uniquePrice{
		padding-top:2rem;
	}
}

/*在寬度為320時讓導覽列的button右邊有3個字的距離*/
@media ( max-width :320px) {
	.buttonRWD {
		margin-right: 3rem;
	}
}

@media ( max-width :330px) {
	.logoutButton {
		width: 8vw;
	}
}

/*在寬度為300時讓導覽列的右半邊部分沒有距離*/
@media ( max-width :300px) {
	.navRWD {
		margin-left: 0rem;
	}
}

/*在螢幕250以下時讓標題高度為11vh並且讓user字體變小*/
@media ( max-width :250px) {
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
  

	
  
 
  
  <!-- --------------------------------------------- -->
  <div class=" container">
  
  	 <!--錢包餘額-->
	  <div class="row cryptoBody">
	    <div class="amount">
	      <p>總資產</p>
	      <h2>20.2USDT</h2>
	      <p class="TWD">≈NT$6.83</p>
	    </div>
	  </div>
  
  
  
	  <div class="row title">
	    <div class="col">幣種</div>
	    <div class="col">數量</div>
	    <div class="col">現價</div>
	    <div class="col">交易</div>
	  </div>
	  <!-- BTC -->
	  <div class="row uniquePrice BTC">
	    <div class="col name "><img src="/crypto2/images/btc.png" alt="">BTC</div>
	    <div class="col number">15</div>
	    <div class="col rate">45265.1$</div>
	    <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	    
	  </div>
	    <!-- ETH -->
	  <div class="row uniquePrice">
	    <div class="col name"><img src="/crypto2/images/eth.png" alt="">ETH</div>
	    <div class="col number">122</div>
	    <div class="col rate">2379.27$</div>
	     <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	  
	  </div>
	  
	    <!-- USDT -->
	  <div class="row uniquePrice">
	    <div class="col name"><img src="/crypto2/images/usdt.png" alt="">USDT</div>
	    <div class="col number">25</div>
	    <div class="col rate">1.0007$</div>
	     <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	   
	  </div>
	    <!-- SOL -->
	  <div class="row uniquePrice">
	    <div class="col name"><img src="/crypto2/images/sol.jpg" alt="">SOL</div>
	    <div class="col number">12</div>
	    <div class="col rate">112.357$</div>
	     <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	   
	  </div>
	    <!-- BNB -->
	  <div class="row uniquePrice">
	    <div class="col name"><img src="/crypto2/images/bnb.png" alt="">BNB</div>
	    <div class="col number">12</div>
	    <div class="col rate">112.357$</div>
	     <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	  
	  </div>
	  
	    <!-- XRP -->
	  <div class="row uniquePrice">
	    <div class="col name"><img src="/crypto2/images/xrp.png" alt="">XRP</div>
	    <div class="col number">520</div>
	    <div class="col rate">112.357$</div>
	     <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	    
	  </div>
	    <!-- USDC -->
	   <div class="row uniquePrice">
	    <div class="col name"><img src="/crypto2/images/usdc.png" alt="">USDC</div>
	    <div class="col number">322</div>
	    <div class="col rate">112.357$</div>
	     <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	 
	
	   </div>
		  <!-- ADA -->
	   <div class="row uniquePrice">
	    <div class="col name"><img src="/crypto2/images/ada.png" alt="">ADA</div>
	    <div class="col number">147</div>
	    <div class="col rate">112.357$</div>
	     <div class="col trans">
	    	<button>買入</button>
	    	<button>賣出</button>
	    </div>
	   
	  </div>
	
	  	<!-- stETH -->
		<div class="row uniquePrice">
		    <div class="col name"><img src="/crypto2/images/steth.png" alt="">stETH</div>
		    <div class="col number">22</div>
		    <div class="col rate">112.357$</div>
		    <div class="col trans">
		    	<button>買入</button>
		    	<button>賣出</button>
	   		</div>
		
		
		</div>
		
		  <!-- AVAX -->
		<div class="row uniquePrice">
		    <div class="col name"><img src="/crypto2/images/avax.png" alt="">AVAX</div>
			<div class="col number">323</div>
			<div class="col rate">112.357$</div>
			<div class="col trans">
		    	<button>買入</button>
		    	<button>賣出</button>
	    	</div>
		
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