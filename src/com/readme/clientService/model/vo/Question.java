package com.readme.clientService.model.vo;

import java.sql.Date;

public class Question {
	/*
	Q_NO	NUMBER
	Q_WRITER	NUMBER
	Q_TITLE	VARCHAR2(100 BYTE)
	Q_CONTENT	VARCHAR2(4000 BYTE)
	Q_DATE	DATE
	STATUS	VARCHAR2(1 BYTE)
	Q_ANSWER	VARCHAR2(4000 BYTE)
	*/
	
	private int qNo;
	private int userNo;
	private String qWriter;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String status;
	private String qAnswer;
	public Question() {
		super();
	}
	public Question(int qNo, int userNo, String qWriter, String qTitle, String qContent, Date qDate, String status,
			String qAnswer) {
		super();
		this.qNo = qNo;
		this.userNo = userNo;
		this.qWriter = qWriter;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.status = status;
		this.qAnswer = qAnswer;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getqAnswer() {
		return qAnswer;
	}
	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}
	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", userNo=" + userNo + ", qWriter=" + qWriter + ", qTitle=" + qTitle
				+ ", qContent=" + qContent + ", qDate=" + qDate + ", status=" + status + ", qAnswer=" + qAnswer + "]";
	}
	
	

}
