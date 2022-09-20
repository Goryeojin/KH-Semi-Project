package com.readme.admin.model.vo;

import java.sql.Date;

public class FleaAd {
	
	private int fleaNo;//	FLEA_NO	NUMBER
	private int fleaWriter;//	FLEA_WRITER	NUMBER
	private String fleaTitle;//	FLEA_TITLE	VARCHAR2(100 BYTE)
	private String fleaContent;//	FLEA_CONTENT	VARCHAR2(4000 BYTE)
	private Date fleaDate;//	FLEA_DATE	DATE
	private int fleaType;//	FLEA_TYPE	NUMBER
	private int fleaPrice;//	FLEA_PRICE	NUMBER
	private String fleaStatus;//	FLEA_STATUS	VARCHAR2(1 BYTE)
	
	private String userId;
	
	public FleaAd() {
		super();
	}
	
	




	public FleaAd(int fleaNo, String userId, Date fleaDate, String fleaTitle, int fleaType, String fleaStatus) {
		super();
		this.fleaNo = fleaNo;
		this.userId = userId;
		this.fleaDate = fleaDate;
		this.fleaTitle = fleaTitle;
		this.fleaType = fleaType;
		this.fleaStatus = fleaStatus;
	}






	public FleaAd(int fleaNo, int fleaWriter, String fleaTitle, String fleaContent, Date fleaDate, int fleaType,
			int fleaPrice, String fleaStatus, String userId) {
		super();
		this.fleaNo = fleaNo;
		this.fleaWriter = fleaWriter;
		this.fleaTitle = fleaTitle;
		this.fleaContent = fleaContent;
		this.fleaDate = fleaDate;
		this.fleaType = fleaType;
		this.fleaPrice = fleaPrice;
		this.fleaStatus = fleaStatus;
		this.userId = userId;
	}

	public int getFleaNo() {
		return fleaNo;
	}

	public void setFleaNo(int fleaNo) {
		this.fleaNo = fleaNo;
	}

	public int getFleaWriter() {
		return fleaWriter;
	}

	public void setFleaWriter(int fleaWriter) {
		this.fleaWriter = fleaWriter;
	}

	public String getFleaTitle() {
		return fleaTitle;
	}

	public void setFleaTitle(String fleaTitle) {
		this.fleaTitle = fleaTitle;
	}

	public String getFleaContent() {
		return fleaContent;
	}

	public void setFleaContent(String fleaContent) {
		this.fleaContent = fleaContent;
	}

	public Date getFleaDate() {
		return fleaDate;
	}

	public void setFleaDate(Date fleaDate) {
		this.fleaDate = fleaDate;
	}

	public int getFleaType() {
		return fleaType;
	}

	public void setFleaType(int fleaType) {
		this.fleaType = fleaType;
	}

	public int getFleaPrice() {
		return fleaPrice;
	}

	public void setFleaPrice(int fleaPrice) {
		this.fleaPrice = fleaPrice;
	}

	public String getFleaStatus() {
		return fleaStatus;
	}

	public void setFleaStatus(String fleaStatus) {
		this.fleaStatus = fleaStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "FleaAd [fleaNo=" + fleaNo + ", fleaWriter=" + fleaWriter + ", fleaTitle=" + fleaTitle + ", fleaContent="
				+ fleaContent + ", fleaDate=" + fleaDate + ", fleaType=" + fleaType + ", fleaPrice=" + fleaPrice
				+ ", fleaStatus=" + fleaStatus + ", userId=" + userId + "]";
	}
	
	
	

}
