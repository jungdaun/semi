package semi.voc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class VocDAO {

		static final int ERROR = -1; 
		static final int PWD_ERROR = -2; 
	   private Connection conn;
	   private PreparedStatement ps;
	   private ResultSet rs;
	   
	   
	   
	   public int getTotalCnt(String mySid ){
		      try{
		         conn = semi.db.SemiDb.getConn();
		         
		         String sql="select count(*) from voc_tb where ref in "
		         		+ "(select ref from  voc_tb where writer = ? ) ";
		         ps=conn.prepareStatement(sql);
		        ps.setString(1, mySid);
		         
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
		   
		   

	   public ArrayList<VocDTO> findMyVoc ( String sid, int currentPage,  int listSize ){
		   //ref  같은거로 따 오면 됌 
		   
		   try{
		         conn = semi.db.SemiDb.getConn();
		         
		         //String sql="select * from jsp_bbs order by idx desc";
		         String sql = "select * from "
		                 + "(select rownum rNum, a.* from " 
		                 + "(select * from voc_tb voc_tb where ref in (select ref from voc_tb where writer = ? ) "
		                 + "order by ref desc ,turn asc) a) b "
		                 + "where rNum >=("+currentPage+"-1) * "+listSize+" +1 and rNum<="+currentPage+"*"+listSize;
		           
		               
		         ps=conn.prepareStatement(sql);
		         ps.setString(1, sid);
		         rs=ps.executeQuery();
		         ArrayList<VocDTO> arr=new ArrayList<VocDTO>();
		         
		         int turn =0; 
		         
		         while(rs.next()){
		            int idx=rs.getInt("voc_idx");
		            String writer=rs.getString("writer");
		            String pwd=rs.getString("pwd");
		            String subject=rs.getString("title");
		            String content=rs.getString("content");
		            java.sql.Date writedate=rs.getDate("writedate");
		            int ref=rs.getInt("ref");
		            int lev=rs.getInt("lev");
		            
		            VocDTO dto = new VocDTO(idx,writer,pwd,subject,content,writedate,ref,lev,turn);
		            arr.add(dto);
		            turn ++; 
		         }
		         return arr;
		      }catch(Exception e){
		         e.printStackTrace();
		         return null;
		      }finally{
		         try{
		            if(ps!=null)ps.close();
		               if(conn!=null)conn.close();
		            
		         }catch(Exception e1){}
		      }
	   }
	   
	   
	   public int vocUpdate (VocDTO dto, String userPwd, int idx){
		      try {
		         
		         conn =semi.db.SemiDb.getConn();
		         
		   
		         
		         if (pwdCheck(idx, userPwd)){
		            String sql = "update voc_tb set title=? , content=? where voc_idx =?";
		            ps=conn.prepareStatement(sql);
		            ps.setString(1, dto.getTitle());
		            ps.setString(2, dto.getContent());
		            ps.setInt(3, idx);
		            
		            
		            int count = ps.executeUpdate();
		            return count; 
		         }
		         else {
		            return PWD_ERROR; 
		            
		         }
		         
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
		

	   
	   
	   public boolean isNull(int idx){
		      try {
		         String sql = "select lev from voc_tb where voc_idx like "+idx;
		         ps=conn.prepareStatement(sql);
		         rs= ps.executeQuery();
		         rs.next();
		         
		         int lev = rs.getInt(1);
		   
		         if (lev ==0){
		            return true;
		         }
		         else return false; 
		         
		         
		      } catch (Exception e) {
		         e.printStackTrace( );
		         return false;  
		         // TODO: handle exception
		      }finally {
		         try {
		            if(rs!=null)rs.close();
		            if(ps!=null)ps.close();
		            
		         } catch (Exception e2) {
		            // TODO: handle exception
		         }
		      }
		   }
		   
		   
		   public int vocDel(int idx, String userPwd) {
		      
		      
		      try {
		         conn = semi.db.SemiDb.getConn();
		         


		            
		            if (pwdCheck(idx, userPwd)){
		               String sql= "delete from voc_tb where voc_idx=?";
		               ps=conn.prepareStatement(sql);
		               ps.setInt(1, idx);

		               int count= ps.executeUpdate();
		               return count; 
		            }
		            
		            else {
		               return PWD_ERROR;
		               
		               
		               
		            }
		         
		         
		         
		       

		         
		         
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

		   
		   
		   
		   
		   
		   public String getUserPwd(int idx){
			   try {
				   
				   conn = semi.db.SemiDb.getConn();
				   String sql = "select pwd from voc_tb where voc_idx = ?";
			       
				   ps=conn.prepareStatement(sql);
			        
				   ps.setInt(1, idx);
			       
				   rs=ps.executeQuery();
			       
				   rs.next();
			       
				   String pwd= rs.getString("pwd");
			       
				  return pwd; 
			         
				
			} catch (Exception e) {
				e.printStackTrace( );
				return null;
				// TODO: handle exception
			}finally {
				try { 
					if (rs!=null) rs.close();
	        
					if(ps!=null)ps.close();
					if (conn!=null)conn.close();
					
				} catch (Exception e2) {
					// TODO: handle exception
					
				}
			}
		   }
		   
		   
	   public boolean pwdCheck (int idx, String userPwd){
		      try{
		         String sql = "select pwd from voc_tb where voc_idx=?";
		         ps=conn.prepareStatement(sql);
		         ps.setInt(1, idx);
		         rs=ps.executeQuery();
		         rs.next();
		         String pwd= rs.getString("pwd");
		         if (pwd.equals(userPwd)) return true;
		         else return false; 
		      }
		      catch (Exception e) {
		         // TODO: handle exception\
		         e.printStackTrace( );
		         return false; 
		      }   
		   
		      finally {
		         try {
		            if (rs!=null) rs.close();
		            if(ps!=null)ps.close();
		         } catch (Exception e2) {
		            // TODO: handle exception
		         }
		      }

		}
	   
	   
	   
	   
	   /**답변 글쓰기 관련 메서드*/
	   public int vocReWrite(VocDTO dto){
	      try{
	         conn=semi.db.SemiDb.getConn();
	         
	         sunbunUpdate(dto.getRef(),dto.getTurn()+1);
	         
	         String sql="insert into voc_tb values(voc_idx_sq.nextval,?,?,?,?,sysdate,?,?,?)";
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, dto.getWriter());
	         ps.setString(2, dto.getPwd());
	         ps.setString(3, dto.getTitle());
	         ps.setString(4, dto.getContent());
	         ps.setInt(5, dto.getRef());
	         ps.setInt(6, dto.getLev()+1);
	         ps.setInt(7, dto.getTurn()+1);
	         int count=ps.executeUpdate();
	         return count;
	      }catch(Exception e){
	         e.printStackTrace();
	         return ERROR;
	      }finally{
	         try{
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();
	         }catch(Exception e1){}
	      }
	   }
	   
	   
	   
	   public VocDTO vocContent(int idx, String userPwd ){
		      try{
		         conn = semi.db.SemiDb.getConn();
		         
		         
		         if ( !pwdCheck(idx, userPwd)){
		        	 VocDTO pwdError = new VocDTO(-1);
		        	 
		        	 
		        	 return pwdError;
		        	  
		        	 
		         }
		         else {
			         
			         String sql="select * from voc_tb where voc_idx=?";
			         ps=conn.prepareStatement(sql);
			         ps.setInt(1, idx);
			         rs=ps.executeQuery();
			         VocDTO dto=null;
			         if(rs.next()){
			            String writer=rs.getString("writer");
			            String pwd=rs.getString("pwd");
			            String subject=rs.getString("title");
			            String content=rs.getString("content");
			            java.sql.Date writedate=rs.getDate("writedate");
			          
			            int ref=rs.getInt("ref");
			            int lev=rs.getInt("lev");
			            int sunbun=rs.getInt("turn");
			            dto = new VocDTO(idx,writer,pwd,subject,content,writedate,ref,lev,sunbun);
			         }
			         return dto;
		         }
		         
		         

		      }catch(Exception e){
		         e.printStackTrace();
		         return null;
		      }finally{
		         try{
		            if(rs!=null)rs.close();
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();
		         }catch(Exception e1){}
		      }
		   }
	   
	   public VocDTO vocContent(int idx ){
		   try{
			   conn = semi.db.SemiDb.getConn();
			   
			   
	
				   
				   String sql="select * from voc_tb where voc_idx=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, idx);
				   rs=ps.executeQuery();
				   VocDTO dto=null;
				   if(rs.next()){
					   String writer=rs.getString("writer");
					   String pwd=rs.getString("pwd");
					   String subject=rs.getString("title");
					   String content=rs.getString("content");
					   java.sql.Date writedate=rs.getDate("writedate");
					   
					   int ref=rs.getInt("ref");
					   int lev=rs.getInt("lev");
					   int sunbun=rs.getInt("turn");
					   dto = new VocDTO(idx,writer,pwd,subject,content,writedate,ref,lev,sunbun);
				   }
				   return dto;
			   
			   
			   
			   
		   }catch(Exception e){
			   e.printStackTrace();
			   return null;
		   }finally{
			   try{
				   if(rs!=null)rs.close();
				   if(ps!=null)ps.close();
				   if(conn!=null)conn.close();
			   }catch(Exception e1){}
		   }
	   }
	   
	   
	   
	   /**ref 최대값 구하기 관련 메서드*/
	   public int getRefMax(){
	      try{
	         String sql="select max(ref) from voc_tb";
	         ps=conn.prepareStatement(sql);
	         rs=ps.executeQuery();
	         int count=0;
	         if(rs.next()){
	            count=rs.getInt(1);
	            
	         }
	         return count;
	      }catch(Exception e){
	         e.printStackTrace();
	         return 0;
	      }finally{
	         try{
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            
	         }catch(Exception e1){}
	      }
	   }
	   
	   
	   /**목록관련 메서드*/
	   public ArrayList<VocDTO> vocList(int currentPage,int listSize){

	      try{
	         conn = semi.db.SemiDb.getConn();
	         
	         //String sql="select * from jsp_bbs order by idx desc";
	         String sql = "select * from "
	                 + "(select rownum rNum, a.* from " 
	                 + "(select * from voc_tb order by ref desc ,turn asc) a) b "
	                 + "where rNum >=("+currentPage+"-1) * "+listSize+" +1 and rNum<="+currentPage+"*"+listSize;
	           
	               
	         ps=conn.prepareStatement(sql);
	         rs=ps.executeQuery();
	         ArrayList<VocDTO> arr=new ArrayList<VocDTO>();
	         
	         int turn =0; 
	         
	         while(rs.next()){
	            int idx=rs.getInt("voc_idx");
	            String writer=rs.getString("writer");
	            String pwd=rs.getString("pwd");
	            String subject=rs.getString("title");
	            String content=rs.getString("content");
	            java.sql.Date writedate=rs.getDate("writedate");
	            int ref=rs.getInt("ref");
	            int lev=rs.getInt("lev");
	            
	            VocDTO dto = new VocDTO(idx,writer,pwd,subject,content,writedate,ref,lev,turn);
	            arr.add(dto);
	            turn ++; 
	         }
	         return arr;
	      }catch(Exception e){
	         e.printStackTrace();
	         return null;
	      }finally{
	         try{
	            if(ps!=null)ps.close();
	               if(conn!=null)conn.close();
	            
	         }catch(Exception e1){}
	      }
	   }
	   
	   
	   
	   
	   /**sunbun update관련 메서드*/
	   public void sunbunUpdate(int ref,int sun){
	      try{
	         String sql="update voc_tb set turn=turn+1 where ref=? and turn>=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, ref);
	         ps.setInt(2, sun);
	         ps.executeUpdate();
	      }catch(Exception e){
	         e.printStackTrace();
	      }finally{
	         try{
	            if(ps!=null)ps.close();
	         }catch(Exception e1){
	        	 
	        	 
	         }
	      }
	   }
	   
	   
	   
	   /**총게시물 관련메서드*/
	   public int getTotalCnt(){
	      try{
	         conn = semi.db.SemiDb.getConn();
	         
	         String sql="select count(*) from voc_tb";
	        
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
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   ////////////////////////////////////////////////////////////////////
	   
	   public int vocWrite(VocDTO dto) {
		      try {
		         conn = semi.db.SemiDb.getConn();
		         
		         int ref=getRefMax();
		         String sql = "insert into voc_tb values(voc_idx_sq.nextval,?,?,?,?,sysdate,?,0,0)";
		         ps = conn.prepareStatement(sql);
		         ps.setString(1, dto.getWriter());
		         ps.setString(2, dto.getPwd());
		         ps.setString(3, dto.getTitle());
		         ps.setString(4, dto.getContent());
		         ps.setInt(5, ref+1);
//		         System.out.println("3");
		         int count = ps.executeUpdate();
//		         System.out.println("count = "+count);
		         return count;
		 
		      } catch (Exception e) {
		 
		         e.printStackTrace();
		         return ERROR;
		         
		      } finally {
		         try {
		 
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();
		         } catch (Exception e2) {
		 
		         }
		      }
		   }
	
	

}
