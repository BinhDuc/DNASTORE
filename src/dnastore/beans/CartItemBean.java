package dnastore.beans;
/**
*
* @author Lonely
*/
public class CartItemBean {
	private String number;
	private String code;
    private String name;
    private double price;
    private int quantity;
    private double TotalCost;
    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
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
	public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getTotalCost() {
        return TotalCost;
    }
    public void setTotalCost(double TotalCost) {
        this.TotalCost = TotalCost;
    }
}
