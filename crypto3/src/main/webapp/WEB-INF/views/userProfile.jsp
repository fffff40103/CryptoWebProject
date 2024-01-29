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
<style>
body {
	font-family: Arial, sans-serif;
}

label {
	display: inline-block;
	width: 150px; /* 设置标签宽度，可以根据需要调整 */
}

input {
	width: 100%; /* 让输入框宽度占满父元素 */
	box-sizing: border-box; /* 防止宽度受到边框和填充的影响 */
	margin-bottom: 10px; /* 添加一些底部间距 */
	padding: 8px; /* 添加一些内边距 */
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
</html>