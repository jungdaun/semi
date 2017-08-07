


package semi.notice;

import java.sql.Date;

public class NoticeDTO {

	
	private int notice_idx;
	private String notice_writer ; 
	private String notice_title ; 
	private String notice_content;
	private Date notice_date ;
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
public NoticeDTO() {
	// TODO Auto-generated constructor stub
}
public NoticeDTO(int notice_idx, String notice_writer, String notice_title, String notice_content, Date notice_date) {
	super();
	this.notice_idx = notice_idx;
	this.notice_writer = notice_writer;
	this.notice_title = notice_title;
	this.notice_content = notice_content;
	this.notice_date = notice_date;
}



	
	
}


