package semi.member;

import java.sql.*;

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
	
	
	
	public MemberDTO(String name, String id, String password, String email, String ans, String ask,int my_idx) {
		super();
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
		this.ans = ans;
		this.ask = ask;
		this.my_idx = my_idx;
	}
	
	



	public MemberDTO(String name, String tel, String email, String ans, String ask, String address, String address2) {
		super();
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.ans = ans;
		this.ask = ask;
		this.address = address;
		this.address2 = address2;
	}



	public MemberDTO(String name, String id, String password, String tel, String email, String ans, String ask,
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
	
	
