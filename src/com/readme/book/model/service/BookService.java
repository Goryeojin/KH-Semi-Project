package com.readme.book.model.service;
import static com.readme.common.JDBCTemplate.close;
import static com.readme.common.JDBCTemplate.commit;
import static com.readme.common.JDBCTemplate.getConnection;
import static com.readme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.readme.book.model.dao.BookDao;
import com.readme.book.model.vo.Book;
import com.readme.book.model.vo.Wish;
import com.readme.common.model.vo.PageInfo;
import com.readme.review.model.vo.Review;


public class BookService {
	
	
	
	
	public Book selectBook(int bookNo) {
		Connection conn = getConnection();
		Book b = new BookDao().selectBook(conn, bookNo);
		close(conn);
		return b;
	}



	public ArrayList<Review> selectReviewS(int bookNo) {
		Connection conn = getConnection();
		ArrayList<Review> reviewS = new BookDao().selectReviewS(conn, bookNo);
		close(conn);
		return reviewS;
	}


	

	public ArrayList<Book> selectCategory(int gnereNo) {
		Connection conn = getConnection();
		ArrayList<Book> categoryList = new BookDao().selectCategory(conn, gnereNo);
		close(conn);
		return categoryList;
		
	}



	public int increaseReviewCount(int bno) {
		
		Connection conn = getConnection();
		
		int result = new BookDao().increaseReviewCount(conn, bno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}



	public Wish selectCheckWish(int bookNo, int userNo) {
		
		Connection conn = getConnection();
		
		Wish w = new BookDao().selectCheckWish(conn, bookNo, userNo);
		
		close(conn);
		
		return w;
	}



	public int insertWish(int bno, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new BookDao().insertWish(conn, bno, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}



	public int updateNWish(int bno, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new BookDao().updateNWish(conn, bno, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int updateYWish(int bno, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new BookDao().updateYWish(conn, bno, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public Book mainBestSeller(int bestRate) {
		Connection conn = getConnection();
		Book b = new BookDao().mainBestSeller(conn, bestRate);
		close(conn);
		return b;
		
	}



	public ArrayList<Book> selectSearchBook(String search, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Book> searchBook = new BookDao().selectSearchBook(conn, search, pi);
		close(conn);
		return searchBook;
	}



	public int selectSearch(String search) {
		
		Connection conn = getConnection();
		
		int listCount = new BookDao().selectSearch(conn,search);
		
		// SELECT문의 결과는 ResultSet이 맞긴한데
		// 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
		
		close(conn);
		
		return listCount;
		
	}


	public Book mainScope(int scopeRate) {
		Connection conn = getConnection();
		Book b = new BookDao().mainScope(conn, scopeRate);
		close(conn);
		return b;
	}


	public ArrayList<Book> searchAuthor(String search) {
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().searchAuthor(conn, search);
		close(conn);
		return list;
	}


	public ArrayList<Book> searchBookTitle(String search) {
		
		Connection conn = getConnection();
		ArrayList<Book> searchBook = new BookDao().searchBookTitle(conn, search);
		close(conn);
		return searchBook;
		
		
		
	}
	

}
