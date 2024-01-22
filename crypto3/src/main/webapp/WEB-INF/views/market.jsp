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
	background-color: "white";
	
}

/*設定標題列的排版*/

.navbar-brand {

    margin-left: 1rem;

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



/*在每個不同的幣種相同的uniquePrice設定相同的屬性*/
.uniquePrice {
	display: flex;
	/*設定標題排版*/
	justify-content: space-between;

	/*設定標題排版*/
	font-size: 1.5rem;
	/*設定字體大小*/
	color: black;
	padding-top:1rem;

	
}

/*設定價格旁邊的圖片*/
.uniquePrice{

	img{
	  margin-top:0.5rem;
	  width:25px;
	  height:25px;
	}
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

.containerContent{
	margin-top:2rem;
}

/*寬度1650以上設定導覽列左右距離*/
@media ( min-width :1650px) {
	.navRWD {
		margin-left: 18rem;
		margin-right: 18rem;
	}
}




/*寬度1600以上設定導覽列左右距離*/
@media ( min-width :1600px) {
	.navRWD {
		margin-left: 18rem;
		margin-right: 18rem;
	}
}

@media(max-width:1450px){
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
	
	.uniquePrice{
	img{
	  margin-top:0rem;
	  width:25px;
	  height:25px;
	}
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

@media(max-width:600px){
	.containerContent{
		margin-top:0rem;
	}
	
}



@media(max-width:500px){
	.uniquePrice{
		padding-top:2rem;
	}
	
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
	/*在寬度為320時讓錶覽列往左邊靠*/
	.navRWD {
		margin-left: 0rem;
	}
}

@media ( max-width :330px) {
	.logoutButton {
		width: 8vw;
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
				
					
					<li class="nav-item">
						<a class="nav-link active text-dark"aria-current="page" href="/crypto2/index.jsp">Homepage</a>			
					</li>	
					
					
				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<a class="nav-link text-dark" href="./userAsset">Assets</a> <i
					class="bi bi-person-circle text-dark h5 mb-0  d-md-block userIcon"
					onclick="./login"></i> <a class="nav-link text-dark"
					href="./userAsset">username</a>
			</div>
		</div>
	</nav>
	
	<!--Crpto行情以及標題內容(新版)-->
	<div class=" container  containerContent">
	  <div class="row title">
	    <div class="col">Name</div>
	    <div class="col">Price</div>
	    <div class="col ">Rate</div>
	    <div class="col">Cap</div>
	  </div>
	  <!-- BTC -->
	  <div class="row uniquePrice ">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate  "></div>
	    <div class="col cap"></div>
	  </div>
	    <!-- ETH -->
	  <div class="row uniquePrice">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate  me-2"></div>
	    <div class="col cap"></div>
	  </div>
	  
	    <!-- USDT -->
	  <div class="row uniquePrice">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate"></div>
	    <div class="col cap"></div>
	  </div>
	    <!-- SOL -->
	  <div class="row uniquePrice">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate"></div>
	    <div class="col cap"></div>
	  </div>
	    <!-- BNB -->
	  <div class="row uniquePrice">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate"></div>
	    <div class="col cap"></div>
	  </div>
	  
	    <!-- XRP -->
	  <div class="row uniquePrice">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate "></div>
	    <div class="col cap"></div>
	  </div>
	    <!-- USDC -->
	   <div class="row uniquePrice">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate "></div>
	    <div class="col cap"></div>
	
	   </div>
		  <!-- ADA -->
	   <div class="row uniquePrice">
	    <div class="col cName d-flex "></div>
	    <div class="col price"></div>
	    <div class="col rate"></div>
	    <div class="col cap"></div>
	  </div>
	
	  	<!-- stETH -->
		<div class="row uniquePrice">
		    <div class="col cName d-flex "></div>
		    <div class="col price"></div>
		    <div class="col rate"></div>
		    <div class="col cap"></div>
		
		</div>
		
		  <!-- AVAX -->
		<div class="row uniquePrice">
		    <div class="col cName d-flex "></div>
			<div class="col price"></div>
			<div class="col rate"></div>
			<div class="col cap"></div>
		</div>


	</div>
	
	
</body>
<script>

function resetColor() {
	pricePart.style.backgroundColor = '#181a20';
}

//把WebSocket連線包成一個function
		webSocketConnection();
		
		function webSocketConnection(){
			$(function() {
				$.ajax({
					//利用ajax方式請求資料(在controller也要建立相同網址)
			        url: 'http://localhost:8080/crypto2/mvc/crypto/send',
			        success: function ( data ){
					
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
				    let cryptos= message.cryptos.content;
				    let compare= message.compare.content;
				    
				    console.log(cryptos)
				    console.log(compare)
					
					let allDivs=document.querySelectorAll(".uniquePrice");
					let count=0;
					
					let loop=true;
					
					let compareArray=[];
					compare.forEach((test)=>{
						compareArray.push(test.comparePrice);
					})
					//console.log('3.',compareArray);

					allDivs.forEach((div)=>{
						//得到每個貨幣的名稱、價錢、漲跌幅、市值
						/*名字*/
						if(cryptos[0].pName!=null){
							let name=cryptos[count].pName;
							let nameDiv=div.querySelector(".cName");
							if(nameDiv.querySelector("p")===null){
								let imgTag=document.createElement("img");
								imgTag.src="/crypto2/images/"+name.toLowerCase()+".png";
								let pTag=document.createElement("p");
								pTag.innerText=cryptos[count].pName;
								nameDiv.appendChild(imgTag);
								nameDiv.appendChild(pTag);
								
							}else{
								let nameDiv=div.querySelector(".cName");
								nameDiv.querySelector("p").innerText=cryptos[count].pName;
								nameDiv.querySelector("img").src="/crypto2/images/"+name.toLowerCase()+".png";
							}
							
						}
						
						
						/*價格*/
						
						let price;
						if(cryptos[0].pPrice!=null&&compare[0].comparePrice!=null){
							//找尋當前標籤
							let pricePart=div.querySelector(".price")														
							price=cryptos[count].pPrice;
							rate=cryptos[count].pRate;
							//找尋要被比較的價格
							priceCompare=compare[count].comparePrice;
							
							//如果當前價格與被比較價格不一樣，就會閃一下顏色(大於0綠色，小於0紅色)
							if(price!=priceCompare){
								if(rate<0){
									pricePart.style.background="#fcdede";
								}else{
									pricePart.style.background="#c2f2c2"
								}
								
								setTimeout(function() {
									pricePart.style.background = "white";
							    }, 2000);
							}else{
								
							}
							pricePart.innerText="$"+cryptos[count].pPrice;						
												   							 
						}
						
						
						/*漲幅*/
						if( cryptos[0].pRate!=null){
							let rate=cryptos[count].pRate;
							if(rate>=0){
								div.querySelector(".rate").innerText="+"+cryptos[count].pRate+"%";
								div.querySelector(".rate").style.color="green";
							}else{
								div.querySelector(".rate").innerText=cryptos[count].pRate+"%";
								div.querySelector(".rate").style.color="red";
							}
						}
						
						/*市值*/
						if(cryptos[0].pCap!=null){
							div.querySelector(".cap").innerText=cryptos[count].pCap;
						}
						
						//let cap=cryptos[count].pCap;
						count++;
				
					});
						
		   };
		   //連線關閉時會建立的消息(只有一次)
			socket.onclose = function() {
			    console.log('WebSocket連線已關閉');
			};
		}  

</script>
</html>