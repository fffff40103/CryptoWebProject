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
<link rel="stylesheet" href="/crypto2/css/staking.css">
<title>Staking</title>

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
						<h1 class="text-center  fw-bolder">${totalStakingNumber }</h1>
						<img src="/crypto2/images/eth.png" alt="">
					</div>

				</div>
				<div class="guide section">
					<h2 class="text-center">Guide</h2>
				</div>

			</div>
		</div>

		<div class="stakingForm">
			<form action="./staking" method="post">
				<fieldset class="login">
					<legend class="text-center fs-3 fw-bold">Staking Setting</legend>
					<div class="stakingDataInfo  ">
						<div class="availableToStake flex-column  ">
							<p>Available to stake</p>
							<h3>${ethBalance }ETH</h3>
						</div>
						<hr>
						<div class="stakedAmount ">
							<div class="stakedTitle d-flex ">
								<p>Staked amount</p>
								<p class="aprExplain ps-5">APR❔</p>
							</div>

							<div class="stakedData d-flex">
								<h3>${totalStakingAmount }ETH</h3>
								<h3  class="aprData ps-5" style="margin-left:1rem;color:red" >4.8%</h3>
									
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
						<button type="button" class="stakingButton">Submit</button>
						<button type="button" class="redeemButton" onclick="window.location.href='./redeem'">Redeem</button>
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
							id="days" readonly="" hidden required> <input
							class="modalAmountInput" type="number" name="stakingAmount"
							id="stakingAmount " placeHolder='Amount'  readonly=""
							hidden >
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
	//設定顯示購買結果
	showMessage();
	function showMessage(){
		let Message="${stakingMessage}";
		let RedeemMessage="${redeemMessage}";
		let ErrorMessage="${ErrorMessage}";
		if(Message=="stake successfully"){
			alert("stake successfully")
			return;
		}
		if(Message=="Insufficient balance"){
			alert("Insufficient balance");
			return;
		}
		if(RedeemMessage=="Redeem successfully"){
			alert("Redeem successfully");
			return;
		}
		if(RedeemMessage=="No redeem currently"){
			alert("No redeem currently");
			return;
		}
		
		if(RedeemMessage=="Not able to retrieve it yet"){
			alert("Not able to retrieve it yet");
			return;
		}
		
		if(ErrorMessage=="Value required"){
			alert("Value required");
			return;
			
		}
		
		
		
		
		
	}

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