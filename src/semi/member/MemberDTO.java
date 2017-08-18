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

/* create table customer(
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
store_idx number(4) 
)

create sequence customer_idx
minvalue 0 start with 1;

create sequence ceo_idx
minvalue 0 start with 1;


insert into customer values(customer_idx.nextval, '�ۺ���', '11111111a', '�� ���� 1ȣ��?', '�̹α�', 'nokcha90', '�����/�߶���/����', '299-1', 'nokcha90@naver.com', '010-3896-2833')
insert into ceo values(ceo_idx.nextval, '������', '11111111a', '�� ���� 1ȣ��?', '�̹α�', 'nokcha90@naver.com', 'admin')
insert into ceo values(ceo_idx.nextval, 'ġŲ', '11111111a', '�� ���� 1ȣ��?', '�۹α�', 'nokcha90@naver.com', 'ceo')
 */
	
