package com.readme.fleaMarket.model.vo;

import java.sql.Date;

public class Attachment {
	
	/*
	 FILE_NO	NUMBER
REF_FNO	NUMBER
ORIGIN_NAME	VARCHAR2(255 BYTE)
CHANGE_NAME	VARCHAR2(255 BYTE)
FILE_PATH	VARCHAR2(1000 BYTE)
UPLOAD_DATE	DATE
STATUS	VARCHAR2(1 BYTE)
	 */
	
	private int fileNo;
	private int refFno;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	public Attachment() {
		super();
	}
	public Attachment(int fileNo, int refFno, String originName, String changeName, String filePath, Date uploadDate,
			String status) {
		super();
		this.fileNo = fileNo;
		this.refFno = refFno;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getRefFno() {
		return refFno;
	}
	public void setRefFno(int refFno) {
		this.refFno = refFno;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refFno=" + refFno + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
	

}
