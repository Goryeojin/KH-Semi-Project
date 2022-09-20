package com.readme.event.model.vo;

import java.sql.Date;

public class Event {
	
	private int userNo;
	private String userId;
	private Date attDate;
	private int reviewCount;
	public Event() {
		super();
	}
	public Event(int userNo, String userId, Date attDate, int reviewCount) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.attDate = attDate;
		this.reviewCount = reviewCount;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getAttDate() {
		return attDate;
	}
	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	@Override
	public String toString() {
		return "Event [userNo=" + userNo + ", userId=" + userId + ", attDate=" + attDate + ", reviewCount="
				+ reviewCount + "]";
	}
	
	

}
