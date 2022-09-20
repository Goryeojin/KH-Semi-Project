package com.readme.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.review.model.service.ReviewService;
import com.readme.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/update.re")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String title = request.getParameter("reviewTitle");
		int scope = Integer.parseInt(request.getParameter("scope"));
		String content = request.getParameter("reviewContent");
		
		Review re = new Review();
		
		re.setReviewNo(rno);
		re.setUserNo(userNo);
		re.setReviewTitle(title);
		re.setReviewScope(scope);
		re.setReviewContent(content);
		
		int result = new ReviewService().updateReview(re);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/list.re?bno="+bno+"&&currentPage=1");
		} else {
			request.getSession().setAttribute("alertMag", "리뷰 수정 실패!");
			response.sendRedirect(request.getContextPath()+"/list.re?bno="+bno+"&&currentPage=1");
			
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
