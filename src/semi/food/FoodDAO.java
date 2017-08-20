package semi.food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import semi.food.FoodDTO;

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

}
