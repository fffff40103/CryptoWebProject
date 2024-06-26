package spring.mvc.crypto.model.entity;

public class User {
	
	private Integer userId; // 使用者代號
	private String username; // 使用者名稱
	private String password; // 使用者密碼
	
	
	public User() {
		
	}
	
	public User(String username,String password) {
		this.username=username;
		this.password=password;
	}
	public User(Integer userId, String username, String password) {
		this.userId = userId;
		this.username = username;
		this.password = password;
		
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	

	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + "]";
				
	}
}