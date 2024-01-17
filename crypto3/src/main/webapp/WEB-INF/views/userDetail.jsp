<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>交易明細</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/GroupBuy/css/group_buy.css">
		<style>
		    .center-table {
		        margin: 0 auto; /* 將margin左右設為auto可以將元素水平置中 */
		        width: 50%; /* 設定表格寬度，你可以根據需要調整 */
		    }
		</style>
		
	</head>
	<body>
		<div style="padding: 15px">
			<form class="pure-form">
				<fieldset>
					<legend style="margin: 0 auto; width: 50%;">交易明細</legend>
					<table class="pure-table pure-table-bordered center-table">
						<thead>
							<tr><th>序號</th><th>使用者Id</th><th>貨幣名稱</th><th>數量</th><th>價格</th><th>操作</th><th>交易時間</th></tr>
						</thead>
						<tbody>
							<c:forEach items="${ details }" var="detail">
								<tr>
									<td>${ detail.getTrxId() }</td>
									<td>${ detail.getUser().getUsername() }</td>
									<td>${ detail.getCryptoInfo().getcName() }</td>
									<td>${ detail.getQuantity() }</td>
                                    <td>${ detail.getPrice() }</td>
                                    <td>${ detail.getStatusDetail().getStatusFor() }</td>
									<td>${ detail.getPurchaseTime() }</td>	
										
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					<p />
						 
				</fieldset>
			</form>
		</div>
		
	</body>
</html>