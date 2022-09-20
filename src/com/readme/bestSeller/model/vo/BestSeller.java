package com.readme.bestSeller.model.vo;

public class BestSeller {
	
	  private int bookNo;
	  private String title;
	  private String author;
	  private String publisher;
	  private String intro;
	  private int votecount;
	  private String editorpick;
	public BestSeller() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public BestSeller(int bookNo, String title, String author, String publisher, String intro, int votecount,
			String editorpick) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.intro = intro;
		this.votecount = votecount;
		this.editorpick = editorpick;
	}
	
	
	
	
	
	public BestSeller(int bookNo, String editorpick, String title, String author, String publisher, String intro) {
		super();
		this.bookNo = bookNo;
		this.editorpick = editorpick;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.intro = intro;
		
	}


	public BestSeller(int bookNo, int votecount,String title, String author, String publisher, String intro) {
		super();
		this.bookNo = bookNo;
		this.votecount = votecount;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.intro = intro;
		
	}
	
	
	public BestSeller(int votecount, String title, String author, String publisher, String intro, int bookNo) {
		super();
		this.votecount = votecount;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.intro = intro;
		this.bookNo = bookNo;
	
	}


	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
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
	public int getVotecount() {
		return votecount;
	}
	public void setVotecount(int votecount) {
		this.votecount = votecount;
	}
	public String getEditorpick() {
		return editorpick;
	}
	public void setEditorpick(String editorpick) {
		this.editorpick = editorpick;
	}
	@Override
	public String toString() {
		return "BestSeller [bookNo=" + bookNo + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", intro=" + intro + ", votecount=" + votecount + ", editorpick=" + editorpick + "]";
	}
	  
	
	

}
