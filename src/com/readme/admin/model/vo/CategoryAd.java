package com.readme.admin.model.vo;

public class CategoryAd {
	private int categoryNo;//	GNERE_NO	NUMBER
	private String categoryName;//	GNERE_NAME	VARCHAR2(30 BYTE)
	public CategoryAd() {
		super();
	}
	
	public CategoryAd(String categoryName) {
		super();
		this.categoryName = categoryName;
	}

	public CategoryAd(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "CategoryAd [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
	
	
	
	
	
}
