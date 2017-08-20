package semi.member;



public class MemberDTO {

	private String name;
	private String id;
	private String password;
	private String tel;
	private String email;
	private String ans;
	private String ask;
	private String address;
	private String address2;
	private int my_idx;


	
	public MemberDTO() {
	}
	
	
	
	public MemberDTO(String name, String email, String ask, String ans) {
		super();
		this.name = name;
		this.email = email;
		this.ask = ask;
		this.ans = ans; 
	}



	public MemberDTO(String name, String id, String password, String email, String ask, String ans,int my_idx) {
		super();
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
		this.ans = ans;
		this.ask = ask;
		this.my_idx = my_idx;
	}
	
	



	public MemberDTO(String name, String tel, String email, String ask, String ans, String address, String address2) {
		super();
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.ans = ans;
		this.ask = ask;
		this.address = address;
		this.address2 = address2;
	}



	public MemberDTO(String name, String id, String password, String tel, String email, String ask, String ans,
			String address, String address2, int my_idx) {
		super();
		this.name = name;
		this.id = id;
		this.password = password;
		this.tel = tel;
		this.email = email;
		this.ans = ans;
		this.ask = ask;
		this.address = address;
		this.address2 = address2;
		this.my_idx = my_idx;
	}



	public String getAddress2() {
		return address2;
	}



	public void setAddress2(String address2) {
		this.address2 = address2;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getAns() {
		return ans;
	}



	public void setAns(String ans) {
		this.ans = ans;
	}



	public String getAsk() {
		return ask;
	}



	public void setAsk(String ask) {
		this.ask = ask;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public int getMy_idx() {
		return my_idx;
	}



	public void setMy_idx(int my_idx) {
		this.my_idx = my_idx;
	}
	
	
	
	
}
/*
create table customer(
my_idx number(4) primary key,
name  varchar2(10),
password varchar2(12),
ask varchar2(100),
ans varchar2(40),
id varchar2(10),    
address varchar2(40),
address2 varchar2(80),
email varchar2(40),
tel varchar2(15)
)

create table ceo(
my_idx number(4) primary key,
name varchar2(10),
password varchar2(12),
ask varchar2(100),
ans varchar2(40),
email varchar2(40),
id varchar2(10)
)

create sequence customer_idx
minvalue 0 start with 1;

create sequence ceo_idx
minvalue 0 start with 1;


insert into customer values(1, '송병훈', '11111111a', '내 보물 1호는?', '이민기', 'nokcha90', '서울시 중랑구 묵동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(2, '송중기', '11111111a', '내 보물 1호는?', '이민기', 'nokcha91', '서울시 중랑구 중화동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(2, '송하나', '11111111a', '내 보물 1호는?', '이민기', 'nokcha92', '서울시 중랑구 상봉동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(4, '송혜교', '11111111a', '내 보물 1호는?', '이민기', 'nokcha93', '서울시 중랑구 망우동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(5, '송지현', '11111111a', '내 보물 1호는?', '이민기', 'nokcha94', '서울시 중랑구 신내동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(6, '송민기', '11111111a', '내 보물 1호는?', '이민기', 'nokcha95', '서울시 중랑구 묵동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(7, '송다운', '11111111a', '내 보물 1호는?', '이민기', 'nokcha96', '서울시 중랑구 중화동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(8, '송예랑', '11111111a', '내 보물 1호는?', '이민기', 'nokcha97', '서울시 노원구 중계동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(9, '송빈', '11111111a', '내 보물 1호는?', '이민기', 'nokcha98', '서울시 노원구 하계동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(10, '송동건', '11111111a', '내 보물 1호는?', '이민기', 'nokcha99', '서울시 노원구 공릉동', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into customer values(11, '송인성', '11111111a', '내 보물 1호는?', '이민기', 'nokcha00', '서울시 노원구 상계동', '299-1', 'nokcha90@naver.com', '010-3896-2833')



insert into ceo values(1, '관리자', '11111111a', '내 보물 1호는?', '이민기', 'nokcha90@naver.com', 'admin')
insert into ceo values(2, '치킨', '11111111a', '내 보물 1호는?', '송민기', 'nokcha90@naver.com', 'ceo')*/