package spring.mvc.crypto.model.entity;

import java.util.Date;

public class Account {
	
	private Integer accId;//帳戶id(主鍵值)
	private Integer cryptoNumber;//帳戶對應貨幣

	
	//關聯欄位
	private CryptoCurrency crypto;
	
	//無參數建構子
	public Account() {
		
	};
	
	

    public Account(Integer accId, Integer cryptoNumber) {
		super();
		this.accId = accId;
		this.cryptoNumber = cryptoNumber;
	}



	public Account(Integer accId, Integer cryptoNumber, CryptoCurrency crypto) {
		super();
		this.accId = accId;
		this.cryptoNumber = cryptoNumber;
		this.crypto = crypto;
	}



	//Getter  and Setter
	public Integer getAccId() {
		return accId;
	}


	public void setAccId(Integer accId) {
		this.accId = accId;
	}


	public Integer getCryptoNumber() {
		return cryptoNumber;
	}


	public void setCryptoNumber(Integer cryptoNumber) {
		this.cryptoNumber = cryptoNumber;
	}


	public CryptoCurrency getCrypto() {
		return crypto;
	}


	public void setCrypto(CryptoCurrency crypto) {
		this.crypto = crypto;
	}
	
	
	
	
}
