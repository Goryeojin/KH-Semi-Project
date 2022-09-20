package com.readme.bestSeller.model.dao;

import static com.readme.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.readme.bestSeller.model.vo.BestSeller;
import com.readme.common.model.vo.PageInfo;

public class BestSellerDao {

   private Properties prop = new Properties();
   
   public BestSellerDao() {
      
      String fileName = BestSellerDao.class.getResource("/sql/bestSeller/bestSeller-mapper.xml").getPath();
      
         try {
            prop.loadFromXML(new FileInputStream(fileName));
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
      
      
   }
   
   
   
   public ArrayList<BestSeller> selectBestSellerOriginalList(Connection conn) {
      
      ArrayList<BestSeller> list = new ArrayList<>();
      Statement stmt = null;
      ResultSet rset = null;
    
      // String sql = prop.getProperty("selectBestSellerOriginalList");
      
      String sql = "SELECT ROWNUM, BOOK_NO, BOOK_TITLE, BOOK_AUTHOR, BOOK_PUBLISHER, BOOK_INTRO, VOTE_COUNT FROM ( SELECT B.BOOK_NO, BOOK_TITLE, BOOK_AUTHOR, BOOK_PUBLISHER, BOOK_INTRO, VOTE_COUNT FROM BOOK B JOIN BEST_SELLER BS ON B.BOOK_NO = BS.BOOK_NO ORDER BY VOTE_COUNT DESC) WHERE ROWNUM BETWEEN 1 AND 5";
            
     
      
      try {
         stmt = conn.createStatement();
         
         rset = stmt.executeQuery(sql);
      
         while(rset.next()) {

            BestSeller bs = new BestSeller(rset.getInt("BOOK_NO"),
            							rset.getInt("VOTE_COUNT"),
                                    rset.getString("BOOK_TITLE"),
                                    rset.getString("BOOK_AUTHOR"),
                                    rset.getString("BOOK_PUBLISHER"),
                                    rset.getString("BOOK_INTRO"));
            
            list.add(bs);

         }
        
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
         
      }
      
      
      
      return list;
   }



public ArrayList<BestSeller> selectBestSellerVoteList(Connection conn, PageInfo pi) {


	
	ArrayList<BestSeller> list = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	
	String sql = prop.getProperty("selectBestSellerVoteList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
        int endRow = startRow + pi.getBoardLimit() -1;
     
        pstmt.setInt(1, startRow);
        pstmt.setInt(2, endRow);
		
        rset = pstmt.executeQuery();
		
	     while(rset.next()) {

	            BestSeller bs = new BestSeller(rset.getInt("VOTE_COUNT"),
	                                    rset.getString("BOOK_TITLE"),
	                                    rset.getString("BOOK_AUTHOR"),
	                                    rset.getString("BOOK_PUBLISHER"),
	                                    rset.getString("BOOK_INTRO"),
	                                    rset.getInt("BOOK_NO"));
	            
	            list.add(bs);

	         }
	    
	     
	    
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
	       close(rset);
	         close(pstmt);
	}
	
	
	
	
	return list;
}



public int updateBestSellerVoteList(Connection conn, BestSeller bs) {
	
	// UPDATE 구문 => 처리된 행의 갯수수깡
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("updateBestSellerVoteList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bs.getBookNo());
		
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	
	return result;
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



public ArrayList<BestSeller> selectBestSellerEditorPickList(Connection conn) {
    ArrayList<BestSeller> list = new ArrayList<>();
    Statement stmt = null;
    ResultSet rset = null;
  
    String sql = prop.getProperty("selectBestSellerEditorPickList");

    
    try {
       stmt = conn.createStatement();
       
       rset = stmt.executeQuery(sql);
    
       while(rset.next()) {

          BestSeller bs = new BestSeller(rset.getInt("BOOK_NO"),
          						  rset.getString("EDITOR_CHOICE"),
                                  rset.getString("BOOK_TITLE"),
                                  rset.getString("BOOK_AUTHOR"),
                                  rset.getString("BOOK_PUBLISHER"),
                                  rset.getString("BOOK_INTRO"));
          
          list.add(bs);

       }
      
       
       
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       close(rset);
       close(stmt);
       
    }
    
    
    
    return list;
}

public int seBestSellerVoteList(Connection conn, int bookNo) {
	   
	   int result2 = 0;
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("seBestSellerVoteList");
	   
	   try {
	      pstmt = conn.prepareStatement(sql);
	      
	      pstmt.setInt(1, bookNo);
	      rset = pstmt.executeQuery();
	      
	      if(rset.next()) {
	         
	            result2 = rset.getInt("COUNT");
	      }
	      
	   } catch (SQLException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	   } finally {
	      
	        close(rset);
	            close(pstmt);
	   }
	   


	   
	   
	   
	   return result2;
	}
}