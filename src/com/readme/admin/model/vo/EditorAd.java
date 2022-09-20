package com.readme.admin.model.vo;

public class EditorAd {
	private int bookNo;
	private String categoryName;
	private String bookAuthor;
	private String bookPublisher;
	private String bookTitle;
	private String bookIntro;
	private String editorChoice;
	
	// GNERE_NAME, B.BOOK_AUTHOR, B.BOOK_PUBLISHER, B.BOOK_TITLE, 
	//B.BOOK_INTRO, EDITOR_CHOICE
	
	
	public EditorAd() {
		super();
	}

	public EditorAd(int bookNo, String categoryName, String bookAuthor, String bookPublisher, String bookTitle, String bookIntro,
			String editorChoice) {
		super();
		this.bookNo = bookNo;
		this.categoryName = categoryName;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.bookTitle = bookTitle;
		this.bookIntro = bookIntro;
		this.editorChoice = editorChoice;
	}
	
	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookIntro() {
		return bookIntro;
	}

	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}

	public String getEditorChoice() {
		return editorChoice;
	}

	public void setEditorChoice(String editorChoice) {
		this.editorChoice = editorChoice;
	}

	@Override
	public String toString() {
		return "EditorAd [categoryName=" + categoryName + ", bookAuthor=" + bookAuthor + ", bookPublisher="
				+ bookPublisher + ", bookTitle=" + bookTitle + ", bookIntro=" + bookIntro + ", editorChoice="
				+ editorChoice + "]";
	}

	
	
}
