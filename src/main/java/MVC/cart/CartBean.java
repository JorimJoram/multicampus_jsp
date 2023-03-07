package MVC.cart;

import java.util.*;

public class CartBean {
	private final String ID = "wkdgyfla97";
	private final String PASSWD = "1234";
	ArrayList<String> productList;
	
	public CartBean() {
		productList = new ArrayList<String>();
	}
	
	public boolean checkLogin(String id, String passwd) {
		boolean result = false;
		if(ID.equals(id) && PASSWD.equals(passwd) && id != null && passwd != null) {
			result = true;
		}
		return result;
	}
	public ArrayList<String> getProductList(){
		return this.productList;
	}
	public void addProduct(String product) {
		this.productList.add(product);
	}
	public void clearProductList() {
		this.productList.clear();
	}
}
