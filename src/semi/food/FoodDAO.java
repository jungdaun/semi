package semi.food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import semi.food.FoodDTO;
import semi.member.MemberDTO;
import semi.store.StoreDTO;

public class FoodDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public FoodDAO() {
	}
	
		public ArrayList<FoodDTO> showStore(int store_idx){
			try{
				conn = semi.db.SemiDb.getConn();
				String sql = "select * from food where store_idx=? order by food_num";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, store_idx);
				rs = ps.executeQuery();
				ArrayList<FoodDTO> arr = 
						new ArrayList<FoodDTO>();
				
				while(rs.next()){
					int food_num = rs.getInt("food_num");
					String food_name = rs.getString("food_name");
					String food_type = rs.getString("food_type");
					int food_price = rs.getInt("food_price");
					String food_info = rs.getString("food_info");
					String food_image = rs.getString("food_image");
					
					FoodDTO dto = new FoodDTO(store_idx, food_num, food_name, food_type, food_price, food_info, food_image);
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
		
		public ArrayList<FoodDTO> showStore1(int store_idx){
			try{
				conn = semi.db.SemiDb.getConn();
				String sql = "select * from food where store_idx=? and food_type = 'main' order by food_num";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, store_idx);
				rs = ps.executeQuery();
				ArrayList<FoodDTO> arr = 
						new ArrayList<FoodDTO>();
				
				while(rs.next()){
					int food_num = rs.getInt("food_num");
					String food_name = rs.getString("food_name");
					String food_type = rs.getString("food_type");
					int food_price = rs.getInt("food_price");
					String food_info = rs.getString("food_info");
					String food_image = rs.getString("food_image");
					
					FoodDTO dto = new FoodDTO(store_idx, food_num, food_name, food_type, food_price, food_info, food_image);
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
		
		public ArrayList<FoodDTO> showStore2(int store_idx){
			try{
				conn = semi.db.SemiDb.getConn();
				String sql = "select * from food where store_idx=? and food_type = 'side' order by food_num";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, store_idx);
				rs = ps.executeQuery();
				ArrayList<FoodDTO> arr = 
						new ArrayList<FoodDTO>();
				
				while(rs.next()){
					int food_num = rs.getInt("food_num");
					String food_name = rs.getString("food_name");
					String food_type = rs.getString("food_type");
					int food_price = rs.getInt("food_price");
					String food_info = rs.getString("food_info");
					String food_image = rs.getString("food_image");
					
					FoodDTO dto = new FoodDTO(store_idx, food_num, food_name, food_type, food_price, food_info, food_image);
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
		
		public FoodDTO foodUpdate(FoodDTO dto, int idx, int foodnum) {
			try {
				conn=semi.db.SemiDb.getConn();
				String sql = null;
				
					sql = "select * from food where store_idx = ? and food_num = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, idx);
					ps.setInt(2, foodnum);
					rs = ps.executeQuery();

					if (rs.next()) {
						int food_num = rs.getInt("food_num");
						String food_name = rs.getString("food_name");
						String food_type = rs.getString("food_type");
						int food_price = rs.getInt("food_price");
						String food_info = rs.getString("food_info");
						String food_image = rs.getString("food_image");
						
						dto = new FoodDTO(idx, food_num, food_name, food_type, food_price, food_info, food_image);
						
					}
				
				
				
				return dto;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			} finally { // 에러 발생 시, 아닐 시 상관 없이 파이널리 안에 있는 것 실행
				try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) conn.close();
				} catch (Exception e2) {

				}
			} // 자원반환시 위의 형식 필수
		}
		
		
		
	public int foodJoin(int idx, String name, String type, int price, int num) {
			try {
				conn = semi.db.SemiDb.getConn();
				String sql = "insert into food values(?, ?, ?, ?, ?, 'taste good!', '')";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, idx);
				ps.setInt(2, num+1);
				ps.setString(3, name);
				ps.setString(4, type);
				ps.setInt(5, price);
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
	
	public int maxfoodnum(int store_idx){
		try{
			conn = semi.db.SemiDb.getConn();
			String sql = "select max(food_num) from (select food_num from food where store_idx = ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, store_idx);
			rs = ps.executeQuery();
			FoodDTO dto = null;
			int max = 0;
			
			if(rs.next()) {
				max = rs.getInt("max(food_num)");
			}
			return max;
		}
		catch(Exception e){
			e.printStackTrace();
			return 0;
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
	
	public int foodupdate(FoodDTO dto) {
		try {
			conn=semi.db.SemiDb.getConn();
			String sql = "update food set food_name = ?, food_type = ?, food_price = ?  where store_idx = ? and food_num = ?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getFood_name());
			ps.setString(2, dto.getFood_type());
			ps.setInt(3, dto.getFood_price());
			ps.setInt(4, dto.getStore_idx());
			ps.setInt(5, dto.getFood_num());
			

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally { // 에러 발생 시, 아닐 시 상관 없이 파이널리 안에 있는 것 실행
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {

			}
		} // 자원반환시 위의 형식 필수
	}
	
	

}
