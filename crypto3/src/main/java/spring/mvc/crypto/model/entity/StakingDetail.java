<<<<<<< HEAD
package spring.mvc.crypto.model.entity;

import java.sql.Timestamp;

public class StakingDetail {
     private Integer stakingId;
     private Integer userId;
     private Float quantity;
     private Float stakingApr;
     private Integer stakingDays;
     private Timestamp stakingTime;
     private Timestamp redeemTime;
     private Integer isRedeem; 
     
     public StakingDetail() {
    	 
     }

	





	public StakingDetail(Integer stakingId, Integer userId, Float quantity, Float stakingApr, Integer stakingDays,
			Timestamp stakingTime, Timestamp redeemTime, Integer isRedeem) {
		this.stakingId = stakingId;
		this.userId = userId;
		this.quantity = quantity;
		this.stakingApr = stakingApr;
		this.stakingDays = stakingDays;
		this.stakingTime = stakingTime;
		this.redeemTime = redeemTime;
		this.isRedeem = isRedeem;
	}







	public Integer getStakingId() {
		return stakingId;
	}

	public void setStakingId(Integer stakingId) {
		this.stakingId = stakingId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public Timestamp getStakingTime() {
		return stakingTime;
	}

	public void setStakingTime(Timestamp stakingTime) {
		this.stakingTime = stakingTime;
	}

	public Timestamp getRedeemTime() {
		return redeemTime;
	}

	public void setRedeemTime(Timestamp redeemTime) {
		this.redeemTime = redeemTime;
	}

	
	

	
	public Integer getIsRedeem() {
		return isRedeem;
	}







	public void setIsRedeem(Integer isRedeem) {
		this.isRedeem = isRedeem;
	}







	public Float getStakingApr() {
		return stakingApr;
	}

	


	public Integer getStakingDays() {
		return stakingDays;
	}


	public void setStakingDays(Integer stakingDays) {
		this.stakingDays = stakingDays;
	}







	public void setStakingApr(Float stakingApr) {
		this.stakingApr = stakingApr;
	}



	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	};
	
	
     
     
}
=======
package spring.mvc.crypto.model.entity;

import java.sql.Timestamp;

public class StakingDetail {
     private Integer stakingId;
     private Integer userId;
     private Float quantity;
     private Float stakingApr;
     private Integer stakingDays;
     private Timestamp stakingTime;
     private Timestamp redeemTime;
     private Integer isRedeem; 
     
     public StakingDetail() {
    	 
     }

	





	public StakingDetail(Integer stakingId, Integer userId, Float quantity, Float stakingApr, Integer stakingDays,
			Timestamp stakingTime, Timestamp redeemTime, Integer isRedeem) {
		this.stakingId = stakingId;
		this.userId = userId;
		this.quantity = quantity;
		this.stakingApr = stakingApr;
		this.stakingDays = stakingDays;
		this.stakingTime = stakingTime;
		this.redeemTime = redeemTime;
		this.isRedeem = isRedeem;
	}







	public Integer getStakingId() {
		return stakingId;
	}

	public void setStakingId(Integer stakingId) {
		this.stakingId = stakingId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public Timestamp getStakingTime() {
		return stakingTime;
	}

	public void setStakingTime(Timestamp stakingTime) {
		this.stakingTime = stakingTime;
	}

	public Timestamp getRedeemTime() {
		return redeemTime;
	}

	public void setRedeemTime(Timestamp redeemTime) {
		this.redeemTime = redeemTime;
	}

	
	

	
	public Integer getIsRedeem() {
		return isRedeem;
	}







	public void setIsRedeem(Integer isRedeem) {
		this.isRedeem = isRedeem;
	}







	public Float getStakingApr() {
		return stakingApr;
	}

	


	public Integer getStakingDays() {
		return stakingDays;
	}


	public void setStakingDays(Integer stakingDays) {
		this.stakingDays = stakingDays;
	}







	public void setStakingApr(Float stakingApr) {
		this.stakingApr = stakingApr;
	}



	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	};
	
	
     
     
}
>>>>>>> branch 'master' of https://github.com/fffff40103/CryptoWebProject.git
