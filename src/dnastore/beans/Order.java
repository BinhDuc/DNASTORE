package dnastore.beans;

import java.sql.Timestamp;

public class Order {
	private String id;
	private Account username;
	private String address;
	private String payment;
	private Timestamp orderdate;
	private int status;
	private String customer;
	private String phone;
	
	public Order() {
		
	}

	/**
	 * @param id
	 * @param username
	 * @param address
	 * @param payment
	 * @param orderdate
	 * @param status
	 * @param customer
	 * @param phone
	 */
	public Order(String id, Account username, String address, String payment, Timestamp orderdate, int status,
			String customer, String phone) {
		this.id = id;
		this.username = username;
		this.address = address;
		this.payment = payment;
		this.orderdate = orderdate;
		this.status = status;
		this.customer = customer;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Account getUsername() {
		return username;
	}

	public void setUsername(Account username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Timestamp getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	
	
}
