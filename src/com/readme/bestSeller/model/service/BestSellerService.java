package com.readme.bestSeller.model.service;

import static com.readme.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.readme.bestSeller.model.dao.BestSellerDao;
import com.readme.bestSeller.model.vo.BestSeller;
import com.readme.common.model.vo.PageInfo;

public class BestSellerService {

   public ArrayList<BestSeller> selectBestSellerOriginalList() {

      Connection conn = getConnection();
      
      ArrayList<BestSeller> list = new BestSellerDao().selectBestSellerOriginalList(conn);
      
      
      close(conn);
      

      
      
      return list;
   }

   
	public ArrayList<BestSeller> selectBestSellerVoteList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<BestSeller> list = new BestSellerDao().selectBestSellerVoteList(conn, pi);
		
		close(conn);
		
		return list;
	}


	public int updateBestSellerVoteList(BestSeller bs) {
		
		Connection conn = getConnection();
		
		int result = new BestSellerDao().updateBestSellerVoteList(conn, bs);
		
		if(result > 0) {
			
			commit(conn);
		} else {
			rollback(conn);
			
			
		}
		
		
		
		return result;
	}


	public int selectListCount() {
	      
	      Connection conn = getConnection();
	      
	      int listCount = new BestSellerDao().selectListCount(conn);
	      // SELECT문의 결과는 ResultSet이 맞긴한데
	      // 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
	      
	      close(conn);
	      
	      
	      return listCount;
	   }


	public ArrayList<BestSeller> selectBestSellerEditorPickList() {
		Connection conn = getConnection();
	      
	      ArrayList<BestSeller> list = new BestSellerDao().selectBestSellerEditorPickList(conn);
	      
	      
	      close(conn);
	      

	      
	      
	      return list;
	}
	
	
	public int seBestSellerVoteList(int bookNo) {

	      Connection conn = getConnection();
	      
	      int result2 = new BestSellerDao().seBestSellerVoteList(conn, bookNo);
	   
	      close(conn);
	      
	      return result2;
	   }

	
	







}