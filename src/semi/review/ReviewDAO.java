package semi.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs; 
	public ReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public void d_change(int store_idx, int score_num){
		try{
			String sql="update store set score_sum=score_sum-"+score_num+", review_num=review_num-1 where store_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, store_idx);
			int count = ps.executeUpdate();
			scoreNum(store_idx);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(ps!=null) ps.close();
			}
			catch(Exception e2){}
		}
	}
	
	public int deleteReview(int store_idx, int c_idx, int r_idx, int score_num){
		try{
			conn = semi.db.SemiDb.getConn();
			String sql="delete from review where c_idx=? and r_idx=? and store_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, c_idx);
			ps.setInt(2, r_idx);
			ps.setInt(3, store_idx);
			int count = ps.executeUpdate();
			d_change(store_idx, score_num);
			
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
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	
	public ArrayList<ReviewDTO> show(int store_idx){
		try{
			conn = semi.db.SemiDb.getConn();
			String sql="select * from review where store_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, store_idx);
			rs = ps.executeQuery();
			ArrayList<ReviewDTO> arr = new ArrayList<ReviewDTO>();
			while(rs.next()){
				int r_idx = rs.getInt("r_idx");
				int c_idx = rs.getInt("c_idx");
				String c_name = rs.getString("c_name");
				int score_num = rs.getInt("score_num");
				String review = rs.getString("review");
				String r_picture = rs.getString("r_picture");
				String up_date = rs.getString("up_date");
				ReviewDTO dto = new ReviewDTO(r_idx, c_idx, c_name, score_num, review, r_picture, up_date);
				arr.add(dto);
			}
			return arr;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}
			catch(Exception e2){}
		}
	}
	
	
	public int postReview(Integer c_idx, String c_name, int store_idx, String up_date, int score_num, String review, String r_picture, String r_pwd){
		try{
			conn = semi.db.SemiDb.getConn();
			String sql="insert into review values(r_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
		//	ps.setInt(1, ); //nextval로 바꿔야 한다.
			ps.setInt(1, (c_idx !=null? c_idx.intValue() : 0));
			ps.setString(2, c_name);
			ps.setInt(3, store_idx);
			ps.setString(4, up_date);
			ps.setInt(5, score_num);
			ps.setString(6, review);
			ps.setString(7, r_picture);
			ps.setString(8, r_pwd);
			int count = ps.executeUpdate();
			cntReviewNum(store_idx);
			sumScoreNum(store_idx, score_num);
			scoreNum(store_idx);
			System.out.println("5555");
			System.out.println("count = "+count);
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
	
	public void sumScoreNum(int store_idx, int score_num){
		try{
			System.out.println("3333");
			String sql = "update store set score_sum = score_sum + ? where store_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, score_num);
			ps.setInt(2, store_idx);
			int count = ps.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
			}
			catch(Exception e2){}
		}
		
	}
	
	public void scoreNum(int store_idx){
		try{
			System.out.println("444");
			String sql = "update store set score_num=score_sum/review_num where store_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, store_idx);
			int count = ps.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
			}
			catch(Exception e2){}
		}
	}
	
	public void cntReviewNum(int store_idx){
		try{
			System.out.println("2222");
			String sql = "update store set review_num=review_num+1 where store_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, store_idx);
			int count = ps.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
			}
			catch(Exception e2){}
		}
	}

}
