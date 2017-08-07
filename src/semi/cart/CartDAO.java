package semi.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import semi.cart.CartDTO;
import semi.food.FoodDTO;

public class CartDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int insertData(int s_idx, Integer c_idx, String name, int price, int count, int t_price){	
		
		try{
			conn = semi.db.SemiDb.getConn();
			String sql = "insert into cart values(?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			ps.setInt(2, (c_idx !=null? c_idx.intValue() : 0));
			ps.setString(3, name);
			ps.setInt(4, price);
			ps.setInt(5, count);
			ps.setInt(6, t_price);
			int cnt = ps.executeUpdate();
			return cnt;
		}
		catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}
			catch(Exception e2){}
		}
	}
	
	public ArrayList<CartDTO> showData(int store_idx, Integer c_idx){
		try{
			conn = semi.db.SemiDb.getConn();
			String sql="select * from cart where store_idx=? & customer_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, store_idx);
			ps.setInt(2, (c_idx !=null? c_idx.intValue() : 0));
			
			rs = ps.executeQuery();
			ArrayList<CartDTO> arr = new ArrayList<CartDTO>();
			
			while(rs.next()){
				String food_name = rs.getString("food_name");
				int food_price = rs.getInt("food_price");
				int food_count = rs.getInt("food_count");
				int total_price = rs.getInt("total_price");
				CartDTO dto = new CartDTO(food_name, food_price, food_count, total_price);
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

}
