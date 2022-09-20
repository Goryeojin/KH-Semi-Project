package com.readme.book.model.vo;

import java.sql.Date;

public class Book {
	
	//BOOK_NO	NUMBER
	//GNERE_NO	NUMBER
	//BOOK_TITLE	VARCHAR2(100 BYTE)
	//BOOK_AUTHOR	VARCHAR2(100 BYTE)
	//BOOK_PUBLISHER	VARCHAR2(100 BYTE)
	//BOOK_INTRO	VARCHAR2(4000 BYTE)
	//BOOK_SUMMARY	VARCHAR2(4000 BYTE)
	//REVIEW_COUNT	NUMBER
	private int bookNo;
	private int gnereNo;
	private String title;
	private String author;
	private String publisher;
	private String gnereName;
	private String intro;

	private String summary;
	private double scope;
	
	public Book() {
		super();
	}
	public Book(int bookNo, String title, String author, String publisher, String intro, double scope) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.intro = intro;
		this.scope = scope;
	}
	
	public Book(int bookNo, String title, String author, String publisher, String gnereName, String intro,
			String summary)
	{
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.gnereName = gnereName;
		this.intro = intro;
		this.summary = summary;
		
	}

	public Book(int bookNo, int gnereNo, String title, String author, String publisher, String gnereName, String intro,
			String summary) {
		super();
		this.bookNo = bookNo;
		this.gnereNo = gnereNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.gnereName = gnereName;
		this.intro = intro;
		this.summary = summary;
	}

	public Book(int bookNo, String title, String author, String publisher, String gnereName, String intro,
			String summary, double scope) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.gnereName = gnereName;
		this.intro = intro;
		this.summary = summary;
		this.scope = scope;
	}

	public Book(int bookNo, String title, String author, String publisher, String gnereName, String intro,
			double scope) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.gnereName = gnereName;
		this.intro = intro;
		this.scope = scope;
	}

	public Book(int bookNo, int gnereNo, String title, String author, String publisher, String gnereName, String intro,
			String summary, double scope) {
		super();
		this.bookNo = bookNo;
		this.gnereNo = gnereNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.gnereName = gnereName;
		this.intro = intro;
		this.summary = summary;
		this.scope = scope;
	}

	public double getScope() {
		return scope;
	}
	
	public void setScope(double scope) {
		this.scope = scope;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getGnereNo() {
		return gnereNo;
	}

	public void setGnereNo(int gnereNo) {
		this.gnereNo = gnereNo;
	}

	public String getGnereName() {
		return gnereName;
	}

	public void setGnereName(String gnereName) {
		this.gnereName = gnereName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", gnereNo=" + gnereNo + ", title=" + title + ", author=" + author
				+ ", publisher=" + publisher + ", gnereName=" + gnereName + ", intro=" + intro + ", summary=" + summary
				+ "]";
	}
	
}
