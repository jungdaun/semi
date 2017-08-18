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

/* Create table food (
	Store_idx number(4),
	food_name varchar2(10),
	food_type varchar2(10),
	food_price number(5),
	food_info varchar2(20),
)


insert into food values(2, 'fried', 'main', 17000, 'taste good!')
insert into food values(2, 'cheese', 'side', 17000, 'taste good!')
insert into food values(2, 'garlic', 'main', 17000, 'taste good!')
insert into food values(2, 'nugget', 'side', 17000, 'taste good!')
insert into food values(2, 'padak', 'main', 17000, 'taste good!')
insert into food values(2, 'rice', 'side', 17000, 'taste good!')
insert into food values(2, 'ring', 'side', 17000, 'taste good!')
insert into food values(2, 'salad', 'side', 17000, 'taste good!')
insert into food values(2, 'wing', 'side', 17000, 'taste good!')
insert into food values(2, 'yang', 'main', 17000, 'taste good!')
insert into food values(2, 'hot', 'etc', 17000, 'taste good!')
insert into food values(2, 'mu', 'etc', 17000, 'taste good!')
insert into food values(2, 'sweat', 'etc', 17000, 'taste good!')


 */