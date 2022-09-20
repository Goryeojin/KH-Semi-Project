package com.readme.book.model.dao;

import static com.readme.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.readme.book.model.vo.Book;
import com.readme.book.model.vo.Wish;
import com.readme.common.model.vo.PageInfo;
import com.readme.review.model.vo.Review;

public class BookDao {
private Properties prop = new Properties();
	
	public BookDao() {
		
		String fileName = BookDao.class.getResource("/sql/book/book-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Book selectBook(Connection conn, int bookNo) {
		// SELECT => ResultSet => PK에 의해 한건만 => Board
		// 변수
		
		Book b = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 b = new Book( rset.getInt("BOOK_NO"),
							  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_AUTHOR"),
							  rset.getString("BOOK_PUBLISHER"),
							  rset.getString("GNERE_NAME"),
							  rset.getString("BOOK_INTRO"),
							  rset.getString("BOOK_SUMMARY"),
							  Math.round(rset.getDouble("SCOPE")*10)/10.0);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public ArrayList<Review> selectReviewS(Connection conn, int bookNo) {
		
		String content = "";
		ArrayList<Review> reviewS = new ArrayList<Review>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewS");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				if(rset.getString("REVIEW_CONTENT").length() > 130) {
					content = rset.getString("REVIEW_CONTENT").substring(0,130)+ "....";
				}
				else{content = rset.getString("REVIEW_CONTENT");}
				
				 Review r = new Review( rset.getString("USER_ID"),
							  content,
							  rset.getInt("REVIEW_SCOPE"),
							  rset.getDate("REVIEW_DATE"),
							  rset.getInt("COUNT"),
							  rset.getString("REVIEW_TITLE"),
							  rset.getInt("REVIEW_NO"));
				 
				reviewS.add(r);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reviewS;
		}


	public ArrayList<Book> selectCategory(Connection conn, int gnereNo) {
		ArrayList<Book> categoryList = new ArrayList<Book>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, gnereNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				 Book b = new Book(rset.getInt("BOOK_NO"),
						 	  rset.getInt("GNERE_NO"),
						 	  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_AUTHOR"),
							  rset.getString("BOOK_PUBLISHER"),
							  rset.getString("GNERE_NAME"),
							  rset.getString("BOOK_INTRO"),
							  rset.getString("BOOK_SUMMARY"),
							  Math.round(rset.getDouble("SCOPE")*10)/10.0);
				 
				categoryList.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return categoryList;
		
		
	}

	public int increaseReviewCount(Connection conn, int bno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Wish selectCheckWish(Connection conn, int bookNo, int userNo) {
		
		Wish w = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCheckWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Wish();
				w.setUserNo(rset.getInt("USER_NO"));
				w.setBookNo(rset.getInt("BOOK_NO"));
				w.setStatus(rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return w;
	}

	public int insertWish(Connection conn, int bno, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNWish(Connection conn, int bno, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateYWish(Connection conn, int bno, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateYWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Book mainBestSeller(Connection conn, int bestRate) {
		
		
		
		
		Book b = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("mainBestSeller");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bestRate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 b = new Book( rset.getInt("BOOK_NO"),
							  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_AUTHOR"),
							  rset.getString("BOOK_PUBLISHER"),
							  rset.getString("BOOK_INTRO"),
							  Math.round(rset.getDouble("SCOPE")*10)/10.0);
				
				 
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}






	public ArrayList<Book> selectSearchBook(Connection conn, String search, PageInfo pi) {
		ArrayList<Book> searchBook = new ArrayList<Book>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			
			
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				 Book b = new Book(rset.getInt("BOOK_NO"),
						 	  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_AUTHOR"),
							  rset.getString("BOOK_PUBLISHER"),
							  rset.getString("GNERE_NAME"),
							  rset.getString("BOOK_INTRO"),
							  Math.round(rset.getDouble("SCOPE")*10)/10.0);
				 
				 
				searchBook.add(b);
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return searchBook;
		
	}






	public int selectSearch(Connection conn, String search) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+search+"%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");	// COUNT로 빼내기 위해서 DB에다가 별명 설정해준거임!
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
		
		
	}






	public Book mainScope(Connection conn, int scopeRate) {
		Book b = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("mainScope");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, scopeRate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 b = new Book( rset.getInt("BOOK_NO"),
							  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_AUTHOR"),
							  rset.getString("BOOK_PUBLISHER"),
							  rset.getString("BOOK_INTRO"),
							  Math.round(rset.getDouble("SCOPE")*10)/10.0);
				
				 
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}






	public ArrayList<Book> searchAuthor(Connection conn, String search) {
		ArrayList<Book> list = new ArrayList<Book>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchAuthor");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			pstmt.setString(1, "%"+search+"%");
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				 Book b = new Book(rset.getInt("BOOK_NO"),
						 	  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_AUTHOR"),
							  rset.getString("BOOK_PUBLISHER"),
							  rset.getString("GNERE_NAME"),
							  rset.getString("BOOK_INTRO"),
							  Math.round(rset.getDouble("SCOPE")*10)/10.0);
				 
				 
				list.add(b);
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}






	public ArrayList<Book> searchBookTitle(Connection conn, String search) {
		
		
ArrayList<Book> searchBook = new ArrayList<Book>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchBookTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			
			pstmt.setString(1, "%"+search+"%");
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				 Book b = new Book(rset.getInt("BOOK_NO"),
						 	  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_AUTHOR"),
							  rset.getString("BOOK_PUBLISHER"),
							  rset.getString("GNERE_NAME"),
							  rset.getString("BOOK_INTRO"),
							  Math.round(rset.getDouble("SCOPE")*10)/10.0);
				 
				 
				searchBook.add(b);
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return searchBook;
	}
}
