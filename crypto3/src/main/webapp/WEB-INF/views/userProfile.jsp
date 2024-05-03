<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
		 </script>
<link rel="stylesheet" href="/crypto2/css/userProfile.css">
</head>
<body style="padding: 15px">
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
						href="./userAsset">Asset</a></li>

					<li class="nav-item"><a class="nav-link text-dark"
						href="./userDetail">Detail</a></li>
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




	<div class="contentPart"
		style="display: flex; justify-content: center; align-items: start; height: 100vh;">
		<form id="loginForm" method="post" action="./userProfile"
			class="pure-form">
			<fieldset>

				<legend>Change password</legend>
				😀 Username: <input type="text" id="username" name="username"
					placeholder="usernam" value=${ userName }>
				<p />
				🔑 New password:<input type="password" id="password" name="password"
					placeholder="New password" value="" required>
				<p />
				🔑 confirm: <input type="password" id="confirmPassword"
					name="confirmPassword" placeholder="confirm password" required />
				<p />

				🔐 Verification code: <input type="text" id="code" name="code">
				<button type="button" class="myButton"
					onclick="window.location.href='./verificationCode'">傳送驗證碼</button>
				<p />
				<button type="submit" class="pure-button pure-button-primary">修改密碼</button>
				<c:if test="${changeResult eq 'successfully chage password!'}">
					<div>
						<a href="./login">login page</a>
					</div>
				</c:if>
				<div class=>${changeResult }</div>
			</fieldset>
		</form>
	</div>
</body>
<script>
	/***********************設定登出按鈕*********************************************/
	  let test = document.querySelector(".userIcon");
	  let test1 = document.querySelector(".logoutButton");
	  test.addEventListener("click", (e) => {
	    test1.classList.toggle("d-none");
	  })
	

	
	</script>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
		 </script>
<link rel="stylesheet" href="/crypto2/css/userProfile.css">
</head>
<body style="padding: 15px">
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
						href="./userAsset">Asset</a></li>

					<li class="nav-item"><a class="nav-link text-dark"
						href="./userDetail">Detail</a></li>
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




	<div class="contentPart"
		style="display: flex; justify-content: center; align-items: start; height: 100vh;">
		<form id="loginForm" method="post" action="./userProfile"
			class="pure-form">
			<fieldset>

				<legend>Change password</legend>
				😀 Username: <input type="text" id="username" name="username"
					placeholder="usernam" value=${ userName }>
				<p />
				🔑 New password:<input type="password" id="password" name="password"
					placeholder="New password" value="" required>
				<p />
				🔑 confirm: <input type="password" id="confirmPassword"
					name="confirmPassword" placeholder="confirm password" required />
				<p />

				🔐 Verification code: <input type="text" id="code" name="code">
				<button type="button" class="myButton"
					onclick="window.location.href='./verificationCode'">傳送驗證碼</button>
				<p />
				<button type="submit" class="pure-button pure-button-primary">修改密碼</button>
				<c:if test="${changeResult eq 'successfully chage password!'}">
					<div>
						<a href="./login">login page</a>
					</div>
				</c:if>
				<div class=>${changeResult }</div>
			</fieldset>
		</form>
	</div>
</body>
<script>
	/***********************設定登出按鈕*********************************************/
	  let test = document.querySelector(".userIcon");
	  let test1 = document.querySelector(".logoutButton");
	  test.addEventListener("click", (e) => {
	    test1.classList.toggle("d-none");
	  })
	

	
	</script>
>>>>>>> branch 'master' of https://github.com/fffff40103/CryptoWebProject.git
</html>