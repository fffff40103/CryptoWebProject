package spring.mvc.crypto.model.entity;

import java.util.Date;

public class Account {
	
	private Integer accId;//帳戶id(主鍵值)
	private Integer userId;//用戶id
	private Date creationTime;//帳戶創建間
	
	//關聯欄位
	private User user;
	
	//建立空建構子
	public Account() {
		
	}
	
	public Account(Integer accId, Integer userId, Date creationTime) {
		this.accId = accId;
		this.userId = userId;
		this.creationTime = creationTime;
		
	}

	public Account(Integer accId, Integer userId, Date creationTime, User user) {
		this.accId = accId;
		this.userId = userId;
		this.creationTime = creationTime;
		this.user = user;
	}
	
}
