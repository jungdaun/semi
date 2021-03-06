package semi.cart;

public class CartDTO {
	
	private int store_idx;
	private int customer_idx;
	private String food_name;
	private int food_price;
	private int food_count;
	private int total_price;
	private int finish;
	private int order_idx ;
	
	
	
	
	public CartDTO() { }

	public CartDTO(String food_name, int food_price, int food_count, int total_price) {
		super();
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_count = food_count;
		this.total_price = total_price;
	}

	
	
	
	
	public CartDTO(int store_idx, int customer_idx, String food_name, int food_price, int food_count, int total_price,
			int finish, int order_idx) {
		super();
		this.store_idx = store_idx;
		this.customer_idx = customer_idx;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_count = food_count;
		this.total_price = total_price;
		this.finish = finish;
		this.order_idx = order_idx;
	}

	public int getFinish() {
		return finish;
	}

	public void setFinish(int finish) {
		this.finish = finish;
	}

	public int getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
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

/* create table cart(
   Store_idx number(4),
   customer_idx number(4),
   food_name varchar2(50),
   food_price number(5),
   food_count number(3),
   total_price number(10),
   order_idx number,
   finish number(1)
  )
 */