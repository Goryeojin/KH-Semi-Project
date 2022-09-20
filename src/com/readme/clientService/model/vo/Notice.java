package com.readme.clientService.model.vo;

import java.sql.Date;

public class Notice {
	/*
	NOTICE_NO	NUMBER
	NOTICE_WRITER	NUMBER
	NOTICE_TITLE	VARCHAR2(100 BYTE)
	NOTICE_CONTENT	VARCHAR2(4000 BYTE)
	NOTICE_DATE	DATE
	COUNT	NUMBER
	STATUS	VARCHAR2(1 BYTE)
	*/
	
	private int noticeNo;
	private int userNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int count;
	private String status;
	public Notice() {
		super();
	}
	public Notice(int noticeNo, int userNo, String noticeWriter, String noticeTitle, String noticeContent,
			Date noticeDate, int count, String status) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.count = count;
		this.status = status;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", userNo=" + userNo + ", noticeWriter=" + noticeWriter
				+ ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
				+ ", count=" + count + ", status=" + status + "]";
	}
	
	

}
