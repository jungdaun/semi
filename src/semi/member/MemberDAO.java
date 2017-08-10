package semi.member;

import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;

	public static final int ERROR = -1;

	public MemberDAO() {
	}

	public int memberJoin(MemberDTO dto) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "insert into customer values(customer_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getAsk());
			ps.setString(4, dto.getAns());
			ps.setString(5, dto.getId());
			ps.setString(6, dto.getAddress());
			ps.setString(7, dto.getAddress2());
			ps.setString(8, dto.getEmail());
			ps.setString(9, dto.getTel());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public int ceoJoin(MemberDTO dto) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "insert into ceo values(ceo_idx.nextval, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getAsk());
			ps.setString(4, dto.getAns());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getId());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public int memberOut(String id, String type) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = null;
			if(type.equals("고객")) {
				sql = "delete from customer where id = ?";
			} else {
				sql = "delete from ceo where id = ?";
			}
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	public void close2() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Boolean idCheck(String id) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "select * from customer where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				close2();
			} catch (Exception e2) {
			}
		}
	}
	
	public Boolean ceoCheck(String id) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "select * from ceo where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				close2();
			} catch (Exception e2) {
			}
		}
	}

	/** 로그인 검증 관련 메소드 */
	public int loginCheck(String userid, String userpwd) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "select password from customer where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(userpwd)) {
					return LOGIN_OK;
				} else {
					return NOT_PWD;
				}
			} else {
				return NOT_ID;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally { // 에러 발생 시, 아닐 시 상관 없이 파이널리 안에 있는 것 실행
			try {
				close2();
			} catch (Exception e2) {

			}
		}
	}
	
	/** 로그인 검증 관련 메소드 */
	public int loginceoCheck(String userid, String userpwd) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "select password from ceo where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(userpwd)) {
					return LOGIN_OK;
				} else {
					return NOT_PWD;
				}
			} else {
				return NOT_ID;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally { // 에러 발생 시, 아닐 시 상관 없이 파이널리 안에 있는 것 실행
			try {
				close2();
			} catch (Exception e2) {

			}
		}
	}

	/** 사용자정보 추출 관련 메소드 */
	public String[] getUserInfo(String userid) {

		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "select name, my_idx, tel, address from customer where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			String[] arr = new String[4];
			
			while(rs.next()){
				arr[0] = rs.getString("name");
				arr[1] = rs.getString("my_idx");
				arr[2] = rs.getString("address");
				arr[3]=rs.getString("tel");
				
			}
			
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				close2();
			} catch (Exception e2) {

			}
		}
	}
	
	public String getCeoInfo(String userid) {

		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "select name from ceo where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				close2();
			} catch (Exception e2) {

			}
		}
	}
	
	
	//동일 이름일 경우는 해결, 동일 이메일일 경우 미결
	public String getUserId(String userName, String userEmail, String type) {
		try {
			conn = semi.db.SemiDb.getConn();
			
			System.out.print(userName + "1" + userEmail + "2" + type);
			
			String sql = null;
			if(type.equals("고객")) {
				sql = "select id, name from customer where email = ?";
			} else {
				sql = "select id, name from ceo where email = ?";
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, userEmail);
			rs = ps.executeQuery();
			rs.next();
			if(rs.getString(2).equals(userName)) {
				return rs.getString(1);
			} else {
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				close2();
			} catch (Exception e2) {

			}
		}
	}
	
	public String getUserPwd(String userId, String ask, String ans, String type) {
		try {
			
			conn = semi.db.SemiDb.getConn();
			String sql = null;
			if(type.equals("고객")) {
				sql = "select password, ask, ans from customer where id = ?";
			} else if(type.equals("사장")) {
				sql = "select password, ask, ans from ceo where id = ?";
			}
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			rs.next();
			if(rs.getString(3).equals(ans)&&rs.getString(2).equals(ask)) {
					return rs.getString(1);
			}
			return null;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				close2();
			} catch (Exception e2) {

			}
		}
	}
	
	public int getChangePwd(String password, String id, String type) {
		try {
			conn = semi.db.SemiDb.getConn();
			
			String sql = null;
			System.out.print("dd" + type);
			if(type.equals("고객")) {
				sql = "update customer set password = ? where id = ?";
			} else if(type.equals("사장")){
				sql = "update ceo set password = ? where id = ?";
			}

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, password);
			ps.setString(2, id);

			int count = ps.executeUpdate();

			return count;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				close2();
			} catch (Exception e2) {

			}
		}
	}
	
	public MemberDTO memberUpdate(MemberDTO dto, String type, String id) {
		try {
			conn=semi.db.SemiDb.getConn();
			String sql = null;
			if(type.equals("고객")) {
				sql = "select * from customer where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();

				if (rs.next()) {
					String name = rs.getString("name");
					String email = rs.getString("email");
					String tel = rs.getString("tel");
					String ask = rs.getString("ask");
					String ans = rs.getString("ans");
					String address = rs.getString("address");
					String address2 = rs.getString("address2");
					

					dto = new MemberDTO(name, tel, email, ask, ans, address, address2);

				}
			} else if(type.equals("사장")) {
				sql = "select * from ceo where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();

				if (rs.next()) {
					String name = rs.getString("name");
					String email = rs.getString("email");
					

					dto = new MemberDTO(name, email);

				}
			}
			
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally { // 에러 발생 시, 아닐 시 상관 없이 파이널리 안에 있는 것 실행
			try {
				close2();
			} catch (Exception e2) {

			}
		} // 자원반환시 위의 형식 필수
	}
	
	public int update_ok(MemberDTO dto) {
		try {
			conn=semi.db.SemiDb.getConn();
			String sql = "update customer set name = ?, tel = ?, address = ? , address2 = ?, email = ? where id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTel());
			ps.setString(3, dto.getAddress());
			ps.setString(4, dto.getAddress2());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getId());
			

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally { // 에러 발생 시, 아닐 시 상관 없이 파이널리 안에 있는 것 실행
			try {
				close2();
			} catch (Exception e2) {

			}
		} // 자원반환시 위의 형식 필수
	}
	
	public int ceoupdate_ok(MemberDTO dto) {
		try {
			conn=semi.db.SemiDb.getConn();
			String sql = "update ceo set name = ?, email = ? where id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getId());
			

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally { // 에러 발생 시, 아닐 시 상관 없이 파이널리 안에 있는 것 실행
			try {
				close2();
			} catch (Exception e2) {

			}
		} // 자원반환시 위의 형식 필수
	}
}
