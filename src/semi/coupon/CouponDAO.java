package semi.coupon;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CouponDAO {
	
	

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	static final int ALREADY_HAVE= -2; 
	
	

	
	
	public boolean doesHave (int coupon_idx , int mem_idx ){
		try {

			conn = semi.db.SemiDb.getConn();
			String sql = "select user_coupon_idx from user_coupon where coupon_idx = ? and mem_idx = ?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, coupon_idx);
			ps.setInt(2, mem_idx);
			rs=ps.executeQuery();
			 return rs.next();
			 
			
			
		} catch (Exception e) {
			e. printStackTrace( );
			return false; 
			// TODO: handle exception
		}finally {
			try {
				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			
			}
		}
	}
	
	
	public String getCouponName (int cIdx ){
		try {

			conn = semi.db.SemiDb.getConn();
			String sql = "select coupon_name from coupon where coupon_idx =("
					+ "select coupon_idx from user_coupon where user_coupon_idx = ?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cIdx);
			rs=ps.executeQuery();
			rs.next();
			
			String res= rs.getString(1);
			return res;
			
			
			
		} catch (Exception e) {
			e. printStackTrace( );
			return null; 
			// TODO: handle exception
		}finally {
			try {
				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			
			}
		}
	}
	
	public int getCouponValue( int coupon_idx, int temp){
		try {
			

			
			conn = semi.db.SemiDb.getConn();
			String sql =" select coupon_type, coupon_value from coupon where coupon_idx = ("
					+ "select coupon_idx from user_coupon where user_coupon_idx= ?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, coupon_idx);
			rs=ps.executeQuery();
			
			rs.next();
			
			int type = rs.getInt("coupon_type");
			int value = rs.getInt("coupon_value"); 
			if (type ==1){
				value = temp - value; 
			}
			else if (type ==2){
				value = temp-temp *value/100; 
			}
			return value ; 
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace( );
			return 0; 
		}
		finally {
			try {

				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	public int deletePastCoupon (){
		try {
			
			String sql = "delete from coupon where coupon_idx= ("
					+ "select coupon_idx from coupon where months_between "
					+ " (to_date(coupon.coupon_end, 'yyyy-mm-dd'), sysdate)<0)";
		
			ps=conn.prepareStatement(sql);
			int res = ps.executeUpdate();
			System.out.println(res);
			
			return res;
			
			
		} catch (Exception e) {
			
			e.printStackTrace( );
			return 0 ; 
			// TODO: handle exception
		}finally {
			try {
				
				if (ps!=null)ps.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	public ArrayList<CouponDTO> myCouponList (String sid, String food_type ){
		
		
		try {
			System.out.println(sid);
			
			conn = semi.db.SemiDb.getConn();
			
			int res = deletePastCoupon();
			
			
			
			String sql ="select * from (select * from ( "
					+ "select is_used, mem_idx, coupon_start, user_coupon.coupon_idx, user_coupon_idx, "
					+ "coupon_name, coupon_food_type, coupon_value, coupon_end, coupon_type "
					+ "from user_coupon, customer, coupon "
					+ "where my_idx = mem_idx and user_coupon.coupon_idx = coupon.coupon_idx ) "
					+ "where mem_idx = (select my_idx from customer where id = ? ) ) where coupon_food_type = ? ";
			
					
					
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			ps.setString(2, food_type);
			rs=ps.executeQuery();
			
			ArrayList<CouponDTO> dtos = new ArrayList<CouponDTO>();
			while (rs.next()){
				int coupon_idx = rs.getInt("user_coupon_idx");
				String coupon_name = rs.getString("coupon_name");
				String coupon_food_type= rs.getString("coupon_food_type");
				int coupon_value = rs.getInt("coupon_value");
				Date coupon_start = rs.getDate("coupon_start");
				String coupon_end = rs.getString("coupon_end");
				int coupon_type = rs.getInt("coupon_type");
				int is_used = rs.getInt("is_used");
				
				
				CouponDTO dto = new CouponDTO(coupon_idx, coupon_name, coupon_food_type, coupon_value, coupon_start, coupon_end, coupon_type, is_used);
				dtos.add(dto);
				
				
			}
			return dtos ; 
			
			
			
		} catch (Exception e) {
			e.printStackTrace( );
			return null;
			
			// TODO: handle exception
		}
		
		finally {
			try {
			

				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
public ArrayList<CouponDTO> myCouponList (String sid){
		
		
		try {
			System.out.println(sid);
			
			conn = semi.db.SemiDb.getConn();
			
			int res = deletePastCoupon();
			
			
			
			String sql ="select * from ( "
					+ "select is_used, mem_idx, coupon_start, user_coupon.coupon_idx, user_coupon_idx, "
					+ "coupon_name, coupon_food_type, coupon_value, coupon_end, coupon_type "
					+ "from user_coupon, customer, coupon "
					+ "where my_idx = mem_idx and user_coupon.coupon_idx = coupon.coupon_idx ) "
					+ "where mem_idx = (select my_idx from customer where id = ? ) ";
			
					
					
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			//ps.setString(2, food_type);
			rs=ps.executeQuery();
			
			ArrayList<CouponDTO> dtos = new ArrayList<CouponDTO>();
			while (rs.next()){
				int coupon_idx = rs.getInt("user_coupon_idx");
				String coupon_name = rs.getString("coupon_name");
				String coupon_food_type= rs.getString("coupon_food_type");
				int coupon_value = rs.getInt("coupon_value");
				Date coupon_start = rs.getDate("coupon_start");
				String coupon_end = rs.getString("coupon_end");
				int coupon_type = rs.getInt("coupon_type");
				int is_used = rs.getInt("is_used");
				
				
				CouponDTO dto = new CouponDTO(coupon_idx, coupon_name, coupon_food_type, coupon_value, coupon_start, coupon_end, coupon_type, is_used);
				dtos.add(dto);
				
				
			}
			return dtos ; 
			
			
			
		} catch (Exception e) {
			e.printStackTrace( );
			return null;
			
			// TODO: handle exception
		}
		
		finally {
			try {
			

				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	
	public int receiveCoupon (String user_id, int coupon_idx ){
		
		try {
			conn = semi.db.SemiDb.getConn();
		
		
				String sql = "insert into user_coupon values ( user_coupon_idx_sq.nextval, "
						+ "(select my_idx from customer "
						+ "where id ='"+user_id+"'), ?, 0) ";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, coupon_idx);
				
				int res = ps.executeUpdate();
				
				return res; 
			

			
			
		} catch (Exception e) {
			e.printStackTrace( );
			return -1; 
			// TODO: handle exception
		}
		finally {
			try {
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
				
			} catch (Exception e2) {
				
				// TODO: handle exception
			}
		}
	}
	
	public ArrayList<CouponDTO> couponList (){
		
		
		try {
			
			
			conn = semi.db.SemiDb.getConn();
			

			int res = deletePastCoupon();
			String sql ="select * from coupon order by coupon_idx";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<CouponDTO> dtos = new ArrayList<CouponDTO>();
			while (rs.next()){
				int coupon_idx = rs.getInt("coupon_idx");
				String coupon_name = rs.getString("coupon_name");
				String coupon_food_type= rs.getString("coupon_food_type");
				int coupon_value = rs.getInt("coupon_value");
				Date coupon_start = rs.getDate("coupon_start");
				String coupon_end = rs.getString("coupon_end");
				int coupon_type = rs.getInt("coupon_type");
				
				CouponDTO dto = new CouponDTO(coupon_idx, coupon_name, coupon_food_type, coupon_value, coupon_start, coupon_end, coupon_type);
				dtos.add(dto);
				
				
			}
			return dtos ; 
			
			
			
		} catch (Exception e) {
			e.printStackTrace( );
			return null;
			
			// TODO: handle exception
		}
		
		finally {
			try {
			

				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	
	
	
	
	/**
	 * 
	 * 
	 * @return
	 */
	public int couponWrite (CouponDTO dto){
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "insert into coupon values (coupon_sq.nextval,?,?,?,sysdate , ?,? )";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getCoupon_name());
			ps.setString(2, dto.getCoupon_food_type());
			ps.setInt(3, dto.getCoupon_value());
			ps.setString(4, dto.getCoupon_end());
			ps.setInt(5, dto.getCoupon_type());
			
			
			int res = ps.executeUpdate();
			
			return res; 
		
		} catch (Exception e) {
			e.printStackTrace( );
			return -1; 
			// TODO: handle exception
		}finally {
			try {
				if (ps!=null)ps.close();
				if ( conn!=null)conn.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	

}
