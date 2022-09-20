package com.readme.member.model.vo;

import com.readme.book.model.vo.Book;

public class WishList {
	private int userNo;
	private Book book;
	private String status;

	public WishList(int userNo, Book book, String status) {
		super();
		this.userNo = userNo;
		this.book = book;
		this.status = status;
	}

	public WishList() {
	}
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "WishList [userNo=" + userNo + ", book=" + book + ", status=" + status + "]";
	}
	
	
}
