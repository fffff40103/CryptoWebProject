<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/crypto2/css/login.css">
</head>
<body>
	<!--navbar-->

	<nav class="navbar navbar-expand-lg navbar-light  ">
		<!--Left side navbar-->
		<div class="container-fluid mx-5 fs-5  ">
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

				</ul>
			</div>

			<!--rigth side navbar-->
			<div class="rightPartNav d-none">
				<a class="nav-link text-light" href="#">Assets</a> <i
					class="bi bi-person-circle text-light h5 mb-0 d-none d-md-block"></i>
				<a class="nav-link text-light" href="#">username</a>
			</div>
		</div>
	</nav>



	<div class="login">
		<form class="text-center form-border" action="./login" method="post">
			<h2 class="text-center">Welcome back</h2>
			<!--輸入帳號-->
			<input class="inputaccount formRWD" name="username" id="username"
				type="text" placeholder="Username" autocomplete="off"> <br>
			<!--輸入密碼的小圖示，案眼睛可以隱藏密碼再點擊一下可以顯示密碼-->
			<div class="password">
				<input class="inputpassword formRWD" name="password" id="password"
					type="password" placeholder="Password" autocomplete="off">
				<img class="eyesImg" src="/crypto2/images/notseen.svg " alt="">
				<br> <input type="text" id="code" name="code"
					placeholder="Code"> <br> <img class="codeImg"
					src="./getcode" alt="Verification code">
			</div>

			<!--login按鈕-->
			<br>
			<button class="loginbutton formRWD" type="submit">Login</button>
			<br>
			<button class="logingoogle formRWD" type="submit">Login with
				Google</button>
			<br>
			<!--這裡設定如果沒有帳號要註冊的地方-->
			<div class="noaccount formRWD">
				<p>No Account?</p>
				<a href="./register">Sign up</a>
			</div>
			<div style="color: red">${ message }</div>

		</form>
	</div>

</body>
</html>