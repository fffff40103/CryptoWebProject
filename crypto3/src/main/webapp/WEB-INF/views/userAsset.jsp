<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<!-- 使用 Bootstrap 5.x -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

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

form {
	margin-top: 1rem;
}

.row {
	--bs-gutter-x: 0rem;
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
		font-size: 1.5rem;
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
	.title {
		width: 100vw;
		margin-left: 1rem;
	}
}

/*在寬度在365以下時把標題背景寬度設定為視窗最大寬度*/
@media ( max-width :365px) {
	.title {
		width: 80vw;
		/*把標題字體縮小做RWD*/
		font-weight: bold;
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
@media ( max-width :260px) {
	.container div {
		font-size: 1rem;
	}
	.uniquePrice {
		padding-top: 0rem;
		margin-top: 0rem;
	}
	.title {
		height: 11vh;
		margin-left: 0rem;
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
						href="./staking">Staking</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="./transfer">Transfer</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="./userDetail">Detail</a></li>
						
					<li class="nav-item"><a class="nav-link text-dark"
						href="./userProfile">Profile</a></li>
				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<i
					class="bi bi-person-circle text-dark h5 mb-0  d-md-block userIcon"
					onclick=""></i> <a class="nav-link text-dark" href="#">${ user.username }</a>
				<div class="logoutButton d-none ">
					<a href="./logout">logout</a>
				</div>
			</div>
		</div>
	</nav>


	<div class="container">

		<!--錢包餘額-->
		<div class="row cryptoBody">
			<div class="balance ">
				<p>Total Assets</p>
				<c:forEach var="cryptoType" items="${userAssets }">
					<c:if test="${cryptoType.getcName() eq 'USDT' }">
						<h2>${cryptoType.getAccBalance() }<span class="fw-bold">
								USDT</span>
						</h2>
						<p class="TWD">≈${cryptoType.getAccBalance()*32 }TWD</p>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<div class="row ">
			<div class="title">
				<p class="col">Name</p>
				<p class="col">balance</p>
				<p class="col priceTitle">Price</p>
				<p class="col transTitle">Transaction</p>
			</div>
		</div>

	</div>

	<!-- 模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Purchase
						Confirmation</h5>
				</div>
				<form class="confirmForm">
					<div class="modal-body">
						<!-- 显示购买信息的地方 -->
						<p id="purchaseInfo"></p>
						<p id="purchaseInfo2"></p>
						<input class="modalNameInput" type="text" value="" name="cryptoName" id="cryptoName" readonly="" hidden>
						<input class="modalPriceInput" type="text" value="" name="cryptoPrice" id="cryptoPrice" readonly="" hidden>
						<input class="modalAmountInput" type="number" name="cryptoAmount" id="cryptoAmount " placeHolder='請填入數量' required >
					</div>
				
				
					<div class="modal-footer">
						<button type="submit" class="btn btn-secondary modalButtontrans"
							data-dismiss="modal">Buy</button>
						<button type="submit" class="btn btn-secondary modalCancelButton"
							data-dismiss="modal" >cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

<!-- 引入Bootstrap 5.0和Popper.js的JavaScript文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
//顯示購買結果
showMessage();
/*設定彈跳框買入賣出彈跳框*/
function buyButtonClicked(nameCrypto,priceCrypto) {
  
	// 将值填充到模态框中
    document.getElementById("purchaseInfo").innerHTML = "The cryptoName: " + nameCrypto;
    document.getElementById("purchaseInfo2").innerHTML = "The price: " + priceCrypto;
    
  	//動態設定表單裡面的按鈕按賣出按鍵就變成賣出
    let formTag=document.querySelector(".confirmForm");
    formTag.action="./buy";
    formTag.method="post";
    
    //動態設定隱藏表單的value
    let nameInput=formTag.querySelector(".modalNameInput");
    nameInput.value=nameCrypto
    
    //動態設定隱藏表單的value
    let priceInput=formTag.querySelector(".modalPriceInput");
    priceInput.value=priceCrypto;
    
  	//動態設定按鈕(買入、賣出)
    let modalFooter=document.querySelector(".modal-footer")
   	let modalButtontrans=modalFooter.querySelector(".modalButtontrans")
   	modalButtontrans.innerHTML="Buy";
    
  	//把彈跳框取消
    let modalCancel=document.querySelector(".modalCancelButton");
   	modalCancel.addEventListener("click",function(event){
   		event.preventDefault();
   		$('#myModal').modal('hide');
   		
   	});
    
    // 显示模态框
    $('#myModal').modal('show');
    
    
}

/*設定彈跳框賣出賣出彈跳框*/
function sellButtonClicked(nameCrypto,priceCrypto) {
	  

	 // 将值填充到模态框中
    document.getElementById("purchaseInfo").innerHTML = "The cryptoName: " + nameCrypto;
    document.getElementById("purchaseInfo2").innerHTML = "The price: " + priceCrypto;
    
  	//動態設定表單裡面的按鈕按賣出按鍵就變成賣出
    let formTag=document.querySelector(".confirmForm");
    formTag.action="./sell";
    formTag.method="post";
    //動態設定隱藏表單的value
    let nameInput=formTag.querySelector(".modalNameInput");
    nameInput.value=nameCrypto
    
    //動態設定隱藏表單的value
    let priceInput=formTag.querySelector(".modalPriceInput");
    priceInput.value=priceCrypto;
    
  	//動態設定按鈕(買入、賣出)
    let modalFooter=document.querySelector(".modal-footer")
   	let modalButtontrans=modalFooter.querySelector(".modalButtontrans")
   	modalButtontrans.innerHTML="Sell";
    
  	//把彈跳框取消
    let modalCancel=document.querySelector(".modalCancelButton");
   	modalCancel.addEventListener("click",function(event){
   		event.preventDefault();
   		$('#myModal').modal('hide');
   		
   	});
    
    // 显示模态框
    $('#myModal').modal('show');
}

//設定顯示購買結果
function showMessage(){
	let Message="${resultMessage}";
	if(Message=="餘額不足，購買失敗"){
		alert("餘額不足，購買失敗")
		return;
	}
	if(Message=="購買成功!"){
		alert("購買成功!");
		return;
	}
	
	if(Message=="餘額不足，售出失敗"){
		alert("餘額不足，售出失敗");
		return;
	}
	
	
	if(Message=="售出成功!"){
		alert("售出成功!");
		return;
	}
	
	
}




//******處理使用者資產字串********
let cryptoString="${userAssets}"
console.log(cryptoString)
//刪除最外層的方括號
cryptoString = cryptoString.slice(1, -1);
console.log(cryptoString)
//使用逗號分隔
var cryptoArray = cryptoString.split(", ");

//創建空的鍵值對物件
var cryptoKeyValue = {};
//將每個加密貨幣字串轉換為鍵值對
cryptoArray.forEach(function(crypto) {
 var parts = crypto.split(":"); // 根據冒號分隔'

 var key = parts[0].trim(); // 去除空格
 console.log(key)
 var value = parseFloat(parts[1].trim()); // 將值轉換為浮點數
 cryptoKeyValue[key] = value; // 將鍵值對添加到物件中
});

//**********把WebSocket連線包成一個function
webSocketConnection()
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
			let cryptos=message.cryptos.content;
			
			console.log(cryptos)
			//判斷如何讀取以及怎麼讀取資料
		    if(cryptos[0].pNumber!=null){
		    	let container=document.querySelector(".container")
		    	cryptos.forEach((crypto)=>{
		    		if(document.getElementById(crypto.pName)===null){
		    		
		    			//表單
		    			let form=document.createElement("form");
			    		form.id=crypto.pName;
			    		
			    		//每一個row
			    		let divRow=document.createElement("div")
			    		divRow.classList.add("row");
			    		divRow.classList.add("uniquePrice")
			    		
			    		//每一個row中的input(名稱)、圖片
			    		let nameCol=document.createElement("div");
			    		nameCol.classList.add("col");
			    		nameCol.classList.add("name")
			    		nameCol.classList.add("d-flex")
			    		let imgTag=document.createElement("img");
			    		imgTag.src="/crypto2/images/"+crypto.pName.toLowerCase()+".png";
			    		let nameInput=document.createElement("input");
			    		nameInput.value=crypto.pName;
			    		nameInput.type="text"
			    		nameInput.readOnly=true;
			    		nameInput.id="cryptoName";
			    		nameInput.name="cryptoName";
			    		nameCol.appendChild(imgTag);
			    		nameCol.appendChild(nameInput);
			    		
			    		divRow.appendChild(nameCol);
			    		//每一個row中的數量
			    		let amountCol=document.createElement("div");
			    		amountCol.classList.add("col");
			    		amountCol.classList.add("amount");
			    		let amountInput=document.createElement("input");
			    		//loop這位使用者的資產
			    		for(let object in cryptoKeyValue){
			    			if(crypto.pName==object){
			    				amountInput.value=cryptoKeyValue[object]
			    			}
			    		}
			    		
			    		amountInput.readOnly=true;
			    		amountInput.type="number";
			    		amountInput.id="cryptoAmount";
			    		amountInput.name="cryptoAmount";
			    		amountCol.appendChild(amountInput);
			    		divRow.appendChild(amountCol);
			    		//每一個row中的input(價格)
			    		let priceCol=document.createElement("div");
			    		priceCol.classList.add("col");
			    		priceCol.classList.add("price")
			    		let priceInput=document.createElement("input");
			    		priceInput.value="$"+crypto.pPrice;
			    		priceInput.readOnly=true;
			    		priceInput.type="text";
			    		priceInput.id="cryptoPrice";
			    		priceInput.name="cryptoPrice";
			    		if(crypto.pRate>=0){
			    			priceInput.style.color="green";
			    		}else{
			    			priceInput.style.color="red";
			    		}
			    		priceCol.appendChild(priceInput);
			    		divRow.appendChild(priceCol);
			    		//每一個row中的botton
			    		
			    		
			    		let buttonCol=document.createElement("div");
			    		buttonCol.classList.add("col");
			    		buttonCol.classList.add("trans");
			    		//設定買入功能
			    		let buttonBuy=document.createElement("button");
			    		buttonBuy.textContent="Buy"
			    		buttonBuy.classList.add("buyButton");
			    		
			    		/*設定按下買入按鈕時觸發的function*/
			    		buttonBuy.addEventListener("click",function(event){
			    			event.preventDefault()
			    			let parentTag=event.target.parentElement.parentElement
			    		    let nameTag=parentTag.querySelector(".name");
			    			let nameInput=nameTag.querySelector("input").value;
			    			
			    			
			    			let priceTag=parentTag.querySelector(".price");
			    			let priceInput=priceTag.querySelector("input").value;
			    			
			    			buyButtonClicked(nameInput,priceInput);
			    				    			
			    		});
	
			    		buttonCol.appendChild(buttonBuy);
			    		
			    		//設定賣出功能
			    		let buttonSell=document.createElement("button");
			    		
			    		buttonSell.textContent="Sell"
			    		buttonSell.classList.add("sellButton")
			    	
			    		
			    		/*設定按下賣出按鈕時觸發的function*/
			    		buttonSell.addEventListener("click",function(event){
			    			event.preventDefault()
			    			let parentTag=event.target.parentElement.parentElement
			    		    let nameTag=parentTag.querySelector(".name");
			    			let nameInput=nameTag.querySelector("input").value;
			    			
			    			
			    			let priceTag=parentTag.querySelector(".price");
			    			let priceInput=priceTag.querySelector("input").value;
			    			
			    			sellButtonClicked(nameInput,priceInput);
			    				
			    		});
			    		
			    		
			    		
			    		//把button按鈕加入form
			    		buttonCol.appendChild(buttonSell);
			    		
			    		
			    		divRow.appendChild(buttonCol);
			    		
			    		form.appendChild(divRow);
			    		container.appendChild(form);
		    		}else{
		    			//這裡是處理如果已經有出現了就只要抓舊資料修改不用再創造新標籤
		    			//貨幣名稱
		    			let formTag=document.getElementById(crypto.pName);
		    			let nameInput=formTag.querySelector(".name").querySelector("input");
		    			nameInput.value=crypto.pName;
		    			
		    			//貨幣圖片
		    			let imgTag=formTag.querySelector("img")
		    			imgTag.src="/crypto2/images/"+crypto.pName.toLowerCase()+".png";
		    			
		    			//貨幣數量
		    			let amountTag=formTag.querySelector(".amount")
		    			let amountInputTag=amountTag.querySelector("input");
		    			for(let object in cryptoKeyValue){
			    			if(crypto.pName==object){
			    				amountInputTag.value=cryptoKeyValue[object]
			    			}
			    		}
		    			
		    			//貨幣價格
		    			let priceInput=formTag.querySelector(".price").querySelector("input");
		    			priceInput.value="$"+crypto.pPrice;
		    			if(crypto.pRate>=0){
		    				priceInput.style.color="green";
		    			}else{
		    				priceInput.style.color="red";
		    			}
		    			
		    			//貨幣買入按鈕
		    			let buttonBuy=formTag.querySelector(".buyButton")
		    		
		    			//貨幣賣出按鍵
		    			let buttonSell=formTag.querySelector(".sellButton")
		    	
		    				    	
		    		}
		    					    	
			    })
		    }
				
   };
   //連線關閉時會建立的消息(只有一次)
	socket.onclose = function() {
	    console.log('WebSocket連線已關閉');
	};
	
}
	
	
	//為不同的按鈕設定不同form的action
	function setFormAction(action,formAttr) {
		
	    // 設置表單的 action 屬性
	    document.getElementById(formAttr).action = action
	}


  /***********************設定登出按鈕*********************************************/
  let test = document.querySelector(".userIcon");
  let test1 = document.querySelector(".logoutButton");
  test.addEventListener("click", (e) => {
    test1.classList.toggle("d-none");
  })
  
  

 
</script>

</html>