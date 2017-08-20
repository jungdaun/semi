package semi.image;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ImageDAO {

	public static final String USERS_HOME = "C:/Users/JungDaun/git/semi/WebContent/img/upload";

	private String userid; // 계정정보
	private String crpath;// 현재위치
	private int totalSize, usedSize, freeSize;
	
	 private Connection conn;
	   private PreparedStatement ps;
	   private ResultSet rs;   

	public ImageDAO() {
		totalSize = 10 * 1024 * 1024; // 대~충 10메가
		freeSize = 0;
	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCrpath() {
		return crpath;
	}

	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getUsedSize() {
		return usedSize;
	}

	public void setUsedSize(int usedSize) {
		this.usedSize = usedSize;
	}

	public int getFreeSize() {
		return freeSize;
	}

	public void setFreeSize(int freeSize) {
		this.freeSize = freeSize;
	}

	/** 사용자 개인공간의 존재유무 */
	public void userFolderExixts() {
		File f = new File(USERS_HOME + "/" + userid);
		if (!f.exists()) {
			f.mkdir();
		}
		usedSize = 0;
		settingUsedSize(f);
		freeSize = totalSize - usedSize;
	}

	/** 실제 용량을 구하는 메서드 */
	public void settingUsedSize(File f) {

		File files[] = f.listFiles();

		for (int i = 0; i < files.length; i++) {
			if (files[i].isFile()) {
				usedSize += files[i].length();
			} else {
				settingUsedSize(files[i]); // 스택구조
			}
		}
	}
	
	public int setImage(String path, int idx) {
		try {
			conn = semi.db.SemiDb.getConn();
			
			String sql = "update store set store_image = ? where store_idx = ?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, path);
			ps.setInt(2, idx);

			int count = ps.executeUpdate();

			return count;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(rs!=null) rs.close();
	            if(ps!=null) ps.close();
	            if(conn!=null) conn.close();   
			} catch (Exception e2) {

			}
		}
	}
}
