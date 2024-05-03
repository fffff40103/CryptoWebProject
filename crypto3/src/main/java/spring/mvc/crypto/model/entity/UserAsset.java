package spring.mvc.crypto.model.entity;

public class UserAsset {
	private Integer userId;
	private String cName;
	private Float accBalance;
	public UserAsset() {};
	
	public UserAsset(Integer userId, String cName, Float accBalance) {
		super();
		this.userId = userId;
		this.cName = cName;
		this.accBalance = accBalance;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public  Float getAccBalance() {
		return accBalance;
	}
	public void setAccBalance(Float accBalance) {
		this.accBalance = accBalance;
	}
	
	@Override
	public String toString() {
		return getcName()+":"+getAccBalance();
	}
}
