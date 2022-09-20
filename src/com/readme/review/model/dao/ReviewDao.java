package com.readme.review.model.dao;

import static com.readme.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.readme.book.model.dao.BookDao;
import com.readme.common.model.vo.PageInfo;
import com.readme.review.model.vo.Review;

public class ReviewDao {
	private Properties prop = new Properties();
	
public ReviewDao() {
		
		String fileName = BookDao.class.getResource("/sql/review/review-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

	public ArrayList<Review> selectReviewB(Connection conn, int bookNo, PageInfo pi) {
		
		ArrayList<Review> reviewB = new ArrayList<Review>();
		String content = "";
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewB");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, bookNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
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
				 
				reviewB.add(r);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewB;
		
	}



	public int selectListCount(Connection conn, int bookNo) {
		// SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
				// SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
				// 변수
				int listCount = 0;
			
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectListCount");
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, bookNo);
					
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

	public int insertReview(Connection conn, Review re) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, re.getBookNo());
			pstmt.setInt(2, re.getUserNo());
			pstmt.setString(3, re.getReviewTitle());
			pstmt.setString(4, re.getReviewContent());
			pstmt.setInt(5, re.getReviewScope());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Review selectReview(Connection conn, int rno) {
		
		Review re = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				re = new Review();
				re.setReviewNo(rset.getInt("REVIEW_NO"));
				re.setBookNo(rset.getInt("REVIEW_BOOK"));
				re.setUserNo(rset.getInt("REVIEW_WRITER"));
				re.setReviewWriter(rset.getString("USER_ID"));
				re.setReviewTitle(rset.getString("REVIEW_TITLE"));
				re.setReviewContent(rset.getString("REVIEW_CONTENT"));
				re.setReviewScope(rset.getInt("REVIEW_SCOPE"));
				re.setReviewDate(rset.getDate("REVIEW_DATE"));
				re.setReviewCount(rset.getInt("COUNT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return re;
	}



	public int increaseReviewCount(Connection conn, int rno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int reviewCount(Connection conn) {
		int count = 0;
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");	// COUNT로 빼내기 위해서 DB에다가 별명 설정해준거임!
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}



	public int updateReview(Connection conn, Review re) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, re.getReviewTitle());
			pstmt.setString(2, re.getReviewTitle());
			pstmt.setInt(3, re.getReviewScope());
			pstmt.setInt(4, re.getReviewNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
