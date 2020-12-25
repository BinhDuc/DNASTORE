package dnastore.beans;

public class Doanhthutheongay {
	private String total;
	private String ngay;
	/**
	 * 
	 */
	public Doanhthutheongay() {
		
	}
	/**
	 * @param total
	 * @param ngay
	 */
	public Doanhthutheongay(String total, String ngay) {
		super();
		this.total = total;
		this.ngay = ngay;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getNgay() {
		return ngay;
	}
	public void setNgay(String ngay) {
		this.ngay = ngay;
	}
	
}
