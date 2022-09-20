package com.readme.review.model.service;

import static com.readme.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.readme.common.model.vo.PageInfo;
import com.readme.review.model.dao.ReviewDao;
import com.readme.review.model.vo.Review;


public class ReviewService {
	
	public ArrayList<Review> selectReviewB(int bookNo, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> reviewB = new ReviewDao().selectReviewB(conn, bookNo,pi);
		
		close(conn);
		
		return reviewB;
	}
	
	public int selectListCount(int bookNo) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCount(conn,bookNo);
		// SELECT문의 결과는 ResultSet이 맞긴한데
		// 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
		
		close(conn);
		
		return listCount;
	}

	public int insertReview(Review re) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertReview(conn, re);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Review selectReview(int rno) {
		
		Connection conn = getConnection();
		
		Review re = new ReviewDao().selectReview(conn, rno);

		close(conn);
		
		return re;
	}

	public int increaseReviewCount(int rno) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().increaseReviewCount(conn, rno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int reviewCount() {
		Connection conn = getConnection();
		
		int count = new ReviewDao().reviewCount(conn);
		// SELECT문의 결과는 ResultSet이 맞긴한데
		// 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
		
		close(conn);
		
		
		return count;
	}

	public int updateReview(Review re) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().updateReview(conn, re);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	

}
