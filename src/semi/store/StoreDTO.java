package semi.store;
import java.util.*;

public class StoreDTO {

	private int store_idx;
	private String store_type;
	private String store_name;
	private String store_addr;
	private String store_phone;
	private Date open_time;
	private Date close_time;
	private int lowest_price;
	private int review_num; 
	private int sale_num;
	private int score_num; 
	
	public StoreDTO() {}
	
	public StoreDTO(int store_idx, String store_name, String store_addr, int review_num, int sale_num, int score_num) {
		super();
		this.store_idx = store_idx;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.review_num = review_num;
		this.sale_num = sale_num;
		this.score_num = score_num;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getStore_type() {
		return store_type;
	}

	public void setStore_type(String store_type) {
		this.store_type = store_type;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getStore_phone() {
		return store_phone;
	}

	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}

	public Date getOpen_time() {
		return open_time;
	}

	public void setOpen_time(Date open_time) {
		this.open_time = open_time;
	}

	public Date getClose_time() {
		return close_time;
	}

	public void setClose_time(Date close_time) {
		this.close_time = close_time;
	}

	public int getLowest_price() {
		return lowest_price;
	}

	public void setLowest_price(int lowest_price) {
		this.lowest_price = lowest_price;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getSale_num() {
		return sale_num;
	}

	public void setSale_num(int sale_num) {
		this.sale_num = sale_num;
	}

	public int getScore_num() {
		return score_num;
	}

	public void setScore_num(int score_num) {
		this.score_num = score_num;
	}	
	
}
