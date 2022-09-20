package com.readme.review.model.vo;

import java.sql.Date;

public class Review {
	
	/*
	 REVIEW_NO	NUMBER
REVIEW_BOOK	NUMBER
REVIEW_WRITER	NUMBER
REVIEW_TITLE	VARCHAR2(100 BYTE)
REVIEW_CONTENT	VARCHAR2(4000 BYTE)
REVIEW_DATE	DATE
COUNT	NUMBER
STATUS	VARCHAR2(1 BYTE)
	 */
	
	private int reviewNo;
	private int bookNo;
	private int userNo; // 원래 int review_writer임.
	private String reviewWriter;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScope;
	private Date reviewDate;
	private int reviewCount;
	private String status;
	
	
	public Review() {
		super();
	}

	public Review(String reviewWriter, String reviewContent, int reviewScope, Date reviewDate, int reviewCount) {
	      super();
	      this.reviewWriter = reviewWriter;
	      this.reviewContent = reviewContent;
	      this.reviewScope = reviewScope;
	      this.reviewDate = reviewDate;
	      this.reviewCount = reviewCount;
   }
	
	public Review(String reviewWriter, String reviewContent, int reviewScope, Date reviewDate, int reviewCount, String reviewTitle, int reviewNo) {
		super();
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewScope = reviewScope;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.reviewTitle = reviewTitle;
		this.reviewNo = reviewNo;
	}

	public Review(int reviewNo, int bookNo, String reviewWriter, String reviewTitle, String reviewContent,
			int reviewScope, Date reviewDate, int reviewCount, String status) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.reviewWriter = reviewWriter;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewScope = reviewScope;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.status = status;
	}

	public Review(int reviewNo, int bookNo, int userNo, String reviewWriter, String reviewTitle, String reviewContent,
			int reviewScope, Date reviewDate, int reviewCount, String status) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.userNo = userNo;
		this.reviewWriter = reviewWriter;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewScope = reviewScope;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
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

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", bookNo=" + bookNo + ", userNo=" + userNo + ", reviewWriter="
				+ reviewWriter + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewScope="
				+ reviewScope + ", reviewDate=" + reviewDate + ", reviewCount=" + reviewCount + ", status=" + status
				+ "]";
	}


}
