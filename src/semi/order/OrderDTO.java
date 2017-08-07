package semi.order;



public class OrderDTO {

	
	
	//view of menu check for ceo  
	private String c_name ;
	private String c_addr;
	private String c_tel;
	private int o_idx;
	private String menu;
	private int price ;
	private	String memo;
	private String order_date;
	private int s_idx;
	private int coupon; 
	private int coupon_type;
	private String finish ;
	
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public int getO_idx() {
		return o_idx;
	}
	public void setO_idx(int o_idx) {
		this.o_idx = o_idx;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
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
		
		System.out.println(order_date);
		return order_date;
		
		
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
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
	public OrderDTO(String c_name, String c_addr, String c_tel, int o_idx, String menu, int price, String memo,
			String order_date, int s_idx, int coupon, int coupon_type, String finish) {
		super();
		this.c_name = c_name;
		this.c_addr = c_addr;
		this.c_tel = c_tel;
		this.o_idx = o_idx;
		this.menu = menu;
		this.price = price;
		this.memo = memo;
		this.order_date = order_date;
		this.s_idx = s_idx;
		this.coupon = coupon;
		this.coupon_type = coupon_type;
		this.finish = finish;
	} 
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	//////////////////order component for customer //////////////////////////////////////
	
	

	
	
	
	
}
