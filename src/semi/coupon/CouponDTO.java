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
	private int	is_used ;
	
	
	

	public CouponDTO(int coupon_idx, String coupon_name, String coupon_food_type, int coupon_value, Date coupon_start,
			String coupon_end, int coupon_type, int is_used) {
		super();
		this.coupon_idx = coupon_idx;
		this.coupon_name = coupon_name;
		this.coupon_food_type = coupon_food_type;
		this.coupon_value = coupon_value;
		this.coupon_start = coupon_start;
		this.coupon_end = coupon_end;
		this.coupon_type = coupon_type;
		this.is_used = is_used;
	}

	public int getIs_used() {
		return is_used;
	}

	public void setIs_used(int is_used) {
		this.is_used = is_used;
	}

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
/*
create table user_coupon (
user_coupon_idx number primary key, 
mem_idx number, 
coupon_idx number, 
isused number (1)

)

create sequence user_coupon_idx_sq
start with 1

------------------------------------------


create table coupon (
coupon_idx number primary key, 
coupon_name varchar2(20), 
coupon_food_type  varchar2(20), 
coupon_value number, 
coupon_start date, 
coupon_end varchar2(10), 
coupon_type number(1)
)

create sequence coupon_sq
start with 1 

insert into coupon values (coupon_sq.nextval, 'cp1', 'chicken', 5000, to_date ('20170818', 'yyyymmdd'), '2017-09-01', 1)
insert into coupon values (coupon_sq.nextval, 'cp2', 'chicken', 50, to_date ('20170818', 'yyyymmdd'), '2017-09-01', 2 )
*/