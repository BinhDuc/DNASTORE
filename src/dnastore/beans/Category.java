package dnastore.beans;

public class Category {
	private String categoryId;
	private String categoryname;
	
	public Category() {
		
	}

	public Category(String categoryId, String categoryname) {
		this.categoryId = categoryId;
		this.categoryname = categoryname;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	
}
