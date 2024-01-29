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
<link rel="stylesheet" href="/crypto2/css/transfer.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transfer</title>

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
						href="./userAsset">Assets</a></li>
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
		if(message=="The user doesn't exist"){
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