<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交易明細</title>

<!-- 使用 Bootstrap 5.x -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
<link rel="stylesheet" type="text/css" href="/crypto2/css/userDetail.css">
</head>
<body>
	<!--navbar-->
	<nav class="navbar navbar-expand-lg navbar-light  ">
		<!--Left side navbar-->
		<div class="container-fluid  fs-5 navRWD ">
			<a class="navbar-brand text-dark fs-2 fw-bolder" href="/crypto2/index.jsp">ZheZhe</a>
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
						href="./userAsset">Asset</a></li>

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
    <!-- 交易資訊 -->
	<div style="padding: 15px">
		<form class="pure-form">
			<fieldset>
				<legend class="center-table" style="width: 50%;border:none">Transaction Detail</legend>
				<table class="pure-table pure-table-bordered center-table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Userid</th>
							<th>Name</th>
							<th>Amount</th>
							<th>Price</th>
							<th>Operation</th>
							<th>profitAndLoss</th>
							<th>TotalProfitAndLoss</th>
							<th>Purchase Time</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ details }" var="detail">
							<tr class="text-center">
								<td>${ detail.getTrxId() }</td>
								<td>${ detail.getUser().getUsername() }</td>
								<td>${ detail.getCryptoInfo().getcName() }</td>
								<td>${ detail.getQuantity() }</td>
								<td>${ detail.getPrice() }</td>
								<td>${ detail.getStatusDetail().getStatusFor() }</td>
								<c:forEach items="${currentCryptos}" var="crypto">
							      <c:if test="${crypto.getcName() eq detail.getCryptoInfo().getcName()}">
							        <c:set var="totalBuyMoney" value="${detail.getQuantity()*detail.getPrice() }"/>
							        <c:set var="currentTotalBuyMoney" value="${detail.getQuantity()*crypto.getPrice() }"/>
							        <c:set var="totalProfitAndLoss" value="${ currentTotalBuyMoney-totalBuyMoney}"/>
							        <c:set var="profitLoss" value="${totalProfitAndLoss}" />
							        <c:set var="percentage" value="${(totalProfitAndLoss/totalBuyMoney)*10}" />
							        
							        
							        <c:set var="colorClassForPercentage" value="${percentage ge 0 ? 'text-success' : 'text-danger'}" />
							        <c:set var="colorClassForProitAndLoss" value="${totalProfitAndLoss ge 0 ? 'text-success' : 'text-danger'}" />
							        <td class="${colorClassForPercentage}">
							          <fmt:formatNumber value="${percentage}" maxFractionDigits="1" type="percent" />
							        </td>
							  
							        <td class="${colorClassForProitAndLoss}">
							          <fmt:formatNumber value="${profitLoss}" maxFractionDigits="3"  />
							        </td>
							        
							      </c:if>
							    </c:forEach>
								<td>${ detail.getPurchaseTime() }</td>
							</tr>
							
							
						</c:forEach>

					</tbody>
				</table>
				<p />

			</fieldset>
		</form>
	</div>
	
	<!-- 轉帳資訊 -->
	<div style="padding: 15px">
		<form class="pure-form">
			<fieldset>
				<legend class="center-table" style="width: 50%;border:none">Transfer Detail</legend>
				<table class="pure-table pure-table-bordered center-table">
					<thead>
						<tr >
							<th>TransferId</th>
							<th>Cname</th>
							<th>Quantity</th>
							<th>price</th>
							<th>userFrom</th>
							<th>userTo</th>
							<th>TransferTime</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ transferDetails }" var="transferDetail">
							<tr class="text-center">
								<td>${ transferDetail.getTrsId() }</td>
								<td>${ transferDetail.getCryptoInfo().getcName() }</td>
								<td>${ transferDetail.getQuantity() }</td>
								<td>${ transferDetail.getPrice() }</td>
								<td>${ transferDetail.getUserFrom() }</td>
								<td>${ transferDetail.getUserTo() }</td>
								<td>${ transferDetail.getTransferTime() }</td>								
							</tr>
							
							
						</c:forEach>

					</tbody>
				</table>
				<p />

			</fieldset>
		</form>
	</div>
	
	
	<!-- 質押資訊 -->
	<div style="padding: 15px">
		<form class="pure-form">
			<fieldset>
				<legend class="center-table" style="width: 50%;border:none">Staking Detail</legend>
				<table class="pure-table pure-table-bordered center-table">
					<thead>
						<tr >
							<th>StakingId</th>
							<th>userId</th>
							<th>Quantity</th>
							<th>Apr</th>
							<th>Days</th>
							<th>StakingTime</th>
							<th>RedeemTime</th>
							<th>isRedeem</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ stakingDetails }" var="stakingDetail">
							<tr class="text-center">
								<td>${ stakingDetail.getStakingId() }</td>
								<td>${ stakingDetail.getUserId() }</td>
								<td>${ stakingDetail.getQuantity() }</td>
								<td>${ stakingDetail.getStakingApr() }</td>
								<td>${ stakingDetail.getStakingDays() }</td>
								<td>${ stakingDetail.getStakingTime() }</td>
								<td>${ stakingDetail.getRedeemTime() }</td>
								<c:if test='${stakingDetail.getIsRedeem() eq 1 }'>
									<td>Yes</td>
								</c:if>	
								<c:if test='${stakingDetail.getIsRedeem() eq 0 }'>
									<td>No</td>
								</c:if>								
																
							</tr>
							
							
						</c:forEach>

					</tbody>
				</table>
				<p />

			</fieldset>
		</form>
	</div>
	
	
	
	

</body>
<!-- 引入Bootstrap 5.0和Popper.js的JavaScript文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>

/***********************設定登出按鈕*********************************************/
  let test = document.querySelector(".userIcon");
  let test1 = document.querySelector(".logoutButton");
  test.addEventListener("click", (e) => {
    test1.classList.toggle("d-none");
  })



</script>
</html>