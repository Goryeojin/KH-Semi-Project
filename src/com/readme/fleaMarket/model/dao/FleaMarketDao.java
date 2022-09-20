package com.readme.fleaMarket.model.dao;

import static com.readme.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.readme.common.model.vo.PageInfo;
import com.readme.fleaMarket.model.vo.Attachment;
import com.readme.fleaMarket.model.vo.FleaMarket;
import com.readme.fleaMarket.model.vo.Reply;
import com.readme.member.model.dao.MemberDao;

public class FleaMarketDao {
	
	private Properties prop = new Properties();
	
	public FleaMarketDao() {
		
		String fileName = MemberDao.class.getResource("/sql/fleaMarket/fleaMarket-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<FleaMarket> selectFleaMarketSellList(Connection conn, PageInfo pi) {
		
		ArrayList<FleaMarket> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFleaMarketSellList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				FleaMarket flea = new FleaMarket();
				
				flea.setFleaNo(rset.getInt("FLEA_NO"));
				flea.setFleaTitle(rset.getString("FLEA_TITLE"));
				flea.setFleaWriter(rset.getString("USER_ID"));
				flea.setPrice(rset.getInt("FLEA_PRICE"));
				flea.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(flea);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<FleaMarket> selectFleaMarketBuyList(Connection conn, PageInfo pi) {
		
		ArrayList<FleaMarket> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFleaMarketBuyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				FleaMarket flea = new FleaMarket();
				
				flea.setFleaNo(rset.getInt("FLEA_NO"));
				flea.setFleaTitle(rset.getString("FLEA_TITLE"));
				flea.setFleaWriter(rset.getString("USER_ID"));
				flea.setPrice(rset.getInt("FLEA_PRICE"));
				flea.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(flea);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertFleaMarket(Connection conn, FleaMarket flea) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFleaMarket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, flea.getUserNo());
			pstmt.setString(2, flea.getFleaTitle());
			pstmt.setString(3, flea.getFleaContent());
			pstmt.setInt(4, flea.getFleaType());
			pstmt.setInt(5, flea.getPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public FleaMarket selectFleaMarket(Connection conn, int fno) {
		
		FleaMarket flea = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFleaMarket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				flea = new FleaMarket();
				flea.setFleaNo(rset.getInt("FLEA_NO"));
				flea.setUserNo(rset.getInt("FLEA_WRITER"));
				flea.setFleaWriter(rset.getString("USER_ID"));
				flea.setFleaTitle(rset.getString("FLEA_TITLE"));
				flea.setFleaContent(rset.getString("FLEA_CONTENT"));
				flea.setPrice(rset.getInt("FLEA_PRICE"));
				flea.setFleaType(rset.getInt("FLEA_TYPE"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return flea;
	}

	public Attachment selectAttachment(Connection conn, int fno) {
		
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	
	public int selectSellListCount(Connection conn) {
	    // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
	          // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
	          // 변수
	          int listCount = 0;
	       
	          
	          PreparedStatement pstmt = null;
	          ResultSet rset = null;
	          
	          String sql = prop.getProperty("selectListCount");
	          
	          try {
	             pstmt = conn.prepareStatement(sql);
	             pstmt.setInt(1, 1);
	             
	        
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
	
	public int selectBuyListCount(Connection conn) {
	    // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
	          // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
	          // 변수
	          int listCount = 0;
	       
	          
	          PreparedStatement pstmt = null;
	          ResultSet rset = null;
	          
	          String sql = prop.getProperty("selectListCount");
	          
	          try {
	             pstmt = conn.prepareStatement(sql);
	             pstmt.setInt(1, 2);
	             
	        
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

	public int updateFleaMarket(Connection conn, FleaMarket flea) {
		
		// UPDATE 구문 => 처리된 행의 갯수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFleaMarket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, flea.getFleaTitle());
			pstmt.setString(2, flea.getFleaContent());
			pstmt.setInt(3, flea.getFleaType());
			pstmt.setInt(4, flea.getPrice());
			pstmt.setInt(5, flea.getFleaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int fno) {
		
		// SELECT => ResultSet => ArrayList, while
		// 변수
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO"),
									rset.getString("USER_ID"),
									rset.getString("REPLY_CONTENT"),
									rset.getDate("REPLY_DATE")));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertReply(Connection conn, Reply r) {
		// INSERT문 => 처리된 행의 갯수
		// 필요한 변수
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getRefFno());
			pstmt.setInt(2, r.getUserNo());
			pstmt.setString(3, r.getReplyContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
