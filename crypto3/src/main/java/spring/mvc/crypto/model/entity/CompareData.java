package spring.mvc.crypto.model.entity;

public class CompareData {
	private Integer compareNumber;
	private String compareName;
	private Float comparePrice;
	private Float compareRate;
	private String compareCap;
	
	public CompareData() {
		
	}

	public Integer getCompareNumber() {
		return compareNumber;
	}

	public void setCompareNumber(Integer compareNumber) {
		this.compareNumber = compareNumber;
	}

	public String getCompareName() {
		return compareName;
	}

	public void setCompareName(String compareName) {
		this.compareName = compareName;
	}

	public Float getComparePrice() {
		return comparePrice;
	}

	public void setComparePrice(Float comparePrice) {
		this.comparePrice = comparePrice;
	}

	public Float getCompareRate() {
		return compareRate;
	}

	public void setCompareRate(Float compareRate) {
		this.compareRate = compareRate;
	}

	public String getCompareCap() {
		return compareCap;
	}

	public void setCompareCap(String compareCap) {
		this.compareCap = compareCap;
	}

	@Override
	public String toString() {
		return "貨幣比較名稱"+compareName+"貨幣比較價格"+comparePrice+"貨幣比較波動"+compareRate+"貨幣比較市值"+compareCap;
	}
	
	
	
	
	
}
