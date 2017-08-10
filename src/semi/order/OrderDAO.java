package semi.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDAO {
	
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	
	public int addOrder (OrderDTO dto){
		
		try {		
			conn= semi.db.SemiDb.getConn();
			
				
			
			String sql= "insert into order_tb values (?,?,?,?,(select coupon_type from coupon where coupon_idx = 1), "
					+ "(select coupon_value from coupon where coupon_idx = 1),?,to_char(sysdate),0,? )";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getOrder_idx());
			ps.setInt(2, dto.getStore_idx());
			ps.setInt(3, dto.getMem_idx());
			ps.setInt(4, dto.getPrice());
			ps.setString(5,dto.getMemo());
			ps.setInt(6, dto.getFinal_price());
			
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
