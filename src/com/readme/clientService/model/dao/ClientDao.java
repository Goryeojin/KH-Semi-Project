package com.readme.clientService.model.dao;

import static com.readme.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.readme.clientService.model.vo.Notice;
import com.readme.clientService.model.vo.Question;
import com.readme.clientService.model.vo.Request;
import com.readme.common.model.vo.PageInfo;
import com.readme.member.model.dao.MemberDao;

public class ClientDao {
	
	private Properties prop = new Properties();
	
	public ClientDao() {
		
		String fileName = MemberDao.class.getResource("/sql/clientService/clientService-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertInquiry(Connection conn, Question q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, q.getUserNo());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertRequest(Connection conn, Request r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRequest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getUserNo());
			pstmt.setString(2, r.getRequestTitle());
			pstmt.setString(3, r.getRequestContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Notice> selectNoticeAll(Connection conn, PageInfo pi) {
		
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeWriter(rset.getString("USER_NAME"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setNoticeDate(rset.getDate("NOTICE_DATE"));
				n.setCount(rset.getInt("COUNT"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int increaseNoticeCount(Connection conn, int nno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseNoticeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public Notice selectNotice(Connection conn, int nno) {
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeWriter(rset.getString("USER_NAME"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				n.setNoticeDate(rset.getDate("NOTICE_DATE"));
				n.setCount(rset.getInt("COUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}
		
		return n;
	}
	
	public int selectListCount(Connection conn) {
	    // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
	          // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
	          // 변수
	          int listCount = 0;
	       
	          
	          PreparedStatement pstmt = null;
	          ResultSet rset = null;
	          
	          String sql = prop.getProperty("selectListCount");
	          
	          try {
	             pstmt = conn.prepareStatement(sql);
	             
	        
	             rset = pstmt.executeQuery();
	             
	             if(rset.next()) {
	                listCount = rset.getInt("COUNT");   // COUNT로 빼내기 위해서 DB에다가 별명 설정해준거임!
	             }
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }finally {
	             close(rset);
	             close(pstmt);
	          }
	          
	          return listCount;
	          
	          
	 }

}
