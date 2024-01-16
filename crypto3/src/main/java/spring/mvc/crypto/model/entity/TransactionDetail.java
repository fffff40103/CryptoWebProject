package spring.mvc.crypto.model.entity;

import java.util.Date;

public class TransactionDetail {
	private Integer trxId;
	private Integer userId;
	private Integer cNumber;
	private Float quantity;
	private Float price;
	private Date purchaseTime;
	private Integer statusId;
	
	//關聯欄位
	private CryptoCurrency cryptoInfo;
	private User user;
	private StatusDetail statusDetail;
	public TransactionDetail() {}
	
	public TransactionDetail( Integer userId, Integer cNumber, Float quantity, Float price
			) {
		this.userId = userId;
		this.cNumber = cNumber;
		this.quantity = quantity;
		this.price = price;
	}

	public TransactionDetail(Integer trxId, Integer userId, Integer cNumber, Float quantity, Float price,
			Date purchaseTime) {
		this.trxId = trxId;
		this.userId = userId;
		this.cNumber = cNumber;
		this.quantity = quantity;
		this.price = price;
		this.purchaseTime = purchaseTime;
	}
	

	
	
	

	public Integer getTrxId() {
		return trxId;
	}

	public void setTrxId(Integer trxId) {
		this.trxId = trxId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getcNumber() {
		return cNumber;
	}

	public void setcNumber(Integer cNumber) {
		this.cNumber = cNumber;
	}

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Date getPurchaseTime() {
		return purchaseTime;
	}

	public void setPurchaseTime(Date purchaseTime) {
		this.purchaseTime = purchaseTime;
	}

	public CryptoCurrency getCryptoInfo() {
		return cryptoInfo;
	}

	public void setCryptoInfo(CryptoCurrency cryptoInfo) {
		this.cryptoInfo = cryptoInfo;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user=user;
	}
	
	

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	
	

	public StatusDetail getStatusDetail() {
		return statusDetail;
	}

	public void setStatusDetail(StatusDetail statusDetail) {
		this.statusDetail = statusDetail;
	}

	@Override
	public String toString() {
		return "交易序號:"+trxId+"使用者id:"+userId+"貨幣編號:"+cNumber+"購買數量:"+quantity+"購買價格:"+price+"購滿時間"+purchaseTime;
	};
	
	
}
