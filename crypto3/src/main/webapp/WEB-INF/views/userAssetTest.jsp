<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

img {
	width: 2rem;
	height: 2rem;
}

body {
	background-color: white;
}

/*黑色被景色的框框以及標題*/
.title {
	padding-bottom: 1rem;
	display: flex;
	/*設定標題排版*/
	font-size: 2rem;
	/*設定字體大小*/
	color: black;
	padding-top: 1rem;
	font-weight: bold;
}
/***********test***************/
input {
	border: none;
	outline: none;
}

table, tr, td, th, tbody {
	border: none;
	padding: 0;
	margin: 0;
}

/************test**********************/
.balance {
	background-color: #f6f6f6;
}
/*設定市場價格幣種圖片大小*/

/*在每個不同的幣種相同的uniquePrice設定相同的屬性*/
.uniquePrice {
	font-size: 1.5rem;
	/*設定字體大小*/
	color: black;
	padding-top: 1.5rem;
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

input {
	width: 8rem;
	height: 2rem;
}

/*寬度1600以上設定導覽列左右距離*/
@media ( min-width :1600px) {
	.navRWD {
		margin-left: 18rem;
		margin-right: 18rem;
	}
}

@media ( max-width :1450px) {
	.navRWD {
		margin-left: 5rem;
		margin-right: 5rem;
	}
}

/*登出按鈕RWD設定*/
@media ( max-width :800px) {
	.logoutButton {
		height: 10vh;
		width: 5vw;
	}
}

@media ( max-width :770px) {
	form input {
		font-size: 1rem;
	}
	form button {
		font-size: 1rem;
	}
	input {
		width: 5rem;
		height: 2rem;
	}
	.title {
		font-size: 1.5rem;
	}
}

@media ( max-width :600px) {
	.container {
		width: 100%;
	}
	.container div {
		font-size: 1rem;
	}
	.balance {
		width: 100vw;
		text-align: center;
	}
}

@media ( max-width :480px) {
	input {
		width: 5rem;
		height: 2rem;
	}
	.ms-5 {
		margin-left: 0rem !important;
	}
}

/*在寬度為450時讓導覽列左右沒有距離*/
@media ( max-width :450px) {
	nav {
		margin-left: 0rem;
	}
}


/*在寬度為400時讓導覽列左右沒有距離*/
@media ( max-width :400px) {
	.title{
		font-size:1rem;
	}
}

/*在寬度在365以下時把標題背景寬度設定為視窗最大寬度*/
@media ( max-width :365px) {
	.title {
		width: 80vw;
		
		/*把標題字體縮小做RWD*/
		font-weight: 200;
	}
	
	
	.uniquePrice {
		margin-top: 3rem;
	}
}

/*在螢幕寬度350以下時讓幣價都呈現為螢幕最大寬度，並且把字體縮小*/
@media ( max-width :350px) {
	.uniquePrice div {
		font-size: 1rem;
	}
	
	.cryptoprice {
		width: 100vw;
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
			<button class="navbar-toggler buttonRWD text-dark" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown "
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon "></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active text-dark"
						aria-current="page" href="./market">Markets</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="./chart">Chart</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="./staking">Staking</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="./transaction">Transaction</a></li>


				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<i
					class="bi bi-person-circle text-dark h5 mb-0  d-md-block userIcon"
					onclick=""></i> <a class="nav-link text-dark" href="#">${ user.username }</a>
				<div class="logoutButton d-none ">
					<a href="./logout">登出</a>
				</div>
			</div>
		</div>
	</nav>






	<!-- --------------------------------------------- -->
	<div class=" container">

		<!--錢包餘額-->
		<div class="row cryptoBody">
			<div class="balance">
				<p>總資產</p>
				<h2>20.2USDT</h2>
				<p class="TWD">≈NT$6.83</p>
			</div>
		</div>


		<form class="row table ms-5">



			<table class="row table">
				<thead>
					<tr class="row title">
						<th class="col ">幣種</th>
						<th class="col ">數量</th>
						<th class="col ">限價</th>
						<th class="col ">交易</th>
					</tr>
				</thead>

				<tbody>
					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/btc.png"> <input value="BTC" readonly>
						</td>
						<td class="col amount"><input value="422" readonly></td>
						<td class="col price"><input value="42325.6" readonly
							style="color: green"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/eth.png"> <input value="ETH" readonly>
						</td>
						<td class="col amount"><input value="15" readonly></td>
						<td class="col price"><input value="2235.6" readonly
							style="color: red"></td>
						<td class="col tarns">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/usdt.png"> <input value="USDT "
							readonly></td>
						<td class="col amount"><input value="22" readonly></td>
						<td class="col price"><input value="1.007" readonly
							style="color: green"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/bnb.png"> <input value="BNB" readonly>
						</td>
						<td class="col amount"><input value="5" readonly></td>
						<td class="col price"><input value="233" readonly
							style="color: red"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/sol.png"> <input value="SOL" readonly>
						</td>
						<td class="col amount"><input value="36" readonly></td>
						<td class="col price"><input value="98.5" readonly
							style="color: red"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice ">
						<td class="col name d-flex"><img
							src="/crypto2/images/xrp.png"> <input value="XRP" readonly>
						</td>
						<td class="col amount"><input value="27.5" readonly></td>
						<td class="col price"><input value="0.5619" readonly
							style="color: green"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/usdc.png"> <input value="USDC"
							readonly></td>
						<td class="col amount"><input value="0" readonly></td>
						<td class="col price"><input value="0.9995" readonly
							style="color: red"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/steth.png"> <input value="stETH"
							readonly></td>
						<td class="col amount"><input value="15" readonly></td>
						<td class="col price"><input value="2283" readonly
							style="color: green"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/ada.png"> <input value="ADA" readonly>
						</td>
						<td class="col amount"><input value="0" readonly></td>
						<td class="col price"><input value="0.5135" readonly
							style="color: red"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>

					<tr class="row uniquePrice">
						<td class="col name d-flex"><img
							src="/crypto2/images/avax.png"> <input value="AVAX"
							readonly></td>
						<td class="col amount"><input value="11" readonly></td>
						<td class="col price"><input value="33.66" readonly
							style="color: green"></td>
						<td class="col trans">
							<button>買入</button>
							<button>賣出</button>
						</td>
					</tr>



				</tbody>

			</table>







		</form>



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
			let cryptos=message.content;
			
			console.log(cryptos)
	
			let allTrs=document.querySelectorAll(".uniquePrice");
			let count=0;
			allTrs.forEach((tr)=>{
				
				if( cryptos.length==10){
					/*名字*/
					let name=cryptos[count].pName;
					if(tr.querySelector("img")===null){
						let tdTag=tr.querySelector("name");
						let imgTag=document.createElement("img");
						imgTag.src="/crypto2/images/"+name.toLowerCase()+".png";
						
						let inputTag=document.createElement("input");
						inputTag.value=name;
						inputTag.readOnly=true;
						
						tdTag.appendChild(imgTag);
						tdTag.append(inputTag);
					}else{
						let tdTag=tr.querySelector(".name");
						let imgTag=tdTag.querySelector("img");
					
						let inputTag=tr.querySelector("input");
						
						imgTag.src="/crypto2/images/"+name.toLowerCase()+".png";
						inputTag.value=name;
					}
					
					/*限價*/
					let price="$"+cryptos[count].pPrice
					let rate=cryptos[count].pRate;
					let tdTag=tr.querySelector(".price");
					if(tdTag.querySelector("input")===null){
						inputTag=document.createElement("input");
						inputTag.value=price;
						inputTag.readOnly=true;
						if(rate>=0){
							inputTag.style="color:green";
						}else{
							inputTag.style="color:red"
						}
					}else{
						inputTag=tdTag.querySelector("input");
						inputTag.value=price;
						if(rate>=0){
							inputTag.style="color:green";
						}else{
							inputTag.style="color:red"
						}
					}
					
					
				}
				count++
			})
		
			
				
   };
   //連線關閉時會建立的消息(只有一次)
	socket.onclose = function() {
	    console.log('WebSocket連線已關閉');
	};
}  



  /***********************設定登出按鈕*********************************************/
  let test = document.querySelector(".userIcon");
  let test1 = document.querySelector(".logoutButton");
  test.addEventListener("click", (e) => {
    test1.classList.toggle("d-none");
  })
</script>

</html>