package spring.mvc.crypto.model.entity;

public class StatusDetail {
	private Integer statusId;
	private String statusFor;
	
	public StatusDetail() {
		
	}

	public StatusDetail(Integer statusId, String statusFor) {
		super();
		this.statusId = statusId;
		this.statusFor = statusFor;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getStatusFor() {
		return statusFor;
	}

	public void setStatusFor(String statusFor) {
		this.statusFor = statusFor;
	}

	

	
	
	
}
