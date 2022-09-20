package com.readme.admin.model.vo;

import java.sql.Date;

public class ReviewAd {
	
	private int reviewNo;//	REVIEW_NO	NUMBER
	private int BookNo;//	REVIEW_BOOK	NUMBER
	private int reviewWriter;//	REVIEW_WRITER	NUMBER
	private String reviewTitle;//	REVIEW_TITLE	VARCHAR2(100 BYTE)
	private String reviewContent;//	REVIEW_CONTENT	VARCHAR2(4000 BYTE)
	private int reviewScope;//	REVIEW_SCOPE	NUMBER
	private Date reviewDate;//	REVIEW_DATE	DATE
	private int count;//	COUNT	NUMBER
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	//쪼인해준거
	private String userId;
	private String categoryName;
	private String bookTitle;
	
	public ReviewAd() {
		super();
	}
	
	

	public ReviewAd(int reviewNo, String userId, String categoryName, String bookTitle, String reviewTitle, Date reviewDate, String status) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewDate = reviewDate;
		this.status = status;
		this.userId = userId;
		this.categoryName = categoryName;
		this.bookTitle = bookTitle;
	}



	public ReviewAd(int reviewNo, int bookNo, int reviewWriter, String reviewTitle, String reviewContent,
			int reviewScope, Date reviewDate, int count, String status, String userId, String categoryName,
			String bookTitle) {
		super();
		this.reviewNo = reviewNo;
		BookNo = bookNo;
		this.reviewWriter = reviewWriter;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewScope = reviewScope;
		this.reviewDate = reviewDate;
		this.count = count;
		this.status = status;
		this.userId = userId;
		this.categoryName = categoryName;
		this.bookTitle = bookTitle;
	}



	public int getReviewNo() {
		return reviewNo;
	}



	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}



	public int getBookNo() {
		return BookNo;
	}



	public void setBookNo(int bookNo) {
		BookNo = bookNo;
	}



	public int getReviewWriter() {
		return reviewWriter;
	}



	public void setReviewWriter(int reviewWriter) {
		this.reviewWriter = reviewWriter;
	}



	public String getReviewTitle() {
		return reviewTitle;
	}



	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}



	public String getReviewContent() {
		return reviewContent;
	}



	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}



	public int getReviewScope() {
		return reviewScope;
	}



	public void setReviewScope(int reviewScope) {
		this.reviewScope = reviewScope;
	}



	public Date getReviewDate() {
		return reviewDate;
	}



	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
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



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public String getBookTitle() {
		return bookTitle;
	}



	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}



	@Override
	public String toString() {
		return "ReviewAd [reviewNo=" + reviewNo + ", BookNo=" + BookNo + ", reviewWriter=" + reviewWriter
				+ ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewScope=" + reviewScope
				+ ", reviewDate=" + reviewDate + ", count=" + count + ", status=" + status + ", userId=" + userId
				+ ", categoryName=" + categoryName + ", bookTitle=" + bookTitle + "]";
	}
	
	
	

}
