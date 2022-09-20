package com.readme.member.model.vo;

import java.sql.Date;

public class Request {
  
	
   
   private int requestNo;
   private Date requestDate;
   private String requestWriter;
   private String requestTitle;
   private String requestContent;
   private String status;
   
   public Request() {
      super();
   }
   
public Request(int requestNo, Date requestDate, String requestWriter, String requestTitle, String requestContent,
		String status) {
	super();
	this.requestNo = requestNo;
	this.requestDate = requestDate;
	this.requestWriter = requestWriter;
	this.requestTitle = requestTitle;
	this.requestContent = requestContent;
	this.status = status;
}




public Request(int requestNo, Date requestDate, String requestTitle, String requestContent, String status) {
	super();
	this.requestNo = requestNo;
	this.requestDate = requestDate;
	this.requestTitle = requestTitle;
	this.requestContent = requestContent;
	this.status = status;
}

public int getRequestNo() {
	return requestNo;
}

public void setRequestNo(int requestNo) {
	this.requestNo = requestNo;
}

public Date getRequestDate() {
	return requestDate;
}

public void setRequestDate(Date requestDate) {
	this.requestDate = requestDate;
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

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

@Override
public String toString() {
	return "Request [requestNo=" + requestNo + ", requestDate=" + requestDate + ", requestWriter=" + requestWriter
			+ ", requestTitle=" + requestTitle + ", requestContent=" + requestContent + ", status=" + status + "]";
}
   
   
   
   
   
   
   
   
}