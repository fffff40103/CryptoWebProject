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
<style>
.center-table {                       
		        margin: 0 auto; /* 將margin左右設為auto可以將元素水平置中 */
			    width: 50%; /* 設定表格寬度，你可以根據需要調整 */
			    text-align: right; /* 將文本水平置中 */

}

body {
	font-family: Arial, sans-serif;
}
/*   Css RWD排版規則，由大排到小，同屬性的話會單獨排，如果只有單一屬性會在最下面    */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
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

.contentPart {
	margin-top: 3rem;
}

/*寬度1600以上設定導覽列左右距離*/
@media ( min-width :1600px) {
	.navRWD {
		margin-left: 25rem;
		margin-right: 25rem;
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

</script>
</html>