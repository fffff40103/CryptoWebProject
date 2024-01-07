package spring.mvc.crypto.model.entity;

public class CrawlerCurrency {
		
		private Integer pNumber;//貨幣代號
	 	private String pName;//貨幣名稱
	    private Float pPrice;//貨幣價格	
		private Float pRate;//貨幣漲跌幅度
		private String pCap;//貨幣市值
		
		//建立空建構子，讓他可以用setter方式注入
		public CrawlerCurrency() {
			
		}
		public CrawlerCurrency(String pName,Float pPrice,Float  pRate,String pCap) {
	    	this.pName=pName;//貨幣名稱
	    	this.pPrice=pPrice;//貨幣價格
	    	this.pRate=pRate;//貨幣波動率
	    	this.pCap=pCap;//貨幣市值
	    	
	    }
	    public CrawlerCurrency(Integer pNumber,String pName,Float pPrice,Float pRate,String pCap) {
	    	this.pNumber=pNumber;//貨幣代號，這裡用auto_increment
	    	this.pName=pName;//貨幣名稱
	    	this.pPrice=pPrice;//貨幣價格
	    	this.pRate=pRate;//貨幣波動率
	    	this.pCap=pCap;//貨幣市值
	    }
	    
		public Integer getpNumber() {
			return pNumber;
		}
		public void setpNumber(Integer pNumber) {
			this.pNumber = pNumber;
		}
		public String getpName() {
			return pName;
		}
		public void setpName(String pName) {
			this.pName = pName;
		}
		public Float getpPrice() {
			return pPrice;
		}
		public void setpPrice(Float pPrice) {
			this.pPrice = pPrice;
		}
		public Float getpRate() {
			return pRate;
		}
		public void setpRate(Float pRate) {
			this.pRate = pRate;
		}
		public String getpCap() {
			return pCap;
		}
		public void setpCap(String pCap) {
			this.pCap = pCap;
		}
		@Override
		public String toString() {
			return "貨幣名稱"+pName+"貨幣價格"+pPrice+"貨幣波動"+pRate+"貨幣市值"+pCap;
		}
		

		
}
