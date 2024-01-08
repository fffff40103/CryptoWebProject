<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.slog {
	font-size: 5rem;
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

/*設定五檔加密或幣圖片高度寬度*/
div.cryptoprice p img {
	width: 2rem;
	height: 2rem;
}

/*五檔加密或幣單獨設定*/
.fivecrypto {
	margin-top: 0.5rem;	
	font-weight: bold;
	font-size:2rem;
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

/*讓導覽列左右各有3個字的距離*/
.navRWD {
	margin-left: 5rem;
	margin-right: 5rem'
}
/*讓導覽列按鈕在RWD出現之後可以變換顏色*/
.navbar-toggler {
	background-color: #D9D9D9;
}

/*在寬度800以上把幣價背景調成30vh*/
@media ( min-height :800px) {
	.cryptoprice {
		height: 35vh;
	}
}

/*寬度1600以上設定導覽列左右距離*/

@media ( min-width :1700px) {
	.navRWD {
		margin-left: 18rem;
		margin-right: 18rem;
	}
}


@media ( min-width :1600px) {
	.navRWD {
		margin-left: 15rem;
		margin-right: 10rem;
	}
}




/*高度在900以上時設定上面距離*/
@media ( min-height :900px) {
	
	.content {
		margin-top: 5rem;
	}
	
}

/*在寬度900以下時設定slogn寬度為螢幕寬度100，且離左邊有7個字的距離*/
@media ( max-width : 900px) {
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

/*在寬度為320時讓導覽列的button右邊有3個字的距離*/
@media ( max-width :320px) {
	.buttonRWD {
		margin-right: 3rem;
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
			<a class="navbar-brand text-light fs-2 fw-bolder" href="#">ZheZhe</a>
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
					<li class="nav-item"><a class="nav-link text-light"
						href="/crypto2/mvc/crypto/market">Chart</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="/crypto2/mvc/crypto/staking">Staking</a></li>
				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<a class="nav-link text-light" href="/crypto2/mvc/crypto/login">Assets</a>
				<i
					class="bi bi-person-circle text-light h5 mb-0  d-md-block userIcon"
					onclick="location.href='./login'"></i> <a
					class="nav-link text-light" href="/crypto2/mvc/crypto/login">username</a>
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
								src="https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-game-anime-scene-hd-background-image_784805.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="data:image/jpeg;base64,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"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="data:image/jpeg;base64,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"
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
				
					<div class=" container">
						  <!-- 第一個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName">名稱</div>
						    <div class="col cryptoPrice">價格</div>
						    <div class="col cryptoRate">漲跌</div>
						  </div>
					  		<!-- 第二個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName">名稱</div>
						    <div class="col cryptoPrice">價格</div>
						    <div class="col cryptoRate">漲跌</div>
						  </div>
						  
						  <!-- 第三個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName">名稱</div>
						    <div class="col cryptoPrice">價格</div>
						    <div class="col cryptoRate">漲跌</div>
						  </div>
						  
						  <!-- 第四個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName">名稱</div>
						    <div class="col cryptoPrice">價格</div>
						    <div class="col cryptoRate">漲跌</div>
						  </div>
						  
						  <!-- 第五個 -->
						  <div class="row fivecrypto">
						    <div class="col cryptoName">名稱</div>
						    <div class="col cryptoPrice">價格</div>
						    <div class="col cryptoRate">漲跌</div>
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
			let cryptos = message.content;
			
			let allDivTags=document.querySelectorAll(".fivecrypto");
			let count=0;
			allDivTags.forEach((div)=>{
				//找到貨幣名稱
				if( typeof cryptos[count].cName!="undefined"){
					div.querySelector(".cryptoName").innerText=cryptos[count].cName;
				}
				
				//找到貨幣價格
				
				if( typeof cryptos[count].price!="undefined"){
					div.querySelector(".cryptoPrice").innerText=cryptos[count].price;
				}
				
				//找到貨幣漲跌幅
				if( typeof cryptos[count].rate!="undefined"){
					div.querySelector(".cryptoRate").innerText=cryptos[count].rate;
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
</script>
</html>