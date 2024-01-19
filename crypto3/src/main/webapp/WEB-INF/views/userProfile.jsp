<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
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
			<form id="loginForm" method="post" action="./" class="pure-form">
				<fieldset>
					<legend>Change password</legend>
					😀 Username: <input type="text" id="username" name="username" placeholder="usernam" value=${ userName } required /><p />
					🔑 New password:<input type="password" id="password" name="password" placeholder="New password" value="" required /><p />
					🔑 confirm: <input type="password" id="password" name="password" placeholder="connfirm password" value="" required /><p />
					🔐 Verification code: <input type="text" id="code" name="code"> 
					<p />
					<button type="submit" class="pure-button pure-button-primary">修改密碼</button>
										
				</fieldset>
			</form>
		</div>
	</body>
</html>