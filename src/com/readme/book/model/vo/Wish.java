package com.readme.book.model.vo;

public class Wish {
	/*
	USER_NO	NUMBER
	BOOK_NO	NUMBER
	STATUS	VARCHAR2(1 BYTE)
	*/
	
	private int userNo;
	private int bookNo;
	private String status;
	public Wish() {
		super();
	}
	public Wish(int userNo, int bookNo, String status) {
		super();
		this.userNo = userNo;
		this.bookNo = bookNo;
		this.status = status;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Wish [userNo=" + userNo + ", bookNo=" + bookNo + ", status=" + status + "]";
	}
	
	

}
