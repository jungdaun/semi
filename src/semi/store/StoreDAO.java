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
            String open_time = rs.getString("open_time");
            String close_time = rs.getString("close_time");
            String store_image = rs.getString("store_image");
            
            StoreDTO dto = new StoreDTO(store_idx, store_name, store_addr, 
                  review_num, sale_num, score_num, open_time, close_time, store_image);
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
   
   /**사장님에게 가게가 있는지 존재 여부 판단하는 메소드*/
   public boolean check_store(String idx) {
      try{
            conn = semi.db.SemiDb.getConn();
            String sql = "select * from store where store_idx=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, idx);
            rs = ps.executeQuery();
            
            return rs.next();
         }
         catch(Exception e){
            e.printStackTrace();
            return false;
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
   
   public String get_myIdx(String id) {
      try{
            conn = semi.db.SemiDb.getConn();
            String sql = "select * from ceo where id=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            if(rs.next()) {
               return rs.getString("my_idx");
            }
            return null;
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
   

//   public ArrayList<StoreDTO> showReview(int idx){
//      try{
//         
//         conn = semi.db.SemiDb.getConn();
//         String sql="";
//         ps = conn.prepareStatement(sql);
//         rs = ps.executeQuery();
//         ArrayList<StoreDTO> arr = ArrayList<StoreDTO>();
//         
//         
//         while(rs.next()){
//            
//            
//            StoreDTO dto = new StoreDTO();
//            arr.add(dto);
//         }
//         return arr;
//      }
//      catch(Exception e){
//         e.printStackTrace();
//         return null;
//      }
//      finally{
//         try{
//            if(rs!=null)rs.close();
//            if(ps!=null) ps.close();
//            if(conn!=null) conn.close();
//         }
//         catch(Exception e2){}
//      }
//   }
}