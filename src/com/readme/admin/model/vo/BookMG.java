package com.readme.admin.model.vo;

public class BookMG {
	private int bookNo;//	BOOK_NO	NUMBER
	private int categoryNo;//	GNERE_NO	NUMBER
	private String bookTitle;//	BOOK_TITLE	VARCHAR2(200 BYTE)
	private String bookAuthor;//	BOOK_AUTHOR	VARCHAR2(100 BYTE)
	private String bookPublisher;//	BOOK_PUBLISHER	VARCHAR2(200 BYTE)
	private String bookIntro;//	BOOK_INTRO	VARCHAR2(4000 BYTE)
	private String bookSummary;//	BOOK_SUMMARY	VARCHAR2(4000 BYTE)
	private int reviewCount;//	REVIEW_COUNT	NUMBER
	
	private String categoryName;
	
	
	
	public BookMG() {
		super();
	}

	

	public BookMG(int bookNo, String categoryName, String bookTitle, String bookAuthor, String bookPublisher,
			int reviewCount) {
		super();
		this.bookNo = bookNo;
		this.categoryName = categoryName;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.reviewCount = reviewCount;
	}



	public BookMG(int bookNo, int categoryNo, String bookTitle, String bookAuthor, String bookPublisher,
			String bookIntro, String bookSummary, int reviewCount, String categoryName) {
		super();
		this.bookNo = bookNo;
		this.categoryNo = categoryNo;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.bookIntro = bookIntro;
		this.bookSummary = bookSummary;
		this.reviewCount = reviewCount;
		this.categoryName = categoryName;
	}



	public int getBookNo() {
		return bookNo;
	}



	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}



	public int getCategoryNo() {
		return categoryNo;
	}



	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}



	public String getBookTitle() {
		return bookTitle;
	}



	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}



	public String getBookAuthor() {
		return bookAuthor;
	}



	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}



	public String getBookPublisher() {
		return bookPublisher;
	}



	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}



	public String getBookIntro() {
		return bookIntro;
	}



	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}



	public String getBookSummary() {
		return bookSummary;
	}



	public void setBookSummary(String bookSummary) {
		this.bookSummary = bookSummary;
	}



	public int getReviewCount() {
		return reviewCount;
	}



	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	@Override
	public String toString() {
		return "BookMG [bookNo=" + bookNo + ", categoryNo=" + categoryNo + ", bookTitle=" + bookTitle + ", bookAuthor="
				+ bookAuthor + ", bookPublisher=" + bookPublisher + ", bookIntro=" + bookIntro + ", bookSummary="
				+ bookSummary + ", reviewCount=" + reviewCount + ", categoryName=" + categoryName + "]";
	}
	
	
	
}