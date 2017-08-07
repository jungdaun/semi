package semi.food;

public class FoodDTO {
	
	private int store_idx;
	private String food_name;
	private String food_type;
	private int food_price;
	private String food_info;
	
	public FoodDTO() { }

	public FoodDTO(int store_idx, String food_name, String food_type, int food_price, String food_info) {
		super();
		this.store_idx = store_idx;
		this.food_name = food_name;
		this.food_type = food_type;
		this.food_price = food_price;
		this.food_info = food_info;
	}



	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_type() {
		return food_type;
	}

	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	public String getFood_info() {
		return food_info;
	}

	public void setFood_info(String food_info) {
		this.food_info = food_info;
	}

}
