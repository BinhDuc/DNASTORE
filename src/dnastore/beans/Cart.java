package dnastore.beans;

import java.util.TreeMap;

public class Cart {
	private TreeMap<Product, Integer> list;
	private long cartID;
	
	public Cart() {
		list = new TreeMap<>();
		cartID = System.currentTimeMillis();
	}

	/**
	 * @param list
	 * @param cartID
	 */
	public Cart(TreeMap<Product, Integer> list, long cartID) {
		this.list = list;
		this.cartID = cartID;
	}

	public TreeMap<Product, Integer> getList() {
		return list;
	}

	public void setList(TreeMap<Product, Integer> list) {
		this.list = list;
	}

	public long getCartID() {
		return cartID;
	}

	public void setCartID(long cartID) {
		this.cartID = cartID;
	}

	public void addToCart(Product sp, int so_luong) {
		boolean bln = list.containsKey(sp);
		if(bln) {
			int sl = list.get(sp);
			so_luong += sl;
			list.put(sp, so_luong);
		}else {
			list.put(sp, so_luong);
		}
	}
	public void subToCart(Product sp, int so_luong) {
		boolean bln = list.containsKey(sp);
		if(bln) {
			int sl = list.get(sp);
			so_luong = sl - so_luong;
			if(so_luong <= 0) {
				list.remove(sp);
			}else {
				list.remove(sp);
				list.put(sp, so_luong);
			}
		}
	}
	public void removeToCart(Product sp) {
		boolean bln = list.containsKey(sp);
		if(bln) {
			list.remove(sp);
		}
	}
	
}
