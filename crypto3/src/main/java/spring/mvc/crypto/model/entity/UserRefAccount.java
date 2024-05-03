<<<<<<< HEAD
package spring.mvc.crypto.model.entity;

import java.util.ArrayList;
import java.util.List;

public class UserRefAccount {
	private Integer accId;
	private Float accBalance;
	public static List<UserRefAccount> refAccounts=new ArrayList<>();
	static {
		
		UserRefAccount refAccountBTC=new UserRefAccount(201,0f);
		UserRefAccount refAccountETH=new UserRefAccount(202,0f);
		UserRefAccount refAccountBNB=new UserRefAccount(203,0f);
		UserRefAccount refAccountSOL=new UserRefAccount(204,0f);
		UserRefAccount refAccountUSDT=new UserRefAccount(205,100f);
		UserRefAccount refAccountXRP=new UserRefAccount(206,0f);
		UserRefAccount refAccountDOGE=new UserRefAccount(207,0f);
		UserRefAccount refAccountTON=new UserRefAccount(208,0f);
		UserRefAccount refAccountADA=new UserRefAccount(209,0f);
		UserRefAccount refAccountTRX=new UserRefAccount(210,0f);
		refAccounts.add(refAccountBTC);
		refAccounts.add(refAccountETH);
		refAccounts.add(refAccountBNB);
		refAccounts.add(refAccountSOL);
		refAccounts.add(refAccountUSDT);
		refAccounts.add(refAccountXRP);
		refAccounts.add(refAccountDOGE);
		refAccounts.add(refAccountTON);
		refAccounts.add(refAccountADA);
		refAccounts.add(refAccountTRX);	
	}
	//無參數
	public UserRefAccount() {
		
	}
	//有參數的建構子
	public UserRefAccount( Integer accId, Float accBalance) {

		this.accId = accId;
		this.accBalance = accBalance;
	};


	public Integer getAccId() {
		return accId;
	}

	public void setAccId(Integer accId) {
		this.accId = accId;
	}

	public Float getAccBalance() {
		return accBalance;
	}

	public void setAccBalance(Float accBalance) {
		this.accBalance = accBalance;
	}

	
	
	
}
=======
package spring.mvc.crypto.model.entity;

import java.util.ArrayList;
import java.util.List;

public class UserRefAccount {
	private Integer accId;
	private Float accBalance;
	public static List<UserRefAccount> refAccounts=new ArrayList<>();
	static {
		
		UserRefAccount refAccountBTC=new UserRefAccount(201,0f);
		UserRefAccount refAccountETH=new UserRefAccount(202,0f);
		UserRefAccount refAccountUSDT=new UserRefAccount(203,100f);
		UserRefAccount refAccountBNB=new UserRefAccount(204,0f);
		UserRefAccount refAccountSOL=new UserRefAccount(205,0f);
		UserRefAccount refAccountXRP=new UserRefAccount(206,0f);
		UserRefAccount refAccountUSDC=new UserRefAccount(207,0f);
		UserRefAccount refAccountstETH=new UserRefAccount(208,0f);
		UserRefAccount refAccountADA=new UserRefAccount(209,0f);
		UserRefAccount refAccountAVAX=new UserRefAccount(210,0f);
		refAccounts.add(refAccountBTC);
		refAccounts.add(refAccountETH);
		refAccounts.add(refAccountUSDT);
		refAccounts.add(refAccountBNB);
		refAccounts.add(refAccountSOL);
		refAccounts.add(refAccountXRP);
		refAccounts.add(refAccountUSDC);
		refAccounts.add(refAccountstETH);
		refAccounts.add(refAccountADA);
		refAccounts.add(refAccountAVAX);	
	}
	//無參數
	public UserRefAccount() {
		
	}
	//有參數的建構子
	public UserRefAccount( Integer accId, Float accBalance) {

		this.accId = accId;
		this.accBalance = accBalance;
	};


	public Integer getAccId() {
		return accId;
	}

	public void setAccId(Integer accId) {
		this.accId = accId;
	}

	public Float getAccBalance() {
		return accBalance;
	}

	public void setAccBalance(Float accBalance) {
		this.accBalance = accBalance;
	}

	
	
	
}
>>>>>>> branch 'master' of https://github.com/fffff40103/CryptoWebProject.git
