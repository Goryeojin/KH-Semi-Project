package com.readme.clientService.model.vo;

import java.sql.Date;

public class Request {
	/*
	REQUEST_NO	NUMBER
	REQUEST_WRITER	NUMBER
	REQUEST_TITLE	VARCHAR2(100 BYTE)
	REQUEST_CONTENT	VARCHAR2(4000 BYTE)
	REQUEST_DATE	DATE
	STATUS	VARCHAR2(1 BYTE)
	*/
	
	private int requestNo;
	private int userNo;
	private String requestWriter;
	private String requestTitle;
	private String requestContent;
	private Date requestDate;
	private String status;
	public Request() {
		super();
	}
	public Request(int requestNo, int userNo, String requestWriter, String requestTitle, String requestContent,
			Date requestDate, String status) {
		super();
		this.requestNo = requestNo;
		this.userNo = userNo;
		this.requestWriter = requestWriter;
		this.requestTitle = requestTitle;
		this.requestContent = requestContent;
		this.requestDate = requestDate;
		this.status = status;
	}
	public int getRequestNo() {
		return requestNo;
	}
	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getRequestWriter() {
		return requestWriter;
	}
	public void setRequestWriter(String requestWriter) {
		this.requestWriter = requestWriter;
	}
	public String getRequestTitle() {
		return requestTitle;
	}
	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}
	public String getRequestContent() {
		return requestContent;
	}
	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Request [requestNo=" + requestNo + ", userNo=" + userNo + ", requestWriter=" + requestWriter
				+ ", requestTitle=" + requestTitle + ", requestContent=" + requestContent + ", requestDate="
				+ requestDate + ", status=" + status + "]";
	}
	
	
}
