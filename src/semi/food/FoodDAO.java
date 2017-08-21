package semi.food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import semi.food.FoodDTO;
import semi.member.MemberDTO;

public class FoodDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public FoodDAO() { }
	
		public ArrayList<FoodDTO> showStore(int store_idx){
			try{
				conn = semi.db.SemiDb.getConn();
				String sql = "select * from food where store_idx=?";
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
				System.out.print("dd");
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
		
	public int foodJoin(FoodDTO dto) {
			try {
				conn = semi.db.SemiDb.getConn();
				String sql = "insert into food values(21, 1, 'fried', 'main', 17000, 'taste good!', '')";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, dto.getStore_idx());
				ps.setInt(2, dto.getFood_num());
				ps.setString(3, dto.getFood_name());
				ps.setString(4, dto.getFood_type());
				ps.setInt(5, dto.getFood_price());
				ps.setString(6, dto.getFood_info());
				ps.setString(7, "");
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

}
