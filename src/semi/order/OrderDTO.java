package semi.order;



public class OrderDTO {

	
	
	//view of menu check for ceo  


	private int order_idx;
	private int store_idx;
	private int mem_idx;
	private int price ;
	private	String memo;
	private String order_date;

	private int user_coupon; 
	private int finish ;
	private int final_price ;
	
	private int pay_type ; 
	private String c_name;
	private String c_tel;
	private String c_addr;
	
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
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





	public int getUser_coupon() {
		return user_coupon;
	}





	public void setUser_coupon(int user_coupon) {
		this.user_coupon = user_coupon;
	}





	public int getFinish() {
		return finish;
	}





	public void setFinish(int finish) {
		this.finish = finish;
	}





	public int getFinal_price() {
		return final_price;
	}





	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}





	public int getPay_type() {
		return pay_type;
	}





	public void setPay_type(int pay_type) {
		this.pay_type = pay_type;
	}





	public String getC_name() {
		return c_name;
	}





	public void setC_name(String c_name) {
		this.c_name = c_name;
	}





	public String getC_tel() {
		return c_tel;
	}





	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}





	public String getC_addr() {
		return c_addr;
	}





	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}





	public OrderDTO(int order_idx, int store_idx, int mem_idx, int price, String memo, String order_date,
			int user_coupon, int finish, int final_price, int pay_type, String c_name, String c_tel, String c_addr) {
		super();
		this.order_idx = order_idx;
		this.store_idx = store_idx;
		this.mem_idx = mem_idx;
		this.price = price;
		this.memo = memo;
		this.order_date = order_date;
		this.user_coupon = user_coupon;
		this.finish = finish;
		this.final_price = final_price;
		this.pay_type = pay_type;
		this.c_name = c_name;
		this.c_tel = c_tel;
		this.c_addr = c_addr;
	}
	
	
	
		
	
	
}
