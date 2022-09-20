package com.readme.clientService.model.service;

import static com.readme.common.JDBCTemplate.close;
import static com.readme.common.JDBCTemplate.commit;
import static com.readme.common.JDBCTemplate.getConnection;
import static com.readme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.readme.bestSeller.model.dao.BestSellerDao;
import com.readme.clientService.model.dao.ClientDao;
import com.readme.clientService.model.vo.Notice;
import com.readme.clientService.model.vo.Question;
import com.readme.clientService.model.vo.Request;
import com.readme.common.model.vo.PageInfo;

public class ClientService {

	public int insertInquiry(Question q) {
		
		Connection conn = getConnection();
		
		int result = new ClientDao().insertInquiry(conn, q);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertRequest(Request r) {
		
		Connection conn = getConnection();
		
		int result = new ClientDao().insertRequest(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Notice> selectNoticeAll(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new ClientDao().selectNoticeAll(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int increaseNoticeCount(int nno) {
		
		Connection conn = getConnection();
		
		int result = new ClientDao().increaseNoticeCount(conn, nno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Notice selectNotice(int nno) {
		
		Connection conn = getConnection();
		
		Notice n = new ClientDao().selectNotice(conn, nno);
		
		close(conn);
		
		return n;
	}
	
	public int selectListCount() {
	      
	      Connection conn = getConnection();
	      
	      int listCount = new ClientDao().selectListCount(conn);
	      // SELECT문의 결과는 ResultSet이 맞긴한데
	      // 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
	      
	      close(conn);
	      
	      
	      return listCount;
	   }

}
