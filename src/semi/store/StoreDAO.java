package semi.store;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import semi.food.FoodDTO;
import semi.order.OrderDTO;
import semi.store.StoreDTO;


public class StoreDAO {
   
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;   
   public StoreDAO() {}

   /**여러 가게의 정보 select*/
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
            String store_addr2 = rs.getString("store_addr2");
            String store_phone = rs.getString("store_phone");
            String open_time = rs.getString("open_time");
            String close_time = rs.getString("close_time");
            int lowest_price = rs.getInt("lowest_price");
            int review_num = rs.getInt("review_num");
            int sale_num = rs.getInt("sale_num");
            int score_num = rs.getInt("score_num");
            String store_image = rs.getString("store_image");
            
            StoreDTO dto = new StoreDTO(store_idx, type, store_name, store_addr, store_addr2, 
                  store_phone, open_time, close_time, lowest_price, review_num, sale_num, score_num, store_image);
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
   

   
   /*예랑 추가*/
   
   public boolean isOpen (int sIdx ){
	   try {
		   conn = semi.db.SemiDb.getConn();
		   String sql ="select open_time, close_time from store where store_idx = ? ";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, sIdx);
		   rs=ps.executeQuery();
		   
		   String open_s= "";
		   String close_s = "";
		   
		   
		   while (rs.next()){
			   open_s = rs.getString(1);
			   close_s= rs.getString(2);
			   
		   }
		   
		 //  open_s = open_s.substring(11,13);
		  // close_s = close_s .substring(11, 13);
		   
		   int open = 0; 
		   int close = 0; 
		   
		   if (open_s.substring(0, 2).equals("am")){
			   open = Integer.parseInt(open_s.substring(2));
			   
		   }
		   else if (  open_s.substring(0, 2).equals("pm")){
			   open = Integer.parseInt(open_s.substring(2))+ 1200;
			 }
		   
		   
		   if (close_s.substring(0, 2).equals("am")){
			   close = Integer.parseInt(open_s.substring(2))+ 2400;
			   
		   }
		   else if (  close_s.substring(0, 2).equals("pm")){
			   close = Integer.parseInt(open_s.substring(2))+ 1200;
		   }
		   
		   
		 
		   
		   
		   
		   
		   Calendar now = Calendar.getInstance();
		   int h =now.get(Calendar.HOUR_OF_DAY);
		   int min = now.get(Calendar.MINUTE);
		   
		   int hour = h * 100 + min ; 
		//   System.out.println(sIdx+" hour: "+hour);
	//	   
	// 	   if (close < 6 ) close += 24; 
		//   System.out.println(sIdx+" open"+open);
		//   System.out.println(sIdx+" close"+close);
		   if (hour >= open && hour < close){
			   return true; 
			   
		   }
		   else return false; 
		   
		   
	} catch (Exception e) {
		e.printStackTrace( );
		return false;
		
		// TODO: handle exception
	}finally {
		try {
			   if(rs!=null) rs.close();
               if(ps!=null) ps.close();
               if(conn!=null) conn.close();   
            
		} catch (Exception e2) {
			// TODO: handle exception
		}
	}
   }
   
   public int storeJoin(StoreDTO dto) {
		try {
			conn = semi.db.SemiDb.getConn();
			String sql = "insert into store values(?, ?, ?, ?, ?, ?, ?, ?, 0, 0, 0, 0, 'http://localhost:9090/semi/img/store/sad.png', 0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getStore_idx());
			ps.setString(2, dto.getStore_type());
			ps.setString(3, dto.getStore_name());
			ps.setString(4, dto.getStore_addr());
			ps.setString(5, dto.getStore_addr2());
			ps.setString(6, dto.getStore_phone());
			ps.setString(7, dto.getOpen_time());
			ps.setString(8, dto.getClose_time());
			
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