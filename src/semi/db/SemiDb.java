package semi.db;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;


public class SemiDb {
	
	static DataSource ds;
	
	//생성자, 즉 객체를 만들기 전!에 수행하고 싶다면.... static으로만 해서 내가 원하는 영역을 미리 수행할 수 있다.
	//static 선언한 부분은 class를 읽는 동시에 메모리에 올라간다.
	static{
		try{
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static Connection getConn()
	throws Exception{
		return ds.getConnection();
	}

}
