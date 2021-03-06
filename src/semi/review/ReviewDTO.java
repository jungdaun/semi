package semi.review;
import java.util.*;

public class ReviewDTO {
	
	private int r_idx;
	private int c_idx;
	private String c_name; //손님 id
	private int store_idx; //가게 idx
	private String up_date; //저장 날짜
	private int score_num;  //평점 ->store로 보내야함.
	private String review; //contents
	private String r_picture; //사진이름 = 가게 idx_손님 이름(string)
	private String r_pwd;
	
	public ReviewDTO() { }

	public ReviewDTO(int r_idx, int c_idx, String c_name, int score_num, String review, String r_picture, String up_date) {
		super();
		this.r_idx = r_idx;
		this.c_idx = c_idx;
		this.up_date = up_date;
		this.c_name = c_name;
		this.score_num = score_num;
		this.review = review;
		this.r_picture = r_picture;
	}


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

	public String getUp_date() {
		return up_date;
	}

	public void setUp_date(String up_date) {
		this.up_date = up_date;
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

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	
}

/* create table review(
r_idx number(4) primary key,
c_idx number(4), //
c_name varchar2(10),
store_idx number(4),
up_date varchar2(20), //
score_num number(4),
review varchar2(200),
r_picture varchar2(100),
r_pwd varchar2(100)
)

insert into review values(1 , 1, '송병훈', 21, 'am1230', 4, '맛있네요!', 'http://localhost:9090/semi/store/img/review/2na.png', '1234')
insert into review values(2 , 6, '송민기', 21, 'pm1230', 3, '맛있네요!', 'http://localhost:9090/semi/store/img/review/2na.png', '1234')
insert into review values(3 , 7, '송다운', 21, 'am1230', 2, '맛있네요!', 'http://localhost:9090/semi/store/img/review/2na.png', '1234')
insert into review values(4 , 8, '송예랑', 21, 'pm1230', 1, '맛있네요!', 'http://localhost:9090/semi/store/img/review/2na.png', '1234')

 */