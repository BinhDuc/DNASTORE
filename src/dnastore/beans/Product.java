package dnastore.beans;

public class Product extends Category implements Comparable<Product>{
	
	private String code;
	private String name;
	private int price;
	private int discount;
	private byte[] image;
	private String note;
	private int quantity;
	
	public Product() {
		
	}
	
	

	public Product(String code, String name, int price, int discount, byte[] image, String note,
			int quantity,String categoryId, String categoryname, String subid) {
		super(categoryId,categoryname,subid);
		this.code = code;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image = image;
		this.note = note;
		this.quantity = quantity;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getDiscount() {
		return discount;
	}



	public void setDiscount(int discount) {
		this.discount = discount;
	}



	public byte[] getImage() {
		return image;
	}



	public void setImage(byte[] image) {
		this.image = image;
	}



	public String getNote() {
		return note;
	}



	public void setNote(String note) {
		this.note = note;
	}


	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	@Override
	public int compareTo(Product sp) {
		return Integer.parseInt(this.code) - Integer.parseInt(sp.code);
	}
	
}
