package semi.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.omg.CORBA.COMM_FAILURE;

import com.sun.org.apache.regexp.internal.recompile;

import semi.cart.CartDTO;
import semi.food.FoodDTO;

public class CartDAO {
   
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   public CartDAO() {
      // TODO Auto-generated constructor stub
   }
   
   
      public ArrayList<CartDTO> myCartList(int order_idx){
            try{
               conn = semi.db.SemiDb.getConn();
               String sql="select food_name, food_price, food_count, total_price from cart where order_idx=?";
               ps = conn.prepareStatement(sql);
               ps.setInt(1, order_idx);
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
   
   public int insertData(int s_idx, Integer c_idx, String name, int price, int count, int t_price  ){   
      
      try{
         conn = semi.db.SemiDb.getConn();
         String sql = "insert into cart values(?, ?, ?, ?, ?, ?, 0,0)";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, s_idx);
         ps.setInt(2, (c_idx !=null? c_idx.intValue() : 0));
         ps.setString(3, name);
         ps.setInt(4, price);
         ps.setInt(5, count);
         ps.setInt(6, t_price);
//         ps.setInt(7, orderIdx);
//         ps.setInt(8,finish);
         
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
   
   public String getStoreName (int storeIdx){
   
         try{
            conn = semi.db.SemiDb.getConn();
            String sql="select store_name from store where store_idx =? ";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, storeIdx);
            
            rs = ps.executeQuery();
            rs.next();
            String res = rs.getString(1);
            return res; 
            
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
      
   
   public ArrayList<CartDTO> showData(int store_idx, Integer c_idx){
      try{
         conn = semi.db.SemiDb.getConn();
         String sql="select food_name, food_price,food_count,total_price from cart where store_idx=? and customer_idx=?";
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
   
   public int changeData(int store_idx, Integer c_idx, int count, int price, String name){
         try{
            conn = semi.db.SemiDb.getConn();
            String sql="update cart set food_count=?, total_price=? where store_idx=? and customer_idx=? and food_name=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, count);
            ps.setInt(2, (count*price));
            ps.setInt(3, store_idx);
            ps.setInt(4, (c_idx !=null? c_idx.intValue() : 0));
            ps.setString(5, name);
            int cnt = ps.executeUpdate();
            
            return cnt;
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
   
   public void deleteData(String str){
      try{
         conn = semi.db.SemiDb.getConn();
         String sql = "delete from cart where food_name=?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, str);
         int count = ps.executeUpdate();
      }
      catch(Exception e){
         e.printStackTrace();
      }
      finally{
         try{
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         }
         catch(Exception e2){}
      }
      
   }
   
//   
//   public int addOrderIdx (CartDTO dto, int oIdx){
//	   System.out.println("addOrderIdx");
//		   try {
//			    conn = semi.db.SemiDb.getConn();
//		 
//			    String sql = "update cart set order_idx =? where customer_idx =? and store_idx = ?  and finish = 0";
//			    ps=conn.prepareStatement(sql);
//			    ps.setInt(1, oIdx);
//			   
//			    ps.setInt(2, dto.getCustomer_idx());
//			    
//			    ps.setInt(3, dto.getStore_idx());
//			    
//			    int res = ps.executeUpdate();
//			    return res; 
//			
//		} catch (Exception e) {
//			e.printStackTrace( );
//			return -1; 
//			// TODO: handle exception
//		}finally {
//			try {
//				
//
//	            if(ps!=null) ps.close();
//	            if(conn!=null) conn.close();
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//		}
//	   
//   }
//   
//   
   
//   
//   
//   public ArrayList<CartDTO> showData(int store_idx, Integer c_idx, int finish ){
//	      try{
//	         conn = semi.db.SemiDb.getConn();
//	         String sql="select food_name, food_price,food_count,total_price from cart where store_idx=? and customer_idx=?";
//	         ps = conn.prepareStatement(sql);
//	         ps.setInt(1, store_idx);
//	         ps.setInt(2, (c_idx !=null? c_idx.intValue() : 0));
//	         
//	         rs = ps.executeQuery();
//	         ArrayList<CartDTO> arr = new ArrayList<CartDTO>();
//	         
//	         while(rs.next()){
//	            String food_name = rs.getString("food_name");
//	            int food_price = rs.getInt("food_price");
//	            int food_count = rs.getInt("food_count");
//	            int total_price = rs.getInt("total_price");
//	            CartDTO dto = new CartDTO(food_name, food_price, food_count, total_price);
//	            arr.add(dto);            
//	         }
//	         return arr;
//	      }
//	      catch(Exception e){
//	         e.printStackTrace();
//	         return null;
//	      }
//	      finally{
//	         try{
//	            if(rs!=null) rs.close();
//	            if(ps!=null) ps.close();
//	            if(conn!=null) conn.close();
//	         }
//	         catch(Exception e2){}
//	      }
//	      
//	   }
//	   
   
}