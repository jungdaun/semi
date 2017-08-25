package semi.notice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;










public class NoticeDAO {
	
	

	public static final int ERROR= -1; 
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	

	


	
	   public int getTotalCnt(int searchKey, String searchVal){
		      try{
		    	  
		         conn = semi.db.SemiDb.getConn();
		         
		         String sql="select count(*) from notice";
		        
		         
		         switch (searchKey) {
				case 1:
					sql ="select count (*) from notice where notice_idx = "+searchVal ; 
					break;
				case 2: 
					sql = "select count (*) from notice where notice_writer like '%"+searchVal+"%'" ;
					break;
					
				case 3: 
					sql = "select count (*) from notice where notice_title like '%"+searchVal+"%'" ;
					break;
				case 4: 
					sql = "select count (*) from notice where notice_title like '%"+searchVal+"%' "
						+ "or notice_content like '%"+searchVal+"%'";
					
					
					break;
					
				default:
					
					break;
				}
		         
		         ps=conn.prepareStatement(sql);
		         rs=ps.executeQuery(); 
		         rs.next();
		         int count=rs.getInt(1);
		         count=(count==0)?1:count;//count값이 0일때 1 아니면 count
		         return count;
		      }catch(Exception e){
		         e.printStackTrace();
		         return 1;
		      }finally{
		         try{
		            if(rs!=null)rs.close();
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();
		         }catch(Exception e1){
		         }
		         
		      }
		   }
		   

		
	   public int getTotalCnt(){
		      try{
		         conn = semi.db.SemiDb.getConn();
		         

		         
		         String sql="select count(*) from notice";
		        
		         ps=conn.prepareStatement(sql);
		         rs=ps.executeQuery(); 
		         rs.next();
		         int count=rs.getInt(1);
		         count=(count==0)?1:count;//count값이 0일때 1 아니면 count
		         return count;
		      }catch(Exception e){
		         e.printStackTrace();
		         return 1;
		      }finally{
		         try{
		            if(rs!=null)rs.close();
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();
		         }catch(Exception e1){
		         }
		         
		      }
		   }
		   

	
	public int noticeUpdate (String title, String content, int idx){
		try {
			
			conn = semi.db.SemiDb.getConn();
			
	
				String sql = "update notice set notice_title=? , notice_content=? where notice_idx =?";
				
				ps=conn.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, content);
				ps.setInt(3, idx);
				
				
				int count = ps.executeUpdate();
				return count; 

			
		} catch (Exception e) {
			e.printStackTrace( );
			return ERROR;
			
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
	
	
	
	
	
	public int noticeDel(int idx) {
		
		
		try {
			conn = semi.db.SemiDb.getConn();
			

			
				
				
			String sql= "delete from notice where notice_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			int count= ps.executeUpdate();
			return count; 
			
				
	
			
		
			
			
		} catch (Exception e) {
			e.printStackTrace( );
			return ERROR; 
			// TODO: handle exception
		}
		finally {
			try {
				if (ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	
	
	
	
	
	
	
	public NoticeDTO noticeContent (int userIdx){
		try {
			
			conn= semi.db.SemiDb.getConn();
			
			
			
			String sql = "select * from notice where notice_idx =?";
			ps= conn.prepareStatement(sql);
			ps.setInt(1, userIdx);
			
			rs=ps.executeQuery();
			
	
			//�˻��� �ȵ� ��� 
			
			NoticeDTO dto = null; 
			
			if (rs.next()){
				
				String notice_writer =rs.getString("notice_writer");
  
				String notice_title= rs.getString("notice_title");  
				String notice_content =rs.getString("notice_content");  
				Date notice_date =rs.getDate("notice_date");
				
				dto=new NoticeDTO(userIdx, notice_writer, notice_title, notice_content, notice_date);
				
			}
			
			
			
			
			return dto; 
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null; 
			
		}finally {
			try {
				if (rs!= null) rs.close();
				if (ps!=null) ps.close();
				if (conn!= null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	
	
	public ArrayList<NoticeDTO> noticeSearchedList (int currentPage , int listSize, String searchVal, int searchKey){		
		try {
			conn= semi.db.SemiDb.getConn();
			
//			String sql = "select * from notice order by notice_idx desc";
		
			String sql="";
			
			
			switch (searchKey) {
			case 1:
				sql =  "select * from "
						+ "(select rownum rNum, a.* from " 
						+ "(select * from notice "
						+ "where notice_idx like "+searchVal
						+ "order by notice_idx desc) a) b "
						+ "where rNum >=("+currentPage+"-1) * "+listSize+" +1 and rNum<="+currentPage+"*"+listSize
						  ;
				
				break;
			case 2:
				sql =  "select * from "
						+ "(select rownum rNum, a.* from " 
						+ "(select * from notice "
						+ "where notice_writer like '%"+searchVal+"%' "
						+ " order by notice_idx desc) a) b "
						+ "where rNum >=("+currentPage+"-1) * "+listSize+" +1 and rNum<="+currentPage+"*"+listSize;
			//	System.out.println(sql);
				break;
			case 3:
				sql =  "select * from "
						+ "(select rownum rNum, a.* from " 
						+ "(select * from notice "
						+ "where notice_title like '%"+ searchVal+"%' " 
						+ "order by notice_idx desc) a) b "
						+ "where rNum >=("+currentPage+"-1) * "+listSize+" +1 and rNum<="+currentPage+"*"+listSize
						 ;
				break;
			case 4:
				sql =  "select * from "
						+ "(select rownum rNum, a.* from " 
						+ "(select * from notice "
						+ "where notice_title like '%"+searchVal+"%' or notice_content like '%"+searchVal+"%' "
						+ "order by notice_idx desc) a) b "
						+ "where rNum >=("+currentPage+"-1) * "+listSize+" +1 and rNum<="+currentPage+"*"+listSize
						;
				break;

			default:
				break;
			}

			
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();

			ArrayList<NoticeDTO> res = new ArrayList<NoticeDTO>();
			//Arraylist -> 
			
//			int turn =0; 
			
			while (rs.next()){
				
				int notice_idx= rs.getInt("notice_idx");
				String notice_writer =rs.getString("notice_writer"); 
				String notice_title= rs.getString("notice_title");  
				String notice_content =rs.getString("notice_content");  
				Date notice_date =rs.getDate("notice_date"); 
				
				
				NoticeDTO dto = new NoticeDTO(notice_idx, notice_writer, notice_title, notice_content, notice_date);
				res.add(dto);
				
			}
			return res; 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
			// TODO: handle exception
		}finally {
			try {
				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
				
			} catch (Exception e2) {	
				// TODO: handle exception
				e2.printStackTrace( );
			}
		}
		
	}

	
	
	
	
	public ArrayList<NoticeDTO> noticeList (int currentPage , int listSize){		
		try {
			conn= semi.db.SemiDb.getConn();
			
//			String sql = "select * from notice order by notice_idx desc";
		
			String sql = "select * from "
					+ "(select rownum rNum, a.* from " 
					+ "(select * from notice order by notice_idx desc) a) b "
					+ "where rNum >=("+currentPage+"-1) * "+listSize+" +1 and rNum<="+currentPage+"*"+listSize;
			
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();

			ArrayList<NoticeDTO> res = new ArrayList<NoticeDTO>();
			//Arraylist -> 
			
//			int turn =0; 
			
			while (rs.next()){
				
				int notice_idx= rs.getInt("notice_idx");
				String notice_writer =rs.getString("notice_writer"); 
				String notice_title= rs.getString("notice_title");  
				String notice_content =rs.getString("notice_content");  
				Date notice_date =rs.getDate("notice_date"); 
				
				
				NoticeDTO dto = new NoticeDTO(notice_idx, notice_writer, notice_title, notice_content, notice_date);
				res.add(dto);
				
			}
			return res; 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
			// TODO: handle exception
		}finally {
			try {
				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
				
			} catch (Exception e2) {	
				// TODO: handle exception
				e2.printStackTrace( );
			}
		}
		
	}

	
	

	
	public int noticeWrite(NoticeDTO dto) {
		
		try {		
			conn= semi.db.SemiDb.getConn();
			
				
			
			String sql= "insert into notice values (notice_idx_sq.nextval,?,?,?,sysdate)";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getNotice_writer());
			ps.setString(2, dto.getNotice_title());
			ps.setString(3, dto.getNotice_content());
			
			int count= ps.executeUpdate();
			
			return count; 
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace( );
			return ERROR;
			
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
	
	
}



























