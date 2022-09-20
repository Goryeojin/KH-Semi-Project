package com.readme.admin.model.vo;

import java.sql.Date;

public class Request {
	private int requestNO;//	REQUEST_NO	NUMBER
	private int requestWriter;//	REQUEST_WRITER	NUMBER
	private String reTitle;//	REQUEST_TITLE	VARCHAR2(100 BYTE)
	private String reContent;//	REQUEST_CONTENT	VARCHAR2(4000 BYTE)
	private Date requestDate;//	REQUEST_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	private String userId;// JOIN해서 쓸 것
	
	public Request() {
		super();
	}

	public Request(int requestNO, int requestWriter, String reTitle, String reContent, Date requestDate,
			String status) {
		super();
		this.requestNO = requestNO;
		this.requestWriter = requestWriter;
		this.reTitle = reTitle;
		this.reContent = reContent;
		this.requestDate = requestDate;
		this.status = status;
	}
	
	
 //JOIN해준 userId 
	public Request(int requestNO, int requestWriter, String reTitle, String reContent, Date requestDate, String status,
			String userId) {
		super();
		this.requestNO = requestNO;
		this.requestWriter = requestWriter;
		this.reTitle = reTitle;
		this.reContent = reContent;
		this.requestDate = requestDate;
		this.status = status;
		this.userId = userId;
	}

	public int getRequestNO() {
		return requestNO;
	}

	public void setRequestNO(int requestNO) {
		this.requestNO = requestNO;
	}

	public int getRequestWriter() {
		return requestWriter;
	}

	public void setRequestWriter(int requestWriter) {
		this.requestWriter = requestWriter;
	}

	public String getReTitle() {
		return reTitle;
	}

	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
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
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	

	@Override
	public String toString() {
		return "Request [requestNO=" + requestNO + ", requestWriter=" + requestWriter + ", reTitle=" + reTitle
				+ ", reContent=" + reContent + ", requestDate=" + requestDate + ", status=" + status + "]";
	}
	
	

}