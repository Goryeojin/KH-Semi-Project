package com.readme.fleaMarket.model.vo;

import java.sql.Date;

public class FleaMarket {
	
	/*
	FLEA_NO	NUMBER
FLEA_WRITER	NUMBER
FLEA_TITLE	VARCHAR2(100 BYTE)
FLEA_CONTENT	VARCHAR2(4000 BYTE)
FLEA_DATE	DATE
FLEA_TYPE	NUMBER
FLEA_PRICE	NUMBER
FLEA_STATUS	VARCHAR2(1 BYTE)
	 */
	
	private int fleaNo;
	private int userNo;
	private String fleaWriter;
	private String fleaTitle;
	private String fleaContent;
	private Date enrollDate;
	private int fleaType;
	private int price;
	private String status;
	
	private String titleImg; // 썸네일 파일명(별칭 TITLEIMG에 해당되는 필드)
	
	public FleaMarket() {
		super();
	}
	
	public FleaMarket(int fleaNo, int userNo, String fleaWriter, String fleaTitle, String fleaContent, Date enrollDate,
			int fleaType, int price, String status) {
		super();
		this.fleaNo = fleaNo;
		this.userNo = userNo;
		this.fleaWriter = fleaWriter;
		this.fleaTitle = fleaTitle;
		this.fleaContent = fleaContent;
		this.enrollDate = enrollDate;
		this.fleaType = fleaType;
		this.price = price;
		this.status = status;
	}
	
	public FleaMarket(int fleaNo, int userNo, String fleaWriter, String fleaTitle, String fleaContent, Date enrollDate,
			int fleaType, int price, String status, String titleImg) {
		super();
		this.fleaNo = fleaNo;
		this.userNo = userNo;
		this.fleaWriter = fleaWriter;
		this.fleaTitle = fleaTitle;
		this.fleaContent = fleaContent;
		this.enrollDate = enrollDate;
		this.fleaType = fleaType;
		this.price = price;
		this.status = status;
		this.titleImg = titleImg;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public int getFleaNo() {
		return fleaNo;
	}
	public void setFleaNo(int fleaNo) {
		this.fleaNo = fleaNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getFleaWriter() {
		return fleaWriter;
	}
	public void setFleaWriter(String fleaWriter) {
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
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getFleaType() {
		return fleaType;
	}
	public void setFleaType(int fleaType) {
		this.fleaType = fleaType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "FleaMarket [fleaNo=" + fleaNo + ", userNo=" + userNo + ", fleaWriter=" + fleaWriter + ", fleaTitle="
				+ fleaTitle + ", fleaContent=" + fleaContent + ", enrollDate=" + enrollDate + ", fleaType=" + fleaType
				+ ", price=" + price + ", status=" + status + ", titleImg=" + titleImg + "]";
	}
}
