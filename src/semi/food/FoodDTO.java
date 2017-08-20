package semi.food;

public class FoodDTO {
	
	private int store_idx;
	private int food_num;
	private String food_name;
	private String food_type;
	private int food_price;
	private String food_info;
	private String food_image;
	
	public FoodDTO() { }

	public FoodDTO(int store_idx, int food_num, String food_name, String food_type, int food_price, String food_info, String food_image) {
		super();
		this.store_idx = store_idx;
		this.food_num = food_num;
		this.food_name = food_name;
		this.food_type = food_type;
		this.food_price = food_price;
		this.food_info = food_info;
		this.food_image = food_image;
	}
	
	
	public int getFood_num() {
		return food_num;
	}

	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}

	public String getFood_image() {
		return food_image;
	}

	public void setFood_image(String food_image) {
		this.food_image = food_image;
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
	food_num number(3),
	food_name varchar2(10),
	food_type varchar2(10),
	food_price number(5),
	food_info varchar2(20),
	food_image varchar2(100)
)

insert into food values(21, 1, 'fried', 'main', 17000, 'taste good!', '')
insert into food values(21, 2, 'cheese', 'side', 17000, 'taste good!', '')
insert into food values(21, 3, 'garlic', 'main', 17000, 'taste good!', '')
insert into food values(21, 4, 'nugget', 'side', 17000, 'taste good!', '')
insert into food values(21, 5, 'padak', 'main', 17000, 'taste good!', '')
insert into food values(21, 6, 'rice', 'side', 17000, 'taste good!', '')
insert into food values(21, 7, 'ring', 'side', 17000, 'taste good!', '')
insert into food values(21, 8, 'salad', 'side', 17000, 'taste good!', '')
insert into food values(21, 9, 'wing', 'side', 17000, 'taste good!', '')
insert into food values(21, 10, 'yang', 'main', 17000, 'taste good!', '')
insert into food values(21, 11, 'hot', 'etc', 17000, 'taste good!', '')
insert into food values(21, 12, 'mu', 'etc', 17000, 'taste good!', '')
insert into food values(21, 13, 'sweat', 'etc', 17000, 'taste good!', '')
*/