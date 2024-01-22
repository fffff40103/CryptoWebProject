<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
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
		</style>
	</head>
	<body style="padding: 15px">
		<div style="display:flex; justify-content:center; align-items: center; height:100vh;">
			<form id="loginForm" method="post" action="./userProfile" class="pure-form">
				<fieldset>
					
					<legend>Change password</legend>
					😀 Username: <input type="text" id="username" name="username" placeholder="usernam" value=${ userName } ><p />
					🔑 New password:<input type="password" id="password" name="password" placeholder="New password" value="" required ><p />
					🔑 confirm: <input type="password" id="confirmPassword" name="confirmPassword" placeholder="connfirm password" required /><p />
					
					🔐 Verification code: <input type="text" id="code" name="code"><button  type="button" class="myButton" onclick="window.location.href='./verificationCode'">傳送驗證碼</button>					
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
		
	

	
	</script>
</html>