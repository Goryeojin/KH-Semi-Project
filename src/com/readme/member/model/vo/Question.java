package com.readme.member.model.vo;

import java.sql.Date;

public class Question {
	
	private int qNo;
	private String qWriter;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String qStatus;
	private String qAnswer;
	
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	






	public Question(int qNo, String qWriter, String qTitle, String qContent, Date qDate, String qStatus,
			String qAnswer) {
		super();
		this.qNo = qNo;
		this.qWriter = qWriter;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
		this.qAnswer = qAnswer;
	}



	



	public Question(int qNo, String qTitle, String qContent, Date qDate,String qAnswer, String qStatus) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
	    this.qAnswer = qAnswer;
		this.qStatus = qStatus;

	}









	public Question(int qNo, String qWriter, String qTitle, String qContent, Date qDate, String qStatus) {
		super();
		this.qNo = qNo;
		this.qWriter = qWriter;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
	}	
	

	
	
	public Question(int qNo, String qTitle, String qContent) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
	}



	public Question(int qNo, Date qDate, String qTitle, String qStatus) {
		super();
		this.qNo = qNo;
		this.qDate = qDate;
		this.qTitle = qTitle;
		this.qStatus = qStatus;
	}
	
	
	
	


	public Question(String qTitle, String qContent) {
		super();
		this.qTitle = qTitle;
		this.qContent = qContent;
	}
	
	
	
	
	public Question(int qNo, String qWriter, String qTitle, String qContent) {
		super();
		this.qNo = qNo;
		this.qWriter = qWriter;
		this.qTitle = qTitle;
		this.qContent = qContent;
	}
	
	
	
	



	public Question(int qNo, String qTitle, String qContent, Date qDate) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
	}



	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
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
	public String getqStatus() {
		return qStatus;
	}
	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public String getqAnswer() {
		return qAnswer;
	}



	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}














	

	
	
	
}
