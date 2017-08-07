package semi.coupon;

import java.sql.Date;

public class CouponDTO {

	
	private int	coupon_idx ;
	private String coupon_name ;
	
	private String coupon_food_type;
	private int	coupon_value ;
	private Date coupon_start ;
	private String coupon_end ;
	private int	coupon_type ;
	
	
	

	public String getCoupon_end() {
		return coupon_end;
	}

	public void setCoupon_end(String coupon_end) {
		this.coupon_end = coupon_end;
	}

	public int getCoupon_idx() {
		return coupon_idx;
	}

	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getCoupon_food_type() {
		return coupon_food_type;
	}

	public void setCoupon_food_type(String coupon_food_type) {
		this.coupon_food_type = coupon_food_type;
	}

	public int getCoupon_value() {
		return coupon_value;
	}

	public void setCoupon_value(int coupon_value) {
		this.coupon_value = coupon_value;
	}

	public Date getCoupon_start() {
		return coupon_start;
	}

	public void setCoupon_start(Date coupon_start) {
		this.coupon_start = coupon_start;
	}


	public int getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(int coupon_type) {
		this.coupon_type = coupon_type;
	}

	public CouponDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public CouponDTO(int coupon_idx, String coupon_name, String coupon_food_type, int coupon_value, Date coupon_start,
			String coupon_end, int coupon_type) {
		super();
		this.coupon_idx = coupon_idx;
		this.coupon_name = coupon_name;
		this.coupon_food_type = coupon_food_type;
		this.coupon_value = coupon_value;
		this.coupon_start = coupon_start;
		this.coupon_end = coupon_end;
		this.coupon_type = coupon_type;
	
	}


	
	
	

	
	
	
	
}
