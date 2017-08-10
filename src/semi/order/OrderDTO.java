package semi.order;



public class OrderDTO {

	
	
	//view of menu check for ceo  


	private int order_idx;
	private int store_idx;
	private int mem_idx;
	private int price ;
	private	String memo;
	private String order_date;

	private int coupon; 
	private int coupon_type;
	private String finish ;
	private int final_price ;
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
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public int getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(int coupon_type) {
		this.coupon_type = coupon_type;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public OrderDTO(int order_idx, int store_idx, int mem_idx, int price, String memo, String order_date, int coupon,
			int coupon_type, String finish, int final_price) {
		super();
		this.order_idx = order_idx;
		this.store_idx = store_idx;
		this.mem_idx = mem_idx;
		this.price = price;
		this.memo = memo;
		this.order_date = order_date;
		this.coupon = coupon;
		this.coupon_type = coupon_type;
		this.finish = finish;
		this.final_price = final_price;
	} 
	
		
	
	
}
