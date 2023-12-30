<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Market</title>
	<!-- 這裡加入Bootstrap以及jquery的相關包 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	
	<!-- 定義WebSocket連線 -->
	<script>
	    //把WebSocket連線包成一個function
		webSocketConnection();
		
		function webSocketConnection(){
			$(function() {
				$.ajax({
					//利用ajax方式請求資料(在controller也要建立相同網址)
			        url: 'http://localhost:8080/crypto2/mvc/crypto/send',
			        success: function ( data ){
						console.log(data);
			        }
			    });
			});
			
			//連線是用websocket建立，相較於一般http，websocket連線可以只建立一次，不用中斷
			var socket = new WebSocket('ws://localhost:8080/crypto2/mvc/websocket');
			
			//連線建立後的訊息(只發一次)
			socket.onopen = function(event) {
			    console.log('WebSocket連線已建立');
			    console.log(event)
		
			};
			
			//只要伺服器端有新的消息，就會傳到客戶端
			socket.onmessage=function(event){
				    let message = JSON.parse(event.data);
					let divTitle=document.querySelector(".marketPrice");
					let cryptos=message.content;
					console.log(cryptos)
					
					//對資料庫的資料用Javascript Dom去顯示
					for(let i=0;i<cryptos.length;i++){
						let eachTag=document.createElement("div");
						eachTag.classList.add("uniquePrice")
                        let tagName=document.createElement("p");
                        tagName.innerText=cryptos[i].name;

                        let tagPrice=document.createElement("p");;
                       
                        tagPrice.innerText=cryptos[i].price+"$";

                        let tagRate=document.createElement("p");;
                        tagRate.innerText=cryptos[i].rate+"%";
                        
                        eachTag.appendChild(tagName);
                        eachTag.appendChild(tagPrice);
                        eachTag.appendChild(tagRate);
                        divTitle.appendChild(eachTag);
					}
					
			
		   };
		   //連線關閉時會建立的消息(只有一次)
			socket.onclose = function() {
			    console.log('WebSocket連線已關閉');
			};
		}  
	
	
    </script>
  
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
		
		align-item:left;
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
		/*設定每個價格之間的距離*/
	
		padding: 1rem 1rem 0rem 1rem;
		
		margin-left:1rem;
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
	@media ( max-width :800px) {
		.logoutButton {
			height: 10vh;
			width: 5vw;
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
		.marketPrice {
			width: 100vw;
		}
		.uniquePrice p {
			font-size: 1rem;
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
			<a class="navbar-brand text-light fs-2 fw-bolder" href="#">ZheZhe</a>
			<button class="navbar-toggler buttonRWD text-light" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown "
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon "></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active text-light"
						aria-current="page" href="./market">Markets</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="./chart">Chart</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="./staking">Staking</a></li>


				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<a class="nav-link text-light" href="./userAsset">Assets</a> <i
					class="bi bi-person-circle text-light h5 mb-0  d-md-block userIcon"
					onclick="./login"></i> <a class="nav-link text-light"
					href="./userAsset">username</a>
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
			<!--  
			<div class="xrp uniquePrice">
				<p>
					<img src="./img/xrp.png" alt="">XRP
				</p>
				<p>50.8$</p>
				<p style="color: green">22.5%</p>
			</div>
			-->
			<!--BTC-->
			


		</div>

	</div>
</body>
<script>
  /*對貨幣名稱超過4個字的貨幣位置微調*/
  /*adjustPadding()
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
	*/
  


</script>

</html>

