package com.readme.fleaMarket.model.service;

import static com.readme.common.JDBCTemplate.close;
import static com.readme.common.JDBCTemplate.commit;
import static com.readme.common.JDBCTemplate.getConnection;
import static com.readme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.readme.clientService.model.dao.ClientDao;
import com.readme.common.model.vo.PageInfo;
import com.readme.fleaMarket.model.dao.FleaMarketDao;
import com.readme.fleaMarket.model.vo.Attachment;
import com.readme.fleaMarket.model.vo.FleaMarket;
import com.readme.fleaMarket.model.vo.Reply;

public class FleaMarketService {

	public ArrayList<FleaMarket> selectFleaMarketSellList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<FleaMarket> list = new FleaMarketDao().selectFleaMarketSellList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<FleaMarket> selectFleaMarketBuyList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<FleaMarket> list = new FleaMarketDao().selectFleaMarketBuyList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int insertFleaMarket(FleaMarket flea, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new FleaMarketDao().insertFleaMarket(conn, flea);
		
		int result2 = new FleaMarketDao().insertAttachment(conn, at);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}

	public FleaMarket selectFleaMarket(int fno) {
		
		Connection conn = getConnection();
		
		FleaMarket flea = new FleaMarketDao().selectFleaMarket(conn, fno);
		
		close(conn);
		
		return flea;
	}

	public Attachment selectAttachment(int fno) {
		
		Connection conn = getConnection();
		
		Attachment at = new FleaMarketDao().selectAttachment(conn, fno);
		
		close(conn);
		
		return at;
	}
	
	public int selectSellListCount() {
	      
	      Connection conn = getConnection();
	      
	      int listCount = new FleaMarketDao().selectSellListCount(conn);
	      // SELECT?????? ????????? ResultSet??? ????????????
	      // ???????????? ??? ????????? ??????????????? ????????? ??????????????? ???????????????.
	      
	      close(conn);
	      
	      
	      return listCount;
	   }
	
	public int selectBuyListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new FleaMarketDao().selectBuyListCount(conn);
		// SELECT?????? ????????? ResultSet??? ????????????
		// ???????????? ??? ????????? ??????????????? ????????? ??????????????? ???????????????.
		
		close(conn);
		
		
		return listCount;
	}

	public int updateFleaMarket(FleaMarket flea, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new FleaMarketDao().updateFleaMarket(conn, flea);
		
		int result2 = 1;
		
		if(at != null) {
			// ????????? ??????????????? ????????? ??????
			if(at.getFileNo() != 0) {
				result2 = new FleaMarketDao().updateAttachment(conn, at);
			}
		}
		
		// ??? ??? ???????????? ???????????? ????????? commit
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}

	public ArrayList<Reply> selectReply(int fno) {

		 Connection conn = getConnection();
		 
		 ArrayList<Reply> list = new FleaMarketDao().selectReplyList(conn, fno);
		 
		 close(conn);
		 
		 return list;
	}

	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new FleaMarketDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
