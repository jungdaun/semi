package semi.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs; 
	public ReviewDAO() {
		// TODO Auto-generated constructor stub
	}   
	
	public int postReview(Integer c_idx, String c_name, int store_idx, String up_date, int score_num, String review, String r_picture, String r_pwd){
		try{
			conn = semi.db.SemiDb.getConn();
			String sql="insert into review values(?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (c_idx !=null? c_idx.intValue() : 0));
			ps.setString(2, c_name);
			ps.setInt(3, store_idx);
			ps.setString(4, up_date);
			ps.setInt(5, score_num);
			ps.setString(6, review);
			ps.setString(7, r_picture);
			ps.setString(8, r_pwd);
			int count = ps.executeUpdate();
			
			return count;
		}
		catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}
			catch(Exception e2){}
		}
		
	}

}
