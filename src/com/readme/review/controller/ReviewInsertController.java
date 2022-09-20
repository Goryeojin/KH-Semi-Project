package com.readme.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.book.model.service.BookService;
import com.readme.member.model.service.MemberService;
import com.readme.review.model.service.ReviewService;
import com.readme.review.model.vo.Review;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.re")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String title = request.getParameter("reviewTitle");
		String content = request.getParameter("reviewContent");
		int scope = Integer.parseInt(request.getParameter("scope"));
		
		Review re = new Review();
		
		re.setBookNo(bno);
		re.setReviewTitle(title);
		re.setUserNo(userNo);
		re.setReviewContent(content);
		re.setReviewScope(scope);
		
		int result1 = new ReviewService().insertReview(re);
		int result2 = new BookService().increaseReviewCount(bno);
		int result3 = new MemberService().increaseReviewCount(userNo);
		
		
		if(result1 * result2 * result3 > 0) {
			request.getSession().setAttribute("alertMsg", "리뷰 등록 성공");
			response.sendRedirect(request.getContextPath() + "/list.re?bno="+bno+"&&currentPage=1");
		} else {
			request.getSession().setAttribute("alertMsg", "리뷰 등록 실패");
			response.sendRedirect(request.getContextPath() + "/list.re?bno="+bno+"&&currentPage=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
