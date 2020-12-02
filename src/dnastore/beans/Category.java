package dnastore.beans;

public class Category {
	private String categoryId;
	private String categoryname;
	private String subid;
	public Category() {
		
	}

	public Category(String categoryId, String categoryname, String subid) {
		this.categoryId = categoryId;
		this.categoryname = categoryname;
		this.subid = subid;
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

	public String getSubid() {
		return subid;
	}

	public void setSubid(String subid) {
		this.subid = subid;
	}
	
	
}
