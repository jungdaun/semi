package semi.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import com.sun.javafx.css.CalculatedValue;

import semi.cart.CartDTO;
import semi.voc.VocDTO;


public class OrderDAO {
	
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	
	public int makeOrderIdx (){
	
		   try {
			    conn = semi.db.SemiDb.getConn();
		 
			    String sql = "select max(order_idx) from order_tb "; 
			    

			    ps=conn.prepareStatement(sql);
			    rs= ps.executeQuery(); 
			 //   ps.setInt(1, oIdx);
	    
			    
			 if (   rs.next()) {
			return  rs.getInt(1);
			 	 
			 }
			    
			 else {
				 return 1; 
			 }
		} catch (Exception e) {
			e.printStackTrace( );
			return -1; 
			// TODO: handle exception
		}finally {
			try {
				
				if(rs!=null)rs.close();
	            if(ps!=null) ps.close();
	            if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	   
		
	}
	

	   public int addOrderIdx (int sIdx , int oIdx, int cIdx){
		//   System.out.println("addOrderIdx");
			   try {
				    conn = semi.db.SemiDb.getConn();
			 
				    String sql = "update cart set order_idx ="+oIdx+" where customer_idx ="+cIdx+" and store_idx ="+sIdx+" and finish = 0";
				    ps=conn.prepareStatement(sql);
				 //   ps.setInt(1, oIdx);
		    
				    int res = ps.executeUpdate();
				    return res; 
				
			} catch (Exception e) {
				e.printStackTrace( );
				return -1; 
				// TODO: handle exception
			}finally {
				try {
					

		            if(ps!=null) ps.close();
		            if(conn!=null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		   
	   }
	   
	
	
	 public int deleteCart (int oIdx){
	      try {
	         
	         conn =semi.db.SemiDb.getConn();
	         
	   
	         
	  
	            String sql = "update cart set finish = 1 where order_idx = ? ";
	            ps=conn.prepareStatement(sql);
	            ps.setInt(1, oIdx);
	            
	            
	            int count = ps.executeUpdate();
	            return count; 

	         
	      } catch (Exception e) {
	         e.printStackTrace( );
	         return -1;
	         
	         // TODO: handle exception
	      }finally {
	         try {
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	   }
	
	
			
			
	public ArrayList<OrderDTO> myOrderList (int mem_idx ){
		try {

			conn = semi.db.SemiDb.getConn();

			String sql = "select * from order_tb where mem_idx = ? order by order_idx";
			
		

			ps=conn.prepareStatement(sql);
			ps.setInt(1, mem_idx);
			
			rs=ps.executeQuery();
			
			
			 ArrayList<OrderDTO> dtos = new ArrayList<OrderDTO>();
			  
			while (rs.next()){
				
			
		
				
				int order_idx = rs.getInt("order_idx");
				int store_idx= rs.getInt("store_idx");
				
				int price = rs.getInt("price");
				int user_coupon = rs.getInt("user_coupon");
				String memo = rs.getString("memo");
				String order_date = rs.getString("order_date");
				int finish = rs.getInt("finish");
				int final_price = rs.getInt("final_price");
				int pay_type = rs.getInt("pay_type");
				 String c_name = rs.getString("c_name");
				 String c_addr= rs.getString("c_addr");
				 String c_tel= rs.getString("c_tel");
				
				 
				
				OrderDTO dto =new OrderDTO(order_idx, store_idx, mem_idx, price, memo, order_date, user_coupon, finish, final_price, pay_type, c_name, c_tel, c_addr);
				dtos.add(dto);
				
			}
	
			return dtos; 
			
		} catch (Exception e) {
			e.printStackTrace( );
			return null; 
			// TODO: handle exception
		}finally {
			try {
				if(rs!=null )rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public OrderDTO orderCheck(int oIdx) {
		try {
			conn = semi.db.SemiDb.getConn();

			String sql = "select * from order_tb where order_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, oIdx);
			
			rs=ps.executeQuery();
			
			
			 
			rs.next();
		
				
				int order_idx = rs.getInt("order_idx");
				int store_idx= rs.getInt("store_idx");
				int mem_idx= rs.getInt("mem_idx");
				int price = rs.getInt("price");
				int user_coupon = rs.getInt("user_coupon");
				String memo = rs.getString("memo");
				String order_date = rs.getString("order_date");
				int finish = rs.getInt("finish");
				int final_price = rs.getInt("final_price");
				int pay_type = rs.getInt("pay_type");
				 String c_name = rs.getString("c_name");
				 String c_addr= rs.getString("c_addr");
				 String c_tel= rs.getString("c_tel");
				
				 
				
				OrderDTO dto =new OrderDTO(order_idx, store_idx, mem_idx, price, memo, order_date, user_coupon, finish, final_price, pay_type, c_name, c_tel, c_addr);
	
	
			return dto; 
			
			

				 
		
				
			
		} catch (Exception e) {
			e.printStackTrace( );
			return null ; 
			// TODO: handle exception
		}finally {
			try {	if(rs!=null )rs.close();
			if (ps!=null)ps.close();
			if (conn!=null)conn.close();
		
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	
	public int useCoupon ( int user_coupon_idx ){
		
		try {
			conn = semi.db.SemiDb.getConn();
					
			
			String sql = "update user_coupon set is_used = 1 where user_coupon_idx =?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_coupon_idx);
			
			int res = ps.executeUpdate();
			
			return res; 
			
			
		} catch (Exception e) {
			e.printStackTrace( );
			return -1; 
			// TODO: handle exception
		}
		finally {
			try {
				if (ps!=null)ps.close();
				
			} catch (Exception e2) {
				
				
				// TODO: handle exception
			}
		}
	}
	
	
	
	
	public int addOrder (OrderDTO dto ){
		
		try {		
			conn= semi.db.SemiDb.getConn();
			
			
			int temp =useCoupon(dto.getUser_coupon());
			
				
			
			String sql= "insert into order_tb values (?,?,?,?,"
					+ "?,?,to_char(sysdate),0,?, ?,?,?,? )";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getOrder_idx());
			ps.setInt(2, dto.getStore_idx());
			ps.setInt(3, dto.getMem_idx());
			ps.setInt(4, dto.getPrice());
			
			ps.setInt(5,dto.getUser_coupon());
			ps.setString(6, dto.getMemo());
			
			ps.setInt(7, dto.getFinal_price());
			ps.setInt(8,dto.getPay_type());
			ps.setString(9, dto.getC_name());
			ps.setString(10, dto.getC_tel());
			ps.setString(11, dto.getC_addr());
			
			int count= ps.executeUpdate();
			
			return count; 
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace( );
			return -1;
			
		}
		
		finally {
			
			try {
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		
	}
	
//	public int orderDelivery (int o_idx ){
//		try {
//			conn= semi.db.SemiDb.getConn();
//			String sql ="update order_tb set finish ='1' where order_idx = ? ";
//			
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, o_idx);
//			int res = ps.executeUpdate();
//			
//			return res ; 
//			
//		} catch (Exception e) {
//			// TODO: hand
//			e.printStackTrace( );
//			return -1;
//			
//		}
//		
//		finally {
//			try {
//				if(ps!=null)ps.close();
//				if(conn!=null)conn.close();
//				
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//		}
//	}
//	
//	
//	
//	public ArrayList<OrderDTO> orderList (int store_idx) {
//		try {
//			conn= semi.db.SemiDb.getConn();
//			String sql ="select customer.name c_name, customer.address c_addr, "
//					+ "customer.tel c_tel, order_tb.order_idx o_idx, order_tb.menu, "
//					+ "order_tb.price, order_tb.memo, order_tb.orderdate order_date, "
//					+ "ceo.my_idx s_idx, order_tb.coupon, order_tb.coupon_type, order_tb.finish "
//					+ "from customer, order_tb ,ceo "
//					+ "where order_tb.mem_idx = customer.my_idx "
//					+ "and order_tb.store_idx = ceo.my_idx "
//					+ "and ceo.my_idx = ? ";
//			
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, store_idx);
//			
//			rs= ps.executeQuery();
//			
//			ArrayList<OrderDTO> dtos = new ArrayList<>();
//			 
//			while (rs.next()){
//				
//				
//				 String c_name = rs.getString("c_name");
//				 String c_addr= rs.getString("c_addr");
//				 String c_tel= rs.getString("c_tel");
//				 int o_idx= rs.getInt("o_idx");
//				 String menu=rs.getString("menu");
//				 int price= rs.getInt("price");
//				 String memo=rs.getString("memo");
//				 String order_date=rs.getString("order_date");
//				 int s_idx=rs.getInt("s_idx");
//				 int coupon =rs.getInt("coupon"); 
//				 int coupon_type=rs.getInt("coupon_type");
//				
//				 
//				
//				 String finish= rs.getString("finish");
//				 OrderDTO dto = new OrderDTO(c_name, c_addr, c_tel, o_idx, menu, price, memo, order_date, s_idx, coupon, coupon_type, finish);
//				 dtos.add(dto);
//				 System.out.println(order_date);
//				
//				
//			}
//			return dtos;
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace( );
//			return null;
//			// TODO: handle exception
//		}
//		finally {
//			try {
//				if(rs!=null)rs.close();
//				if(ps!=null)ps.close();
//				if(conn!=null)conn.close();
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//		}
//		
//	}

	
	
	
}
