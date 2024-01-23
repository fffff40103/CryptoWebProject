package spring.mvc.crypto.model.entity;

import java.util.Date;

public class TransferDetail {
	private Integer trsId;
	private Integer cNumber;
	private Float quantity;
	private Float price;
	private Integer userFrom;
	private Integer userTo;
	private Integer statusId;
	private Date transferTime;
	
	//關聯欄位
	private CryptoCurrency cryptoInfo;
	private User user;
	private StatusDetail statusDetail;
	
	public TransferDetail() {
		
	}
	
	

	public TransferDetail(Integer trsId, Integer cNumber, Float quantity, Float price, Integer userFrom, Integer userTo,
			Integer statusId, Date transferTime, CryptoCurrency cryptoInfo, User user, StatusDetail statusDetail) {
		super();
		this.trsId = trsId;
		this.cNumber = cNumber;
		this.quantity = quantity;
		this.price = price;
		this.userFrom = userFrom;
		this.userTo = userTo;
		this.statusId = statusId;
		this.transferTime = transferTime;
		this.cryptoInfo = cryptoInfo;
		this.user = user;
		this.statusDetail = statusDetail;
	}



	public Integer getTrsId() {
		return trsId;
	}



	public void setTrsId(Integer trsId) {
		this.trsId = trsId;
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



	public Integer getUserFrom() {
		return userFrom;
	}



	public void setUserFrom(Integer userFrom) {
		this.userFrom = userFrom;
	}



	public Integer getUserTo() {
		return userTo;
	}



	public void setUserTo(Integer userTo) {
		this.userTo = userTo;
	}



	public Integer getStatusId() {
		return statusId;
	}



	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}



	public Date getTransferTime() {
		return transferTime;
	}



	public void setTransferTime(Date transferTime) {
		this.transferTime = transferTime;
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
		this.user = user;
	}



	public StatusDetail getStatusDetail() {
		return statusDetail;
	}



	public void setStatusDetail(StatusDetail statusDetail) {
		this.statusDetail = statusDetail;
	};
	
	
	

	
	
	
}
