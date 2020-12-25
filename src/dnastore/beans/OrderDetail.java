package dnastore.beans;

public class OrderDetail {
	private int id ;
	private Order orders_id;
	private Product product_id;
	private int quantity;
	private double total_price;
	private int coupon;
	
	public OrderDetail() {
		
	}

	/**
	 * @param id
	 * @param orders_id
	 * @param product_id
	 * @param quantity
	 * @param total_price
	 * @param coupon
	 */
	public OrderDetail(int id, Order orders_id, Product product_id, int quantity, double total_price, int coupon) {
		this.id = id;
		this.orders_id = orders_id;
		this.product_id = product_id;
		this.quantity = quantity;
		this.total_price = total_price;
		this.coupon = coupon;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Order getOrders_id() {
		return orders_id;
	}

	public void setOrders_id(Order orders_id) {
		this.orders_id = orders_id;
	}

	public Product getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Product product_id) {
		this.product_id = product_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

	public int getCoupon() {
		return coupon;
	}

	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	
}
