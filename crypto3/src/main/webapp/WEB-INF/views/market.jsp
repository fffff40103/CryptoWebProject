<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<script src="/crypto2/js/market.js"></script>

<!-- 由外部導入 -->
<link rel="stylesheet" href="/crypto2/css/market.css">

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
						href="./chart">Chart</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="./staking">Staking</a></li>


				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav">
				<a class="nav-link text-light" href="./userAsset">Assets</a> <i
					class="bi bi-person-circle text-light h5 mb-0  d-md-block userIcon"
					onclick="./login"></i> <a class="nav-link text-light"
					href="./userAsset">username</a>
			</div>
		</div>
	</nav>
	
	<!--Crpto行情以及標題內容(新版)-->
	<div class="container">
	  <div class="row uniquePrice">
	    <div class="col">名稱</div>
	    <div class="col">價格</div>
	    <div class="col">漲跌</div>
	    <div class="col">市值</div>
	  </div>
	  <div class="row uniquePrice">
	    <div class="col name">BTC</div>
	    <div class="col price">45265.1$</div>
	    <div class="col rate">7.18</div>
	    <div class="col value">$886.99B</div>
	  </div>
	  <div class="row uniquePrice">
	    <div class="col name">ETH</div>
	    <div class="col price">2379.27$</div>
	    <div class="col rate">4.55</div>
	    <div class="col value">$286.86B</div>
	  </div>
	  <div class="row uniquePrice">
	    <div class="col name">USDT</div>
	    <div class="col price">1.0007$</div>
	    <div class="col rate">0.01</div>
	    <div class="col value">$91.77B</div>
	  </div>
	</div>
	
	
	
	<!--Crpto行情以及標題內容-->
	<div class="cryptoBody">
		<!--Crypto標題-->
		<div class="title">
			<p>名稱</p>
			<p>價格</p>
			<p>漲跌</p>
			<p>市值</p>

		</div>
		<!--市場價格-->
		<div class="marketPrice">
			<!--XRP-->

			<div class=" uniquePrice BTC ">
				<p class="name">
					BTC
				</p>
				<div class=priceBorder>
					<p class="price ms-3">45265.1$</p>
				</div>
				<p class="rate ms-2" >7.18</p>
				<p class="value">$886.99B</p>
			</div>
			<div class=" uniquePrice ">
				<p class="name">
					ETH
				</p>
				<div class=priceBorder>
					<p class="price ms-2">2379.27$</p>
				</div>
				
				<p class="rate " style="color: green">4.55</p>
				<p class="value">$286.86B</p>
			</div>
			<div class="uniquePrice ">
				<p class="name">
					USDT
				</p>
				<p class="price ">1.0007$</p>
				<p class="rate me-2" style="color: green">0.01</p>
				<p class="value">$91.77B</p>
			</div>
			<div class=" uniquePrice ">
				<p class="name">
					SOL
				</p>
				<p class="price me-2">112.357$</p>
				<p class="rate me-3" style="color: green">10.58</p>
				<p class="value">$48.37B</p>
			</div>
			<div class="uniquePrice">
				<p class="name">
					BNB
				</p>
				<p class="price ms-3 ">318.2$</p>
				<p class="rate" style="color: green">3.11</p>
				<p class="value">$48.32B</p>
			</div>
			<div class=" uniquePrice">
				<p class="name">
				XRP
				</p>
				<p class="price ms-2">0.63208$</p>
				<p class="rate" style="color: green">3.85</p>
				<p class="value">$34.34B</p>
			</div>
			<div class=" uniquePrice">
				<p class="name">
					USDC
				</p>
				<p class="price ms-2">0.9992$</p>
				<p class="rate me-2" style="color: green">-0.07</p>
				<p class="value">$24.69B</p>
			</div>
			<div class=" uniquePrice">
				<p class="name">
					ADA
				</p>
				<p class="price ms-2">0.6242$</p>
				<p class="rate ms-1" style="color: green">5.43</p>
				<p class="value">$22.21B</p>
			</div>
			<div class=" uniquePrice">
				<p class="name">
					stETH
				</p>
				<p class="price me-3">2309.89$</p>
				<p class="rate me-2" style="color: green">3.07</p>
				<p class="value">$21.92B</p>
			</div>
			
			<div class="uniquePrice">
				<p class="name">
					AVAX
				</p>
				<p class="price ms-4">2309.89$</p>
				<p class="rate" style="color: red;padding-left:1rem">3.07</p>
				<p class="value">$21.92B</p>
			</div>

		
		</div>
	</div>
	
</body>

</html>
