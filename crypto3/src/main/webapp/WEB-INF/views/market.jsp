<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta cName="viewport" content="width=device-width, initial-scale=1.0">
<title>Market</title>
<!-- 這裡加入Bootstrap以及jquery的相關包 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>





<style>
/*   Css RWD排版規則，由大排到小，同屬性的話會單獨排，如果只有單一屬性會在最下面    */
	  
	
*{
	margin:0;
	padding:0;
	box-sizing:border-box;

}

/*把背景顏色設定成:#181a20*/
body {
	background-color: #181a20;
	
}



/*黑色被景色的框框以及標題*/
.title {
	background-color:black;

	padding-bottom:1rem;
	display: flex;


	/*設定標題排版*/
	font-size: 2rem;
	/*設定字體大小*/
	color: white;
	padding-top:1rem;

}


.price p{
	text-align:right;
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
	color: white;
	padding-top:1rem;

	
}


.price p{
	margin-top:1.5rem;
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


@media(max-width:770px){
	.container{
		width:100%;
	}

	.container div{
		font-size:1rem;
	}
}

@media(max-width:500px){
	.uniquePrice{
		padding-top:2rem;
	}
	/*
	.titleRate{
		margin-right:4rem;
	}
	*/
}


/*在寬度為450時讓導覽列左右沒有距離*/
@media ( max-width :440px) {
	nav {
		margin-left: 0rem;
	}
	
	.titleRate{
		margin-right:0rem;
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
	
	<!--Crpto行情以及標題內容(新版)-->
	<div class=" container">
	  <div class="row title">
	    <div class="col">名稱</div>
	    <div class="col">價格</div>
	    <div class="col ">漲跌</div>
	    <div class="col">市值</div>
	  </div>
	  <!-- BTC -->
	  <div class="row uniquePrice BTC">
	    <div class="col cName">BTC</div>
	    <div class="col price">45265.1$</div>
	    <div class="col rate  ">7.18</div>
	    <div class="col cap">$886.99B</div>
	  </div>
	    <!-- ETH -->
	  <div class="row uniquePrice">
	    <div class="col cName">ETH</div>
	    <div class="col price">2379.27$</div>
	    <div class="col rate  me-2">4.55</div>
	    <div class="col cap">$286.86B</div>
	  </div>
	  
	    <!-- USDT -->
	  <div class="row uniquePrice">
	    <div class="col cName">USDT</div>
	    <div class="col price">1.0007$</div>
	    <div class="col rate">0.01</div>
	    <div class="col cap">$91.77B</div>
	  </div>
	    <!-- SOL -->
	  <div class="row uniquePrice">
	    <div class="col cName">SOL</div>
	    <div class="col price">112.357$</div>
	    <div class="col rate">8.5</div>
	    <div class="col cap">$91.77B</div>
	  </div>
	    <!-- BNB -->
	  <div class="row uniquePrice">
	    <div class="col cName">BNB</div>
	    <div class="col price">112.357$</div>
	    <div class="col rate">8.5</div>
	    <div class="col cap">$91.77B</div>
	  </div>
	  
	    <!-- XRP -->
	  <div class="row uniquePrice">
	    <div class="col cName">XRP</div>
	    <div class="col price">112.357$</div>
	    <div class="col rate ">8.5</div>
	    <div class="col cap">$91.77B</div>
	  </div>
	    <!-- USDC -->
	   <div class="row uniquePrice">
	    <div class="col cName">USDC</div>
	    <div class="col price">112.357$</div>
	    <div class="col rate ">8.5</div>
	    <div class="col cap">$91.77B</div>
	
	   </div>
		  <!-- ADA -->
	   <div class="row uniquePrice">
	    <div class="col cName">ADA</div>
	    <div class="col price">112.357$</div>
	    <div class="col rate">8.5</div>
	    <div class="col cap">$91.77B</div>
	  </div>
	
	  	<!-- stETH -->
		<div class="row uniquePrice">
		    <div class="col cName">stETH</div>
		    <div class="col price">112.357$</div>
		    <div class="col rate">8.5</div>
		    <div class="col cap">$91.77B</div>
		
		</div>
		
		  <!-- AVAX -->
		<div class="row uniquePrice">
		    <div class="col cName">AVAX</div>
			<div class="col price">112.357$</div>
			<div class="col rate">8.5</div>
			<div class="col cap">$91.77B</div>
		</div>


	</div>
	
	
</body>
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
			 
		
			};
			
			//只要伺服器端有新的消息，就會傳給客戶端渲染
			socket.onmessage=function(event){
					//將資料反序列化
				    let message = JSON.parse(event.data);
					console.log(message)
					console.log(message.content)
					let cryptos=message.content;
					
			
					let allDivs=document.querySelectorAll(".uniquePrice");
					let count=0;
				
					allDivs.forEach((div)=>{
						
						//得到每個貨幣的名稱、價錢、漲跌幅、市值
						
						/*名字*/
						
						if( typeof cryptos[count].pName!="undefined"){
							div.querySelector(".cName").innerText=cryptos[count].pName;
						}
						let cName=cryptos[count].pName;
						
						
						/*價格*/
						if(typeof cryptos[count].pPrice!="undefined"){
							div.querySelector(".price").innerText="$"+cryptos[count].pPrice;
						}
						
						
						let price=cryptos[count].pPrice+"$";
						
						/*漲幅*/
						if(typeof cryptos[count].pCap!="undefined"){
							div.querySelector(".rate").innerText=cryptos[count].pRate+"%";
						}
						
						if(cryptos[count].pRate>=0){
							div.querySelector(".rate").innerText="+"+cryptos[count].pRate+"%";
						}
						
						let rate=cryptos[count].pRate;
						
						
						if(rate<0){
							div.querySelector(".rate").style.color="red";
						}else{
							div.querySelector(".rate").style.color="green";
						}
						
						/*市值*/
						
						if(typeof cryptos[count].pCap!="undefined"){
							
							
							div.querySelector(".cap").innerText=cryptos[count].pCap;
						}
						
						let cap=cryptos[count].pCap;
						
						count++;
				
					})
						
		   };
		   //連線關閉時會建立的消息(只有一次)
			socket.onclose = function() {
			    console.log('WebSocket連線已關閉');
			};
		}  

</script>
</html>
