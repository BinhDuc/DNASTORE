package dnastore.beans;

public class Product extends Category{
	private String code;
	private byte[] image;
	private String name;
	private int price;
	private String note;
	
	public Product() {
		
	}
	
	

	public Product(String code, byte[] image, String name, int price, String note,String categoryId,String categoryname) {
		super(categoryId,categoryname);
		this.code = code;
		this.image = image;
		this.name = name;
		this.price = price;
		this.note = note;
	}



	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
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



	public String getNote() {
		return note;
	}



	public void setNote(String note) {
		this.note = note;
	}
	
}
