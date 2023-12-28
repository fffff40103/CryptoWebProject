package spring.mvc.crypto.model.entity;

public class CryptoCurrency {
		
		private Integer cryptoId;//貨幣代號
	 	private String name;//貨幣名稱
	    private Float price;//貨幣價格
		private String value;//貨幣市值
		private Float rate;//貨幣漲跌幅度
		
		//建立空建構子，讓他可以用setter方式注入
		public CryptoCurrency() {
			
		}
		public CryptoCurrency(String name,Float price,String value,Float  rate) {
	    	this.name=name;//貨幣名稱
	    	this.price=price;//貨幣價格
	    	this.value=value;//貨幣市值
	    	this.rate=rate;
	    }
	    public CryptoCurrency(Integer cryptoId,String name,Float price,String value,Float rate) {
	    	this.cryptoId=cryptoId;//貨幣代號，這裡用auto_increment
	    	this.name=name;//貨幣名稱
	    	this.price=price;//貨幣價格
	    	this.value=value;//貨幣市值
	    	this.rate=rate;
	    }
		public Integer getCryptoId() {
			return cryptoId;
		}
		public void setCryptoId(Integer cryptoId) {
			this.cryptoId = cryptoId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Float getPrice() {
			return price;
		}
		public void setPrice(Float price) {
			this.price = price;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		
		public void setRate(Float rate) {
			this.rate=rate;
		}
		
		
		public Float getRate() {
			return rate;
		}
		
		@Override
		public String toString() {
			return "CryptoCurrency [" +  " name=" + name + ", price=" + price + ", value=" + value
					+ ", rate=" + rate + "]";
		}

		
}
