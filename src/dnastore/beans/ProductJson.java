package dnastore.beans;

public class ProductJson {
	private String value;
	private String label;
	private int desc;
	private int discount;
	private int quantity;
	/**
	 * 
	 */
	public ProductJson() {
		
	}
	/**
	 * @param value
	 * @param label
	 * @param desc
	 * @param discount
	 * @param quantity
	 */
	public ProductJson(String value, String label, int desc, int discount, int quantity) {
		super();
		this.value = value;
		this.label = label;
		this.desc = desc;
		this.discount = discount;
		this.quantity = quantity;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getDesc() {
		return desc;
	}
	public void setDesc(int desc) {
		this.desc = desc;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
