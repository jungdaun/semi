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
	
	
	
	
	public ArrayList<CouponDTO> myCouponList (String sid){
		
		
		try {
			System.out.println(sid);
			
			conn = semi.db.SemiDb.getConn();
			String sql ="select * from coupon where coupon_idx in( "
					+ "select coupon_idx from user_coupon where mem_idx = ( "
					+ "select my_idx from customer where id = ?)) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
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
	
	
	
	public int receiveCoupon (String user_id, int coupon_idx ){
		
		try {
			conn = semi.db.SemiDb.getConn();
					
			
			String sql = "insert into user_coupon values ( "
					+ "(select my_idx from customer "
					+ "where id ='"+user_id+"'), ?) ";
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
			String sql = "insert into coupon values (coupon_sq.nextval,?,?,?,sysdate , ?,?, 0 )";
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
