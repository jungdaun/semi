package semi.cart;

public class CartDTO {
	
	private int store_idx;
	private int customer_idx;
	private String food_name;
	private int food_price;
	private int food_count;
	private int total_price;
	
	public CartDTO() { }

	public CartDTO(int store_idx, int customer_idx, String food_name, int food_price, int food_count, int total_price) {
		super();
		this.store_idx = store_idx;
		this.customer_idx = customer_idx;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_count = food_count;
		this.total_price = total_price;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public int getCustomer_idx() {
		return customer_idx;
	}

	public void setCustomer_idx(int customer_idx) {
		this.customer_idx = customer_idx;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	public int getFood_count() {
		return food_count;
	}

	public void setFood_count(int food_count) {
		this.food_count = food_count;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

}
