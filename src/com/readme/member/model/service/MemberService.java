package com.readme.member.model.service;

import static com.readme.common.JDBCTemplate.close;
import static com.readme.common.JDBCTemplate.commit;
import static com.readme.common.JDBCTemplate.getConnection;
import static com.readme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import com.readme.clientService.model.dao.ClientDao;
import com.readme.common.model.vo.PageInfo;
import com.readme.member.model.dao.MemberDao;
import com.readme.member.model.vo.Member;
import com.readme.member.model.vo.Question;
import com.readme.member.model.vo.Request;
import com.readme.member.model.vo.WishList;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
	}

	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();


		
		int result = 0;

		result = new MemberDao().updateMember(conn, m);			

		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}

	public Member updatePwdMember(String userId, String userPwd, String updatePwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwdMember(conn, userId, userPwd, updatePwd);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			rollback(conn);
		}
			close(conn);
		
		return updateMem;
	}
	
	public int deleteMember(String userId, String userPwd) {
	      Connection conn = getConnection();
	      
	      int result = new MemberDao().deleteMember(conn, userId, userPwd);
	      
	      if(result > 0) {
	         commit(conn);
	      } else {
	         rollback(conn);
	      }
	      close(conn);
	      
	      return result;
	   }

	
	/*은비 구역------------------------------------------------------------------*/
	public String idSearchMember(String email) {
		
		Connection conn = getConnection();
		
		String result = new MemberDao().idSearchMember(conn, email);
		
		close(conn);
		
		return result;
	}

	public int pwdResetMember(String userId, String changePwd1) {//비밀번호 재설정
		
		Connection conn = getConnection();
		
		int result = new MemberDao().pwdResetMember(conn, userId, changePwd1);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int idCheck(String checkId) {

		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
	}

	public int emailCheck(String email) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().emailCheck(conn, email);
		
		close(conn);
		
		return count;
	}

	public String memberLogin(String userId) {
		
		Connection conn = getConnection();
		
		String result = new MemberDao().memberLogin(conn, userId);
		
		close(conn);
		
		return result;
	
	}

	public int increaseReviewCount(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().increaseReviewCount(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Member selectWishCount(int userNo) {
		
		Connection conn = getConnection();
		
		Member info = new MemberDao().selectWishCount(conn, userNo);
		
		close(conn);
		
		
		return info;
	}
	
	/*윤희구역--------------------------------------------------------------------*/

	/* WishList */
	public ArrayList<WishList> findAll(int userNo, PageInfo pi) {

		Connection conn = getConnection();
		ArrayList<WishList> list = new MemberDao().findAllWishlist(conn, userNo, pi);

		close(conn);

		return list;
	}

	public ArrayList<WishList> searchWishList(int userNo, String keyword) {

		Connection conn = getConnection();
		ArrayList<WishList> list = new MemberDao().searchWishlist(conn, userNo, keyword);

		close(conn);

		return list;
	}

	
	
	/* Review */
	public ArrayList<Map<String, Object>> findAllReviews(int userNo, PageInfo pi) {

		Connection conn = getConnection();

		ArrayList<Map<String, Object>> reviews = new MemberDao().findAllReviews(conn, userNo, pi);

		
		close(conn);

		return reviews;
	}

	public int deleteReviews(String[] userNo) {

		Connection conn = getConnection();

		int result = new MemberDao().deleteReviews(conn, userNo);

		close(conn);

		return result;
	}
	
	

	/* Statistics */
	public ArrayList getStatistics(int userNo) {

		Connection conn = getConnection();

		ArrayList list = new MemberDao().getStatistics(conn, userNo);

		close(conn);

		return list;
	}

	
	
	/* FleaMarket */
	public ArrayList findAllFleaMarket(int userNo, PageInfo pi) {

		Connection conn = getConnection();

		ArrayList list = new MemberDao().findAllFleaMarket(conn, userNo, pi);

		close(conn);

		return list;
	}

	public int deleteFleaMarket(String[] arr) {

		Connection conn = getConnection();

		int result = new MemberDao().deleteFleaMarket(conn, arr);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}
	
	/*
	 * 대성이
	 */
	
	   public ArrayList<Question> selectQuestionList(PageInfo pi, int userNo) {
		      
		      Connection conn = getConnection();
		      
		      ArrayList<Question> list = new MemberDao().selectQuestionList(conn, pi, userNo);
		      
		      close(conn);
		      
		      return list;
		   }

	public int MemberMyPageInquiry(Question q) {
	
		Connection conn = getConnection();
		
		int result = new MemberDao().MemberMyPageInquiry(conn, q);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		 close(conn);
		
		return result;
	}

	public int increaseCount(int questionNo) {

		Connection conn = getConnection();
		
		int result = new MemberDao().increaseCount(conn, questionNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}	
		close(conn);
		
		return result;
	}

	public Question selectQuestion(int questionNo) {
		
		Connection conn = getConnection();
		
		Question q = new MemberDao().selectNoticeList(conn, questionNo);
		
		close(conn);
		
		return q;
	}

	public int deleteQuestion(int questionNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteQuestion(conn, questionNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} close(conn);
		
		
		return result;
	}

	public ArrayList<Request> selectRequestList(PageInfo pi, int userNo) {

	      Connection conn = getConnection();
	      
	      ArrayList<Request> list = new MemberDao().selectRequestList(conn, pi, userNo);
	      
	      
	      close(conn);
	      
	      
	      return list;
	   }


    public int selectListCount(int userNo) {
        
        Connection conn = getConnection();
        
        int listCount = new MemberDao().selectListCount(conn, userNo);
        // SELECT문의 결과는 ResultSet이 맞긴한데
        // 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
        
        close(conn);
        
        
        return listCount;
     }

	

    public int selectInquiryListCount(int userNo) {
        
        Connection conn = getConnection();
        
        int listCount = new MemberDao().selectInquiryListCount(conn, userNo);
        // SELECT문의 결과는 ResultSet이 맞긴한데
        // 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
        
        close(conn);
        
        
        return listCount;
     }


		public int selectFleaCount(int userNo) {
			
		      Connection conn = getConnection();
		      
		      int listCount = new MemberDao().selectFleaCount(conn, userNo);
		      // SELECT문의 결과는 ResultSet이 맞긴한데
		      // 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
		      
		      close(conn);
		      
		      
		      return listCount;
		}
		public int selectMyBookCount(int userNo) {
			
			Connection conn = getConnection();
			
			int listCount = new MemberDao().selectMyBookCount(conn, userNo);
			// SELECT문의 결과는 ResultSet이 맞긴한데
			// 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
			
			close(conn);
			
			return listCount;
		}
		public int selectReviewCount(int userNo) {
			
			Connection conn = getConnection();
			
			int listCount = new MemberDao().selectReviewCount(conn, userNo);
			// SELECT문의 결과는 ResultSet이 맞긴한데
			// 게시글에 총 갯수를 알아야하기 때문에 정수형으로 반환받는다.
			
			close(conn);
			
			
			return listCount;
		}
	

}
