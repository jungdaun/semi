package semi.voc;

import java.sql.Date;

public class VocDTO {
	private int vod_idx ; 
	private String writer ;
	private String title ;
	private String content ;
	private Date writedate ;
	private int ref ; 
	private int lev  ; 
	private int turn  ;
	
	
	public VocDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getVod_idx() {
		return vod_idx;
	}
	public void setVod_idx(int vod_idx) {
		this.vod_idx = vod_idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public VocDTO(int vod_idx, String writer, String title, String content, Date writedate, int ref, int lev,
			int turn) {
		super();
		this.vod_idx = vod_idx;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.ref = ref;
		this.lev = lev;
		this.turn = turn;
	}	
	
}

/* create table voc_tb (
voc_idx number primary key , 
writer varchar2(10),
title varchar2(100),
content varchar2(4000),
writedate date,
ref number, 
lev number , 
turn number
)


create sequence voc_idx_sq
start with 1 
*/