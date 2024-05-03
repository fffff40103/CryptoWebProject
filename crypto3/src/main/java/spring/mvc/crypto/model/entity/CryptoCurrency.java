package spring.mvc.crypto.model.entity;

public class CryptoCurrency {
		
		private Integer cNumber;//貨幣代號
	 	private String cName;//貨幣名稱
	    private Float price;//貨幣價格	
		private Float rate;//貨幣漲跌幅度
		private String cap;//貨幣市值
		
		//建立空建構子，讓他可以用setter方式注入
		public CryptoCurrency() {
			
		}
		public CryptoCurrency(String cName,Float price,Float  rate,String cap) {
	    	this.cName=cName;//貨幣名稱
	    	this.price=price;//貨幣價格
	    	this.cap=cap;//貨幣市值
	    	this.rate=rate;
	    }
	    public CryptoCurrency(Integer cNumber,String cName,Float price,Float rate,String cap) {
	    	this.cNumber=cNumber;//貨幣代號，這裡用auto_increment
	    	this.cName=cName;//貨幣名稱
	    	this.price=price;//貨幣價格
	    	this.cap=cap;//貨幣市值
	    	this.rate=rate;
	    }
		public Integer getcNumber() {
			return cNumber;
		}
		public void setcNumber(Integer cNumber) {
			this.cNumber = cNumber;
		}
		public String getcName() {
			return cName;
		}
		public void setcName(String cName) {
			this.cName = cName;
		}
		public Float getPrice() {
			return price;
		}
		public void setPrice(Float price) {
			this.price = price;
		}
		public Float getRate() {
			return rate;
		}
		public void setRate(Float rate) {
			this.rate = rate;
		}
		public String getCap() {
			return cap;
		}
		public void setCap(String cap) {
			this.cap = cap;
		}
		@Override
		public String toString() {
			
			return "名稱"+cName+"價格"+price+"波動率"+rate+"市值"+cap;
		}
		

		
}
