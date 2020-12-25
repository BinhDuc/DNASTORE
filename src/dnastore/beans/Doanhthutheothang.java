package dnastore.beans;

public class Doanhthutheothang {
	private String total;
	private String thang;
	
	public Doanhthutheothang() {
		
	}

	/**
	 * @param total
	 * @param thang
	 */
	public Doanhthutheothang(String total, String thang) {
		super();
		this.total = total;
		this.thang = thang;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getThang() {
		return thang;
	}

	public void setThang(String thang) {
		this.thang = thang;
	}
}
