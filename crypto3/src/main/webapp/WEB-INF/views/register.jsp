<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/crypto2/css/register.css">
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
						aria-current="page" href="#">Markets</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Chart</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Staking</a>
					</li>


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



	<div class="sign-up">
		<form class="text-center form-border" action="./register"
			method="post">
			<h2 class="text-center">Welcome</h2>
			<!--輸入Email或手機密碼申請帳號-->
			<input class="inputaccount formRWD" type="text" name="username"
				id="username" placeholder="Please enter email" minlength=10 
				autocomplete="off"> <br>
			<!--輸入密碼的小圖示，案眼睛可以隱藏密碼再點擊一下可以顯示密碼-->
			<div class="password">
				<input class="inputpassword formRWD" name="password" id="password"
					type="password" placeholder="password" minlength=5 
					autocomplete="off"> <img src="./img/notseen.svg" alt="">
			</div>
			<!--確認密碼-->
			<div class="confirm password">
				<input class="inputpassword formRWD" name="password2" id="password2"
					type="password" placeholder="Typing the password again "
					autocomplete="off"> <img src="./img/notseen.svg" alt="">
			</div>

			<!--註冊按鈕-->
			<br>
			<button class="signupButton formRWD" type="submit">Sign up</button>
			<br>
			<button class="signupGoogle formRWD" type="submit">Sign up
				with Google</button>
			<br>

			<c:if test="${message eq '✔️Register successfully'}">
				<div class="success-link">${message }</div>
				<div>
					<a href="./login">login page</a>
				</div>
			</c:if>
			<c:if test="${message ne '✔️Register successfully'}">
				<div class="error-link">${message}</div>
			</c:if>

		</form>

	</div>

</body>
<script>
	
</script>
</html>