<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!--Bootstrap setting part-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<!-- 使用 Bootstrap 5.x -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Staking</title>
<style>
.stakingDataInfo {
	position: relative;
}

.aprExplain {
	cursor: pointer;
}

/*滑上去後的內容以及設定*/
.aprExplain:hover .questionMarkContent {
	display: block;
	position: absolute;
	font-size: 1rem;
	top: 3rem;
	background-color: #808080;
}

.login {
	color: black;
	border: 1px solid #A9A9A9;
	width: 400px;
	background: white;
}

.content {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.stakingForm {
	display: flex;
	margin-top: 3rem;
	align-items: center;
}

.stakingContent {
	display: flex;
	justify-content: start;
	flex-direction: column;
	align-items: center;
}

/*內容標題字體設定*/
.stakingTitle {
	font-weight: bold;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

/*設定Staking內容排版以及最大寬度為螢幕視窗寬度*/
.stakingInfo {
	margin-top: 1rem;
	display: flex;
	justify-content: space-evenly;
	width: 100vw;
}

/*每個框框都是一個section，設定三個框框的相同屬性*/
.section {
	border: solid 2px #dadce0;
	width: 300px;
	height: 150px;
}

/*設定綁定內容的框框*/
.bondedNumber {
	display: flex;
	justify-content: center;
	padding-top: 1rem
}

/*設定綁定內容框框裡面的乙太幣圖片*/
.bondedToken .bondedNumber img {
	width: 3rem;
	height: 3rem;
}

/*設定nav bar右半邊*/
.rightPartNav {
	display: flex;
	justify-content: center;
	align-items: center;
}

/*設定登出按鈕顯示*/
.rightPartNav {
	position: relative;
}

.logoutButton {
	top: 2.5rem;
	position: absolute;
	width: 3vw;
	height: 5vh;
	background: #f6f6f6;
	border-radius: 5px;
}

.logoutButton a {
	text-decoration: none;
	color: black
}

/*設定使用者圖片*/
.rightPartNav i {
	cursor: pointer;
}

/*設定標題左右邊各3個字的距離*/
.navRWD {
	margin-left: 3rem;
	margin-right: 3rem'
}


/*寬度1600以上設定導覽列左右距離*/
@media ( min-width :1600px) {
	.navRWD {
		margin-left: 18rem;
		margin-right: 18rem;
	}
}

/*登出按鈕RWD設定*/
@media ( max-width :1170px) {
	.logoutButton {
		height: 10vh;
	}
}

/*在寬度960以下設定排版變成直列排版*/
@media ( max-width :960px) {
	.stakingInfo {
		flex-direction: column;
		width: 100vw;
		align-items: center;
	}
	.stakingInfo div {
		margin: 2rem 0rem;
	}
}

@media ( max-width :800px) {
	.logoutButton {
		height: 10vh;
		width: 5vw;
	}
}

@media ( max-width :330px) {
	.logoutButton {
		width: 8vw;
	}
}

/*在寬度為320以下時把導覽列的按鈕右邊為3個字的寬度*/
@media ( max-width :320px) {
	.buttonRWD {
		margin-right: 3rem;
	}
}

/*在寬度為300以下設置導覽列左右無間距*/
@media ( max-width :300px) {
	.navRWD {
		margin-left: 0rem;
	}
}

/*在螢幕250以下時讓user字體變小*/
@media ( max-width :250px) {
	.rightPartNav {
		font-size: 15px;
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
			<a class="navbar-brand text-dark fs-2 fw-bolder" href="#">ZheZhe</a>
			<button class="navbar-toggler buttonRWD" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active text-dark"
						aria-current="page" href="./market">Markets</a></li>

					<li class="nav-item"><a class="nav-link text-dark"
						href="./transfer">Transfer</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="./userAsset">Assets</a></li>

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
	<div class="content">
		<!--Staking content-->
		<div class="stakingContent">
			<h1 class="stakingTitle">Staking</h1>
			<div class="stakingInfo ">
				<div class="validator section ">
					<h2 class="text-center">Incentive</h2>
					<h1 class="text-center  fw-bolder">4.8APR</h1>

				</div>
				<div class="bondedToken section">
					<h2 class="text-center">BondedToken</h2>
					<div class="bondedNumber">
						<h1 class="text-center  fw-bolder">15869315.5</h1>
						<img src="/crypto2/images/eth.png" alt="">
					</div>

				</div>
				<div class="guide section">
					<h2 class="text-center">Guide</h2>
				</div>

			</div>
		</div>

		<div class="stakingForm">
			<form action="" method="post">
				<fieldset class="login">
					<legend class="text-center fs-3 fw-bold">Staking Setting</legend>
					<div class="stakingDataInfo  ">
						<div class="availableToStake flex-column  ">
							<p>Available to stake</p>
							<h3>0.048ETH</h3>
						</div>
						<hr>
						<div class="stakedAmount ">
							<div class="stakedTitle d-flex ">
								<p>Staked amount</p>
								<p class="aprExplain ps-5">APR❔</p>
							</div>

							<div class="stakedData d-flex">
								<h3>0.0ETH</h3>
								<h3 class="aprData  text-danger" style="padding-left:4.5rem;">4.8%</h3>
							</div>
						</div>
					</div>

					<!-- 下拉式選單 -->
					<div class="stakingDays ">

						<select class="dropdownDays" id="days" name="days"
							style="background-color: white; color: black;"
							onChange="updateAPR()">
							<option value="1">1day</option>
							<option value="7">7days</option>
							<option value="31">31days</option>

						</select>
					</div>

					<!-- 數量以及送出按鈕 -->
					<div class="stakingAmount mt-2">

						<input type="number" placeholder="Eth you wanna stake"
							name="stakingAmount" id="stakingAmount" required>
						<button type="button" class="stakingButton">submit</button>
					</div>

				</fieldset>
			</form>
		</div>

	</div>

	<!-- 模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Staking
						Confirmation</h5>
				</div>
				<form class="confirmForm" method="post" action="./staking">
					<div class="modal-body">
						<!-- 显示购买信息的地方 -->
						<p id="purchaseInfo"></p>
						<p id="purchaseInfo2"></p>
						<input class="modalDaysInput" type="number" value="" name="days"
							id="days" readonly="" hidden> <input
							class="modalAmountInput" type="number" name="stakingAmount"
							id="stakingAmount " placeHolder='Amount' required readonly=""
							hidden>
					</div>


					<div class="modal-footer">
						<button type="submit" class="btn btn-secondary modalButtontrans"
							data-dismiss="modal">staking</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
	/*設定APR*/
	updateAPR();
	function updateAPR(){
		let chose=document.querySelector(".dropdownDays").value;
		let aprData=document.querySelector(".aprData");
		if(chose==1){
			aprData.innerText="4.8%";
		}
		if(chose==7){
			aprData.innerText="5%";
		}
		if(chose==31){
			aprData.innerText="5.5%";
		}
	}

    /*設定登出按鈕*/
    let test = document.querySelector(".userIcon");
    let test1 = document.querySelector(".logoutButton");
    test.addEventListener("click", (e) => {
        test1.classList.toggle("d-none");
    })
    
    /*設定模態框*/
     $(document).ready(function() {
		   $(".stakingButton").click(function() {
		     $("#myModal").modal("show");
		   });
  	});
    
    /*按下質押按鈕跳出模態框*/
    let stakingButton=document.querySelector(".stakingButton");
    
    stakingButton.addEventListener("click",function(event){
    	let stakingAmount=document.querySelector(".stakingAmount input").value;
    	let dropdownDays=document.querySelector(".dropdownDays").value;
    	sellButtonClicked(stakingAmount,dropdownDays)		    			
	});
    
    /*設定彈跳框賣出賣出彈跳框*/
    function sellButtonClicked(stakingAmount,dropdownDays) {
    	  

    	 // 将值填充到模态框中
        document.getElementById("purchaseInfo").innerHTML = "Staking amount: " + stakingAmount;
        document.getElementById("purchaseInfo2").innerHTML = "Staking days: " + dropdownDays;
        
        //動態設定隱藏表單的value
        let daysInput=document.querySelector(".modalDaysInput");
        daysInput.value=dropdownDays;
        
        //動態設定隱藏表單的value
        let AmountInput=document.querySelector(".modalAmountInput");

        AmountInput.value=stakingAmount;
        
        
        
        // 显示模态框
        $('#myModal').modal('show');
    } 
    
</script>

</html>