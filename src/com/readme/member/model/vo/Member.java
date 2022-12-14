package com.readme.member.model.vo;

import java.sql.Date;

public class Member {

	/*
	 USER_NO	NUMBER
USER_ID	VARCHAR2(30 BYTE)
USER_PWD	VARCHAR2(100 BYTE)
USER_NAME	VARCHAR2(18 BYTE)
EMAIL	VARCHAR2(100 BYTE)
GENDER	VARCHAR2(1 BYTE)
BIRTH	DATE
ENROLL_DATE	DATE
STATUS	VARCHAR2(1 BYTE)
EVENT_ASSENT	VARCHAR2(1 BYTE)
INFO_ASSENT	VARCHAR2(1 BYTE)
CHECK_COUNT	NUMBER
REVIEW_COUNT	NUMBER
POINT	NUMBER
	 */
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String gender;
	private String birth;
	private Date enrollDate;
	private String status;
	private String eventAssent;
	private String infoAssent;
	private int reviewCount;
	private int point;
	private Date attDate;
	private int wish;
	public Member() {
		super();
	}
	
	public Member(String userId, String userPwd, String userName, String email, String gender, String birth,
			String eventAssent, String infoAssent) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.eventAssent = eventAssent;
		this.infoAssent = infoAssent;
	}

	public Member(String userId, String userName, String email, String gender, String birth, String eventAssent,
			String infoAssent) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.eventAssent = eventAssent;
		this.infoAssent = infoAssent;
	}

	public Member(int userNo, String userId, String userName, String email, String birth, int reviewCount, int point,
			int wish) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.birth = birth;
		this.reviewCount = reviewCount;
		this.point = point;
		this.wish = wish;
	}

	public Member(int userNo, String userId, String userPwd, String userName, String email, String gender, String birth,
			Date enrollDate, String status, String eventAssent, String infoAssent, int reviewCount, int point,
			Date attDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.status = status;
		this.eventAssent = eventAssent;
		this.infoAssent = infoAssent;
		this.reviewCount = reviewCount;
		this.point = point;
		this.attDate = attDate;
	}
	public Member(int userNo, String userId, String userPwd, String userName, String email, String gender, String birth,
			Date enrollDate, String status, String eventAssent, String infoAssent, int reviewCount, int point) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.status = status;
		this.eventAssent = eventAssent;
		this.infoAssent = infoAssent;
		this.reviewCount = reviewCount;
		this.point = point;
	}
	public Member(int userNo, String userId, String userPwd, String userName, String email, String gender, String birth,
			Date enrollDate, String status, String eventAssent, String infoAssent, int reviewCount, int point,
			Date attDate, int wish) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.status = status;
		this.eventAssent = eventAssent;
		this.infoAssent = infoAssent;
		this.reviewCount = reviewCount;
		this.point = point;
		this.attDate = attDate;
		this.wish = wish;
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
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEventAssent() {
		return eventAssent;
	}
	public void setEventAssent(String eventAssent) {
		this.eventAssent = eventAssent;
	}
	public String getInfoAssent() {
		return infoAssent;
	}
	public void setInfoAssent(String infoAssent) {
		this.infoAssent = infoAssent;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getAttDate() {
		return attDate;
	}
	public void setAtt_date(Date attDate) {
		this.attDate = attDate;
	}
	public int getWish() {
		return wish;
	}
	public void setWish(int wish) {
		this.wish = wish;
	}
	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", gender=" + gender + ", birth=" + birth + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", eventAssent=" + eventAssent + ", infoAssent=" + infoAssent
				+ ", reviewCount=" + reviewCount + ", point=" + point + ", attDate=" + attDate + ", wish=" + wish
				+ "]";
	}

	
	
	
}