package com.readme.member.model.dao;

import static com.readme.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.readme.book.model.vo.Book;
import com.readme.common.model.vo.PageInfo;
import com.readme.member.model.vo.Member;
import com.readme.member.model.vo.Question;
import com.readme.member.model.vo.Request;
import com.readme.member.model.vo.WishList;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {

		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {

		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
						rset.getString("USER_NAME"), rset.getString("EMAIL"), rset.getString("GENDER"),
						rset.getString("BIRTH"), rset.getDate("ENROLL_DATE"), rset.getString("STATUS"),
						rset.getString("EVENT_ASSENT"), rset.getString("INFO_ASSENT"),
						rset.getInt("REVIEW_COUNT"), rset.getInt("POINT"), rset.getDate("ATT_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return m;
	}

	public int insertMember(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getBirth());
			pstmt.setString(7, m.getEventAssent());
			pstmt.setString(8, m.getInfoAssent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	

	public int updateMember(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;

		
		
		String sql = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getBirth());
			pstmt.setString(5, m.getEventAssent());
			pstmt.setString(6, m.getInfoAssent());
			
			pstmt.setString(7, m.getUserId());
			


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Member selectMember(Connection conn, String userId) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO"),
								rset.getString("USER_ID"),
								rset.getString("USER_PWD"),
								rset.getString("USER_NAME"),
								rset.getString("EMAIL"),
								rset.getString("GENDER"),
								rset.getString("BIRTH"),
								rset.getDate("ENROLL_DATE"),
								rset.getString("STATUS"),
								rset.getString("EVENT_ASSENT"),
								rset.getString("INFO_ASSENT"),
								rset.getInt("REVIEW_COUNT"),
								rset.getInt("POINT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int updatePwdMember(Connection conn, String userId, String userPwd, String updatePwd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/*은비 구역------------------------------------------------------------------*/

	public String idSearchMember(Connection conn, String email) {
		
		//SELECT문 -- ResultSet
		
		String result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idSearchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			//실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getString("USER_ID");
			}
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int pwdResetMember(Connection conn, String userId, String changePwd1) {
		
		//UPDATE문 => 처리된 행의 개수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("pwdResetMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, changePwd1);
			pstmt.setString(2, userId);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int idCheck(Connection conn, String checkId) {
		//SELECT => ResultSet -> COUNT 함수 이용(숫자 한 개)
		
		//변수
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				count = rset.getInt("COUNT(*)");			
				
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		
		return count;
	}

	public int emailCheck(Connection conn, String email) {
		
		//SELECT => ResultSet -> COUNT 함수 이용(숫자 한 개)
		
				//변수
				int count = 0;
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("emailCheck");
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, email);
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						
						count = rset.getInt("COUNT(*)");			
						
					}
				} catch (SQLException e) {		
					e.printStackTrace();
				}
				
				return count;

	}

	public String memberLogin(Connection conn, String userId) {
		
		//SELECT문 - ResultSet
		String result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberLogin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  userId);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				result = rset.getString("EMAIL");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public int deleteMember(Connection conn, String userId, String userPwd) {
		
	      int result = 0;
	      PreparedStatement pstmt = null;
	      
	      String sql = prop.getProperty("deleteMember");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, userId);
	         pstmt.setString(2, userPwd);
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      return result;
	   }

	public int increaseReviewCount(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectWishCount(Connection conn, int userNo) {
		
		Member info = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWishCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				info = new Member(rset.getInt("USER_NO"),
								rset.getString("USER_ID"),
								rset.getString("USER_NAME"),
								rset.getString("EMAIL"),
								rset.getString("BIRTH"),
								rset.getInt("REVIEW_COUNT"),
								rset.getInt("POINT"),
								rset.getInt("WISH")
								);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		
		return info;

	}
	
	/*윤희 구역--------------------------------------------------------------------------*/
	
	/*          WishList          */
	
	public ArrayList<WishList> findAllWishlist(Connection conn, int userNo, PageInfo pi) {
		ArrayList<WishList> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findAllWishlist");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Book book = new Book();
				book.setAuthor(rset.getString("book_author"));
				book.setIntro(rset.getString("book_intro"));
				book.setBookNo(rset.getInt("book_no"));
				book.setPublisher(rset.getString("book_publisher"));
				book.setSummary(rset.getString("book_summary"));
				book.setTitle(rset.getString("book_title"));
				book.setGnereNo(rset.getInt("gnere_no"));
//				book.setReviewCount(rset.getInt("reviewCount"));
				
				WishList wishList = new WishList();
				wishList.setStatus(rset.getString("status"));
				wishList.setBook(book);
				wishList.setUserNo(userNo);
				
				list.add(wishList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	


	
	public ArrayList<WishList> searchWishlist(Connection conn, int userNo, String keyword) {
		ArrayList<WishList> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("searchWishlist");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, "%"+keyword+"%");

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Book book = new Book();
				book.setAuthor(rset.getString("book_author"));
				book.setIntro(rset.getString("book_intro"));
				book.setBookNo(rset.getInt("book_no"));
				book.setPublisher(rset.getString("book_publisher"));
				book.setSummary(rset.getString("book_summary"));
				book.setTitle(rset.getString("book_title"));
				book.setGnereNo(rset.getInt("gnere_no"));
//				book.setReviewCount(rset.getInt("reviewCount"));
				
				WishList wishList = new WishList();
				wishList.setStatus(rset.getString("status"));
				wishList.setBook(book);
				wishList.setUserNo(userNo);
				
				list.add(wishList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	
	
	
	
	/*          Review          */
	
	public ArrayList<Map<String, Object>> findAllReviews(Connection conn, int userNo, PageInfo pi) {
		ArrayList<Map<String, Object>> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findAllReviews");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("review_content", rset.getString("review_content"));
				map.put("review_writer", rset.getInt("review_writer"));
				map.put("review_scope", rset.getInt("review_scope"));
				map.put("review_no", rset.getInt("review_no"));
				map.put("book_no", rset.getInt("book_no"));
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}


		return list;
	}
	
	
	

	public int deleteReviews(Connection conn, String[] arr) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteReviews");

		for(String reviewNo:arr) {

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(reviewNo));
				
				result += pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		
		return result;

	}
	
	
	
	
	
	/*          Statistics          */
	
	public ArrayList<Map> getStatistics(Connection conn, int userNo) {

		ArrayList list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getStatistics");


		// Java 시간 더하기 
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMdd");

		Calendar cal = Calendar.getInstance(); 
		cal.setTime(new Date()); 
		cal.add(Calendar.DATE, 1);
		String today = sdformat.format(cal.getTime());

		cal.add(Calendar.MONTH, -1);
		String aMonthAgo = sdformat.format(cal.getTime());

		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, aMonthAgo);
			pstmt.setString(3, today);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				Map map = new HashMap();

				map.put("book_count", rset.getInt("book_count"));
				map.put("gnere_no", rset.getString("gnere_no"));
				map.put("gnere_name", rset.getString("gnere_name"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	
	
	
	
	/*          FleaMarket          */
	
	public ArrayList<Map> findAllFleaMarket(Connection conn, int userNo, PageInfo pi) {
		ArrayList<Map> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String findAllFleaMarketSql = prop.getProperty("findAllFleaMarket");
		try {
			pstmt = conn.prepareStatement(findAllFleaMarketSql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Map map = new HashMap();

				map.put("flea_no", rset.getInt("flea_no"));
				map.put("flea_title", rset.getString("flea_title"));
				map.put("flea_status", rset.getString("flea_status"));
				map.put("flea_price", rset.getInt("flea_price"));
				map.put("flea_date", rset.getDate("flea_date"));
				map.put("flea_type", rset.getInt("flea_type"));

				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		list.forEach(flea -> {

			String findCountFleaMarketReplySql = prop.getProperty("findCountFleaMarketReply");

			PreparedStatement pstmt2 = null;
			ResultSet rset2 = null;

			try {
				pstmt2 = conn.prepareStatement(findCountFleaMarketReplySql);
				pstmt2.setInt(1, (int) flea.get("flea_no"));

				rset2 = pstmt2.executeQuery();

				while (rset2.next()) {
					flea.put("review_count", rset2.getInt("count"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset2);
				close(pstmt2);
			}

		});


		return list;
	}

	public int deleteFleaMarket(Connection conn, String[] arr) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteFleaMarket");

		for(String fleaNo:arr) {

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(fleaNo));
				
				result += pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		
		return result;

	}
	
	

	/*윤희 구역--------------------------------------------------------------------------*/

	/* 대성쓰 
	 */
	
	public ArrayList<Question> selectQuestionList(Connection conn, PageInfo pi, int userNo) {

	      ArrayList<Question> list = new ArrayList<>();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectQuestionList");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	           int endRow = startRow + pi.getBoardLimit() -1;
	         
	           pstmt.setInt(1, userNo);
	           pstmt.setInt(2, startRow);
	           pstmt.setInt(3, endRow);
	           
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            
	            Question q = new Question(rset.getInt("Q_NO"),
	                                rset.getDate("Q_DATE"),
	                                rset.getString("Q_TITLE"),
	                                rset.getString("STATUS"));
	            
	            list.add(q);
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

	public int MemberMyPageInquiry(Connection conn, Question q) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("MyPageInquiry");
	
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(q.getqWriter())); // 1
			
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

	public int increaseCount(Connection conn, int questionNo) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, questionNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Question selectNoticeList(Connection conn, int questionNo) {
		
		Question q = null;

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQuestion");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, questionNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				q = new Question(rset.getInt("Q_NO"),
								 rset.getString("Q_TITLE"),
								 rset.getString("Q_CONTENT"),
								 rset.getDate("Q_DATE"),
								 rset.getString("Q_ANSWER"),
								 rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return q;
	}

	public int deleteQuestion(Connection conn, int questionNo) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQuestion");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, questionNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(conn);
		}
		
		
		return result;
	}

	   public ArrayList<Request> selectRequestList(Connection conn, PageInfo pi, int userNo) {
		      
		      ArrayList<Request> list = new ArrayList<>();
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      
		      String sql = prop.getProperty("selectRequestList");
		      
		      try {
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		           int endRow = startRow + pi.getBoardLimit() -1;
		         
		           pstmt.setInt(1, userNo);
		           pstmt.setInt(2, startRow);
		           pstmt.setInt(3, endRow);
		         
		         
		         
		         rset = pstmt.executeQuery();
		         
		         while(rset.next()) {
		            
		            Request r = new Request(rset.getInt("REQUEST_NO"),
		                              rset.getDate("REQUEST_DATE"),
		                               rset.getString("REQUEST_TITLE"),
		                               rset.getString("REQUEST_CONTENT"),
		                               rset.getString("STATUS"));
		            
		            list.add(r);
		            
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


	   public int selectListCount(Connection conn, int userNo) {
		    // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
		          // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
		          // 변수
		          int listCount = 0;
		       
		          
		          PreparedStatement pstmt = null;
		          ResultSet rset = null;
		          
		          String sql = prop.getProperty("RequestBookselectListCount");
		          
		          try {
		             pstmt = conn.prepareStatement(sql);
		             
		             pstmt.setInt(1, userNo);
		             
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


	   public int selectInquiryListCount(Connection conn, int userNo) {
	       // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
	        // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
	        // 변수
	        int listCount = 0;
	     
	        
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;

	        
	        String sql = prop.getProperty("RequestInquiryselectListCount");
	        
	        try {
	           pstmt = conn.prepareStatement(sql);
	           
	           pstmt.setInt(1, userNo);
	      
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


	public int selectFleaCount(Connection conn, int userNo) {
	    // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
        // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
        // 변수
        int listCount = 0;
     
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectFleaCount");
        
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, userNo);
      
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

	public int selectMyBookCount(Connection conn, int userNo) {
	    // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
        // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
        // 변수
        int listCount = 0;
     
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectMyBookCount");
        
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, userNo);
      
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

	public int selectReviewCount(Connection conn, int userNo) {
	    // SELECT -> ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수 ???
        // SELECT문을 쓰지만 상식적으로 반환되는 값이 정수가 필요함
        // 변수
        int listCount = 0;
     
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectReviewCount");
        
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, userNo);
      
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
