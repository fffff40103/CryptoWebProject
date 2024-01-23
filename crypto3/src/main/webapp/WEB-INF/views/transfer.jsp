<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!--Bootstrap setting part-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transfer</title>
<style>
/*   Css RWD排版規則，由大排到小，同屬性的話會單獨排，如果只有單一屬性會在最下面    */

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


.balanceImg{
	width:3rem;
	height:3rem;
}
/*設定餘額部分*/
.balanceSection {
	display:flex;
	width: 300px;
	height: 300px;
	border-radius: 50%;
	background-color: #D9D9D9;
	margin-right: 5rem;
	margin-top:1rem;
	background-repeat: no-repeat;
	background-position: center top;
	background-size: auto;
	
}
select{
	border:2px solid black!important;
}

.outerArea{
	display:flex
}

/*設定交易部分表單*/
form {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

/*設定交易部分表單的輸入框*/
   input {
	width: 20rem;
	height: 3rem;
	margin: 1rem 0;
	background-color: #D9D9D9;
}

/*設定交易部分表單的按鈕*/
  .submitButton {
	width: 10rem;
	height: 3rem;
	background-color: #D9D9D9;
	font-weight: bolder;
}

.transactionSection{
	display:flex;
	flex-direction:column;
	align-items:center;
	justify-content:center;
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
	width: 5vw;
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

.balanceSection {
	position: relative;
	text-align: center;
}

.balanceMoney {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 16px;
}

.dropdown {
	position: absolute;
	top: 15%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 10px;
	font-size: 16px;
	border: none;
}

/*寬度1600以上設定導覽列左右距離*/
@media ( min-width :1600px) {
	.navRWD {
		margin-left: 30rem;
		margin-right: 30rem;
	}
}

@media ( max-width :1450px) {
	.navRWD {
		margin-left: 5rem;
		margin-right: 5rem;
	}
}

/*在螢幕寬度700以上設置與上方距離5的字大小*/
@media ( min-width :700px) {
	.content {
		margin-top: 5rem;
	}
}

/*在螢幕寬度700以下變成直欄排列，並設定為寬度為螢幕寬度*/
@media ( max-width :700px) {
	.outerArea{
		justify-content:center;
		align-items:center;
	}
	
	.transIdFrom {
		width: 100vw;
	}
	
	.transIdTo {
		width: 100vw;
	}
	.sendAmount{
		width:100vw;
	}
	
}

/*登出按鈕RWD設定*/
@media ( max-width :1170px) {
	.logoutButton {
		width:8vw;
		height: 5vh;
	}
}

@media ( max-width :800px) {
	.logoutButton {
		width:15vw;
		height: 5vh;
	}
}



@media ( max-width :705px) {
	.outerArea {
		flex-direction:column;
	}
	
}

@media ( max-width :680px) {
	.balanceSection {
		margin-right: 0rem;
	}
}

@media ( max-width :330px) {
	.logoutButton {
		width:15vw;
		height: 5vh;
		z-index:1;
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

/*在螢幕寬度400以下時設置買入以及轉出標籤與上方距離*/
@media ( max-width :400px) {
	.transactionButton {
		margin-top: 2rem;
	}

	/*設置圓形餘額大小*/
	.balanceSection {
		width: 250px;
		height: 250px;
	}
}

/*因轉出以及轉入標籤在寬段260以下時會被壓縮，所以把他轉為直欄排列*/
@media ( max-width :260px) {
	.transactionButton {
		flex-direction: column;
	}
	.buy {
		margin-bottom: 0.5rem;
	}
}

/*在螢幕250以下時讓user字體變小*/
@media ( max-width :250px) {
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
						href="./staking">Staking</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="./transfer">Transfer</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="./userDetail">Detail</a></li>
						
					<li class="nav-item"><a class="nav-link text-light"
						href="./userProfile">Profile</a></li>


				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<i
					class="bi bi-person-circle text-light h5 mb-0  d-md-block userIcon"
					onclick=""></i> <a class="nav-link text-light" href="#">${ user.username }</a>
				<div class="logoutButton d-none ">
					<a href="./logout">logout</a>
				</div>
			</div>
		</div>
	</nav>
	<!--餘額內容-->
	<div class="content">
		<form method="post" action="./transfer">
			<div class="outerArea">
			<!-- 餘額區域 -->
			<div class="balanceSection">
				<!-- 下拉式选择框 -->
				<select class="dropdown" id="currency" name="currency" onChange="updateBalance() " style="background-color: #D9D9D9;color:black;">
					<c:forEach items="${allCryptos}" var="currency">
						<option value="${currency.getcName() }">${currency.getcName() }</option>
					</c:forEach>
				</select>

				<div class="balanceMoney">
					<!-- 初始金额显示 -->
					<div class="imageAndBalance flex-column">
						<img class="balanceImg" src="/crypto2/images/btc.png">
						<h1 class="balanceTitle"></h1>
						
					</div>
				</div>
			</div>
			<!-- 操作區域 -->
			<div class="transactionSection">
				
				<!-- 按鈕 -->
				<div class="transactionButton">

					<div class="transfer">
						<a href="#">Transfer</a>
					</div>
				</div>
				<!-- 轉給誰 -->
				<input type="text" class="transIdFrom" placeholder="From" id="transIdFrom" name="transIdFrom" value="${currentUser.getUserId() }" readonly> 
				<input type="text" class="transIdTo" placeholder="To" id="transIdTo" name="transIdTo" >
				<input type="number" class="sendAmount" placeholder="amount" id="sendAmount" name="sendAmount" >
				<input type="text" hidden class="csrfToken" name="csrfToken" id="csrfToken" value="${csrf_token }">					
				<button class=submitButton>Submit</button>

				</div>
			</div>
		</form>
	</div>
</body>
<script>
  showMessage();
  //進來要先執行一次才有數據
  updateBalance();
  /*設定resultMessage*/
  function showMessage() {
		let message="${resultMessage}";
		if(message=="The user doesn't exists"){
			alert(message);			
		}
		
		if(message=="Insufficient balance"){
			alert(message);
		}
		
		if(message=="successully transfer"){
			alert(message);
		}
  }

  /*設定下拉式選單如果改變金額也改變*/
  function updateBalance() {
            // 获取选择框的值
            let selectedCurrency = document.getElementById("currency").value;

            // 使用Fetch API进行异步请求
            fetch('./api/getBalance?currency=' + selectedCurrency)
                .then(response => response.json())
                .then(data => {
                    // 更新页面上的金额显示
                    document.querySelector(".balanceTitle").innerHTML = "<h1>"+ data +" "+selectedCurrency.toUpperCase()+ "</h1>";
                    document.querySelector(".balanceImg").src="/crypto2/images/"+selectedCurrency.toLowerCase()+".png";
                })
                .catch(error => console.error('Error:', error));
        }
  

  /*設定登出按鈕*/
  let test = document.querySelector(".userIcon");
  let test1 = document.querySelector(".logoutButton");
  test.addEventListener("click", (e) => {
    test1.classList.toggle("d-none");
  })
</script>

</html>