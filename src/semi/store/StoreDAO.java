package semi.store;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import semi.order.OrderDTO;
import semi.store.StoreDTO;


public class StoreDAO {
   
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;   
   public StoreDAO() {}


   //���� ������ ������ �˻�
   public ArrayList<StoreDTO> findStore(String type){
      
      try{
         conn = semi.db.SemiDb.getConn();
         String sql = "select * from store where store_type=?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, type);
         rs = ps.executeQuery();
         ArrayList<StoreDTO> arr = 
               new ArrayList<StoreDTO>();
         
         while(rs.next()){
            int store_idx = rs.getInt("store_idx");
            String store_name = rs.getString("store_name");
            String store_addr = rs.getString("store_addr");
            int review_num = rs.getInt("review_num");
            int sale_num = rs.getInt("sale_num");
            int score_num = rs.getInt("score_num");
            
            StoreDTO dto = new StoreDTO(store_idx, store_name, store_addr, 
                  review_num, sale_num, score_num);
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