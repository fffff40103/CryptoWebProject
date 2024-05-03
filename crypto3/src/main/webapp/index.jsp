<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="BIG-5">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Homepage</title>
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

/*把背景變成黑色和導覽列變成同一個顏色*/
/*Making navbar and background as same color*/
body {
	background-color: #181a20;
	-ms-overflow-style: none;
}

/**********************左半邊*************************************/
/*設定slogn的font-size成5rem*/
/*set font-size 5 times than default size */
.navbar-brand {

    margin-left: 1rem;

}

.slog {
	font-size: 5rem;
}
.fivecrypto{
	margin-left:1rem;
	img{
	  margin-top:0.5rem;
	  width:25px;
	  height:25px;
	}
}
/*把內容設定最高低高度為100vh*/
/*set min-height as 100vh*/
.content {
	min-height: 100vh;
}
/**********************右半邊*************************************/
/*設定右半邊margin-left:5個字的大小*/
.rightpart {
	margin-left: 5rem;
}

/*設定最火熱的五檔加密和幣背景顏色以及高度*/
/*set current price and top three hotest crypto*/
.cryptoprice {
	padding-top: 1.5rem;
	color: white;
	height: 50vh;
	background-color: #1E2329;
	display: flex;
	flex-direction: column;
	border-radius: 15px;
}



/*五檔加密或幣單獨設定*/
.fivecrypto {
	margin-top: 0.5rem;	
	font-weight: bold;
	font-size:1.5rem;
}

/*設定距離比特幣減半日期*/
/*How many days are we have from halving*/
.halving {
	display: flex;
	flex-direction: column;
	margin-top: 3rem;
	height: 20vh;
	background-color: #1E2329;
	border-radius: 15px;
	position: relative;
}
/*設定比特幣減半的標題*/
.halvingTitle {
	display: flex;
	padding-top: 1rem;
	margin-left: 1rem;
}
/*設定標題旁邊的問號*/
.questionMark {
	cursor: pointer;
}

/*滑上去問號後的內容怎麼顯示*/
.questionMarkContent {
	display: none;
}

/*滑上去後的內容以及設定*/
.questionMark:hover .questionMarkContent {
	display: block;
	position: absolute;
	font-size: 1rem;
	top: 3rem;
	background-color: #808080;
}
/*設定彼特幣減半的日期*/
.halvingDate {
	display: flex;
	margin: 1rem;
}
/*個別設定:日期*/
.day {
	margin-right: 1rem;
}
/*個別設定:小時*/
.hour {
	margin-right: 1rem;
}
/*個別設定:分鐘*/
.minute {
	margin-right: 1rem;
}

/*每個時間旁邊的英文字體特別設定*/
.halvingDate span {
	font-size: 1rem;
}

/*設定nav bar右半邊*/
.rightPartNav {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 5rem;
}

/*設定使用者圖片*/
.rightPartNav i {
	cursor: pointer;
}


/*讓導覽列按鈕在RWD出現之後可以變換顏色*/
.navbar-toggler {
	background-color: #D9D9D9;
}


 /* 自訂輪播圖中圖片的大小 */
    .carousel-inner img {
      width: 100%; /* 圖片寬度為100% */
      height: 300px; /* 圖片高度為300像素（可根據需要調整） */
      object-fit: cover; /* 保持圖片比例，裁剪多餘部分 */
    }
    
.logoutButton {
	top: 4rem;
	position: absolute;
	background: white;
	border-radius: 5px;
}

.logoutButton a {
	text-decoration: none;
	color: black;
}  
/*寬度1650以上設定導覽列左右距離*/
@media ( min-width :1650px) {
	.navRWD {
		margin-left: 18rem;
		margin-right: 15rem;
	}
}




/*寬度1600以上設定導覽列左右距離學校電腦*/
@media ( min-width :1600px) {
	.navRWD {
		margin-left: 18rem;
		margin-right: 15rem;
	}
}


/*在寬度800以上把幣價背景調成30vh*/
@media ( min-height :800px) {
	.cryptoprice {
		height: 35vh;
	}
}




@media(max-width:1450px){
	.navRWD {
		margin-left: 5rem;
		margin-right: 5rem;
	}

}

/*高度在900以上時設定上面距離*/
@media ( min-height :900px) {
	
	.content {
		margin-top: 5rem;
	}
	
}

/*在寬度1000以下時設定slogn寬度為螢幕寬度100，且離左邊有7個字的距離*/
@media ( max-width : 1000px) {
	.slog {
		width: 100vw;
		margin-left: 7rem;
		font-weight: 300;
	}

	/*在寬度為900以下時讓價格區域寬度為螢幕寬度100*/
	.cryptoprice {
		width: 100vw;
	}

	/*在寬度為900以下時內容部分為直行排列*/
	.content {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		margin-top: 0rem;
	}
}

/*在寬度850以下時的設定*/
@media ( max-width : 850px) {
	.rightpart {
		margin-top: 2rem;
		/*設定幣價以及比特幣減半上方的距離*/
	}

	/*彼特幣減半時設定*/
	.halving {
		margin-top: 5rem;
		margin-right: 5rem;
		width: 100vw;
	}
	body::-webkit-scrollbar {
		display: none;
		/*設定無scroll bar*/
	}
}

