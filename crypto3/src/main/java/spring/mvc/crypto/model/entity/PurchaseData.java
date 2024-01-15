package spring.mvc.crypto.model.entity;

public class PurchaseData {
	private String cryptoName;
	private String cryptoPrice;
	private Number cryptoAmount;
	public String getCryptoName() {
		return cryptoName;
	}
	public void setCryptoName(String cryptoName) {
		this.cryptoName = cryptoName;
	}
	public String getCryptoPrice() {
		return cryptoPrice;
	}
	public void setCryptoPrice(String cryptoPrice) {
		this.cryptoPrice = cryptoPrice;
	}
	public Number getCryptoAmount() {
		return cryptoAmount;
	}
	public void setCryptoAmount(Float cryptoAmount) {
		this.cryptoAmount = cryptoAmount;
	}
	@Override
	public String toString() {
		return "cName:"+cryptoName+"cPrice"+cryptoPrice+"cNumber"+cryptoAmount;
	}
	
	
	
	
	
}
