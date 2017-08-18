package semi.review;
import java.util.*;

public class ReviewDTO {
	
	private int c_idx;
	private String c_name; //손님 id
	private int store_idx; //가게 idx
	private int up_date; //저장 날짜
	private int score_num;  //평점 ->store로 보내야함.
	private String review; //contents
	private String r_picture; //사진이름 = 가게 idx_손님 이름(string)
	private String r_pwd;
	
	public ReviewDTO() { }

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public int getDate() {
		return up_date;
	}

	public void setDate(int date) {
		this.up_date = date;
	}

	public int getScore_num() {
		return score_num;
	}

	public void setScore_num(int score_num) {
		this.score_num = score_num;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getR_picture() {
		return r_picture;
	}

	public void setR_picture(String r_picture) {
		this.r_picture = r_picture;
	}

	public String getR_pwd() {
		return r_pwd;
	}

	public void setR_pwd(String r_pwd) {
		this.r_pwd = r_pwd;
	}
}

/* create table review(
c_idx number(4),
c_name varchar2(10),
store_idx number(4),
up_date number(20),
score_num number(4),
review varchar2(200),
r_picture varchar2(100),
r_pwd varchar2(20)
)
 */