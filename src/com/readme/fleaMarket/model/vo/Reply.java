package com.readme.fleaMarket.model.vo;

import java.sql.Date;

public class Reply {
	/*
	REPLY_NO	NUMBER
	REFLY_FNO	NUMBER
	REPLY_WRITER	NUMBER
	REPLY_CONTENT	VARCHAR2(400 BYTE)
	REPLY_DATE	DATE
	STATUS	VARCHAR2(1 BYTE)
	*/
	private int replyNo;
	private int refFno;
	private int userNo;
	private String replyWriter;
	private String replyContent;//REPLY_CONTENT	VARCHAR2(400 BYTE)
	private Date replyDate;//CREATE_DATE	DATE
	private String status;//STATUS	VARCHAR2(1 BYTE)
	public Reply() {
		super();
	}

	public Reply(int replyNo, String replyWriter, String replyContent, Date replyDate) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}

	public Reply(int replyNo, int refFno, String replyWriter, String replyContent, Date replyDate, String status) {
		super();
		this.replyNo = replyNo;
		this.refFno = refFno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.status = status;
	}
	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getRefFno() {
		return refFno;
	}
	public void setRefFno(int refFno) {
		this.refFno = refFno;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", refFno=" + refFno + ", replyWriter=" + replyWriter + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + ", status=" + status + "]";
	}
	
}