/*在寬度為450時讓導覽列左右沒有距離*/
@media ( max-width :450px) {
	nav {
		margin-left: 0rem;
	}
}

@media(max-width:390px){
	.fivecrypto{
		font-size:1rem;
	}
	
	.fivecrypto{
		img{
		
			margin-top:0rem;
		}
	}
}

/*在寬度為320時讓導覽列的button右邊有3個字的距離*/
@media ( max-width :320px) {
	.buttonRWD {
		margin-right: 3rem;
	}
	
	.fivecrypto{
		width:100vw;
		
	}
	
	.row {
     --bs-gutter-x: 0; 
 
   }
	
}

/*在寬度為300時讓導覽列的右半邊部分沒有距離*/
@media ( max-width :300px) {
	.navRWD {
		margin-left: 0rem;
	}


	
}
</style>



</head>


<body>
	<!--navbar-->
	<nav class="navbar navbar-expand-lg navbar-light  ">
		<!--Left side navbar-->
		<div class="container-fluid  fs-5 navRWD ">
			<a class="navbar-brand text-light fs-2 fw-bolder" href="">ZheZhe</a>
			<button class="navbar-toggler buttonRWD" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active text-light"
						aria-current="page" href="/crypto2/mvc/crypto/market">Markets</a></li>
					<!-- 如果有登入的話就顯示 -->
					<c:if test="${not empty sessionScope.user }">
						
						<li class="nav-item"><a class="nav-link active text-light"
							aria-current="page" href="/crypto2/mvc/crypto//staking">Staking</a></li>
					
						<li class="nav-item"><a class="nav-link active text-light"
							aria-current="page" href="/crypto2/mvc/crypto//transfer">Transfer</a></li>
							
						<li class="nav-item"><a class="nav-link active text-light"
							aria-current="page" href="/crypto2/mvc/crypto//userAsset">Assets</a></li>

						<li class="nav-item"><a class="nav-link active text-light"
							aria-current="page" href="/crypto2/mvc/crypto//userDetail">Detail</a></li>
						<li class="nav-item"><a class="nav-link active text-light"
							aria-current="page" href="/crypto2/mvc/crypto//userProfile">Profile</a></li>
					</c:if>
				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<c:if test="${not empty sessionScope.user }">
					<i class="bi bi-person-circle text-light h5 mb-0  d-md-block userIcon" onclick=""></i> <a class="nav-link text-light" href="#">${ user.username }</a>
					<div class="logoutButton d-none ">
					  <a href="./mvc/crypto/logout">logout</a>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.user }">
					 <!-- 如果 sessionScope.user 为空，执行以下内容 -->
				    <i
						class="bi bi-person-circle text-light h5 mb-0 d-md-block userIcon"
						onclick=""></i>
					<a class="nav-link text-light" href="./mvc/crypto/login">login</a>
				</c:if>
				
				<div class="logoutButton d-none ">
					<a href="./logout">logout</a>
				</div>
				
			</div>
		</div>
	</nav>
	<!--content part-->
	<div class="container content ">
		<div class="row mt-4 ">
			<!--Left part grid-->
			<div class="col ">
				<!--Homepage slogn-->
				<h1 class="text-light fw-bolder  slog">
					在哲哲網交易超過300種<span style="color: #F0B90B">加密貨幣</span>
				</h1>
				<!--Carousel-->
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="https://ibw.bwnet.com.tw/AC_Gallery/2022/02/9afa0aeb-7819-a703-fd2f-288809875d38.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://grenade-wp-offload-media.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2023/06/15160922/pexels-ds-stories-7267598-1024x683.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRukRHKgOj2btMP-593sbEWtt2ikM5wh4fzVw&usqp=CAU"
								class="d-block w-100" alt="...">
								
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<!--Right part-->
			<div class="col rightpart ">
				<!--current price and top five hotest crypto(display:column)-->
				<div class="cryptoprice">
				
					<div class=" container ">
						  <!-- 第一個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName d-flex  ">
						    	<img src="/crypto2/images/btc.png">
						    	<p>BTC</p>
						    </div>
						    <div class="col cryptoPrice">46325.2</div>
						    <div class="col cryptoRate" style="color:green">+2.64%</div>
						  </div>
					  		<!-- 第二個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName d-flex ">
						    	<img src="/crypto2/images/eth.png">
						    	<p>ETH</p>
						    </div>
						    <div class="col cryptoPrice ">2270.72</div>
						    <div class="col cryptoRate" style="color:green">+0.27%</div>
						  </div>
						  
						  <!-- 第三個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName d-flex  ">
						    	<img src="/crypto2/images/usdt.png">
						    	<p>USDT</p>
						    </div>
						    <div class="col cryptoPrice me-1">1.008</div>
						    <div class="col cryptoRate" style="color:red">-0.01%</div>
						  </div>
						  
						  <!-- 第四個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName d-flex  ">
						    	<img src="/crypto2/images/bnb.png">
						    	<p>BNB</p>
						    </div>
						    <div class="col cryptoPrice">299.2</div>
						    <div class="col cryptoRate" style="color:red">-0.73%</div>
						  </div>
						  
						  <!-- 第五個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName d-flex  ">
						    	<img src="/crypto2/images/sol.png">
						    	<p>SOL</p>
						    </div>
						  
						    <div class="col cryptoPrice">98.424</div>
						    <div class="col cryptoRate " style="color:green">4.51%</div>
						  </div>
						  
					 </div>

				</div>
				<!--Day from cut-->
				<div class="halving fs-3 text-light">

					<div class="halvingTitle">
						<p>比特幣減半倒數計時</p>
						<div class="questionMark">
							❔
							<div class="questionMarkContent">2024
								年的第四次比特幣減半會將比特幣挖礦的獎勵減半。 這將降低新代幣的創造速率，並降低新代幣的整體供應量。
								減半在歷史上都導致價格波動，因為投資者都預期減半後會有一波上漲。</div>
						</div>
					</div>
					<div class="halvingDate">
						<p class="day"></p>
						<p class="hour"></p>
						<p class="minute">
						<p class="second"></p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	
	//把WebSocket連線包成一個function
	webSocketConnection();

	function webSocketConnection() {
		$(function() {
			$.ajax({
				//利用ajax方式請求資料(在controller也要建立相同網址)
				url : 'http://localhost:8080/crypto2/mvc/crypto/send',
				success : function(data) {
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
		socket.onmessage = function(event) {
			//將資料反序列化
			let message = JSON.parse(event.data);
			let cryptos=message.cryptos.content;
			console.log(cryptos)
			let allDivTags=document.querySelectorAll(".fivecrypto");
			let count=0;
			
			
			allDivTags.forEach((div)=>{
				//找到貨幣名稱
				if( cryptos[0].pNumber!=null){
					let name=cryptos[count].pName;
					let nameDiv=div.querySelector(".cryptoName");
					if(nameDiv.querySelector("p")===null){
						let imgTag=document.createElement("img");
						imgTag.src="/crypto2/images/"+name.toLowerCase()+".png";
						let pTag=document.createElement("p");
						pTag.innerText=cryptos[count].pName;
						nameDiv.appendChild(imgTag);
						nameDiv.appendChild(pTag);
						
					}else{
						nameDiv.querySelector("p").innerText=cryptos[count].pName;
						nameDiv.querySelector("img").src="/crypto2/images/"+name.toLowerCase()+".png";
					}
					
				}
				
				//找到貨幣價格
				
				if( cryptos[0].pNumber!=null){
					
					div.querySelector(".cryptoPrice").innerText=cryptos[count].pPrice;
				}
				
				//找到貨幣漲跌幅
				if( cryptos[0].pNumber!=null){
					
					let rate=cryptos[count].pRate;
					
			
					if(rate>=0){
						div.querySelector(".cryptoRate").innerText="+"+cryptos[count].pRate+"%";
						div.querySelector(".cryptoRate").style.color="green";
					}else{
						div.querySelector(".cryptoRate").innerText=cryptos[count].pRate+"%";
						div.querySelector(".cryptoRate").style.color="red";
					}
				}
				
				count++;
			})
			

		};
		//連線關閉時會建立的消息(只有一次)
		socket.onclose = function() {
			console.log('WebSocket連線已關閉');
		};
	}

	//**************************************************************************************
	//算出今天與目標日期的時間差，得出的結果是毫秒
	function getTimeDifference(targetDate) {
		let today = new Date();

		return targetDate - today;

	}

	function updateTime() {
		//設定目標天數
		let targetDate = new Date('04/19/2024 17:34:50');

		//取得現在與目標天數的天數差換成毫秒
		let timeDifference = getTimeDifference(targetDate);

		//得到毫秒後除1000=秒，再除60=分鐘，再除60=小時，再除24=一天
		let days = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
		document.querySelector(".day").innerHTML = days + "<span>D</span>";

		//拿到上面天數的餘數，然後除1000=秒，再除60=分鐘，再除60=小時
		let hours = Math.floor((timeDifference % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60))

		document.querySelector(".hour").innerHTML = hours + "<span>H</span>";

		//拿到上面天數的餘數，然後除1000=秒，再除60=分鐘
		let minutes = Math.floor((timeDifference % (1000 * 60 * 60))
				/ (1000 * 60));
		document.querySelector(".minute").innerHTML = minutes
				+ "<span>M</span>";

		//拿到上面天數的餘數，然後除1000=秒
		let seconds = Math.floor((timeDifference % (1000 * 60)) / (1000));
		document.querySelector(".second").innerHTML = seconds
				+ "<span>S</span>";
	}
	//設定排程(多久執行一次)
	setInterval(updateTime, 1000);
	/***********************設定登出按鈕*********************************************/
	let test = document.querySelector(".userIcon");
	let test1 = document.querySelector(".logoutButton");
	test.addEventListener("click", (e) => {
	  test1.classList.toggle("d-none");
	})
</script>
</html>