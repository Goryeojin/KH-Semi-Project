package com.readme.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.book.model.service.BookService;
import com.readme.book.model.vo.Book;
import com.readme.book.model.vo.Wish;
import com.readme.member.model.vo.Member;
import com.readme.review.model.vo.Review;

/**
 * Servlet implementation class BookDetailController
 */
@WebServlet("/detail.bo")
public class BookDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1번째 패스
		
		// 2번째 
		
			int bookNo = Integer.parseInt(request.getParameter("bno")); // : String
			int userNo = 0;
			if(request.getSession().getAttribute("loginUser") != null) {
				userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			}
			
			Book b = new BookService().selectBook(bookNo);
			ArrayList<Review> reviewS = new BookService().selectReviewS(bookNo);
			Wish w = new BookService().selectCheckWish(bookNo, userNo);
			
			request.getSession().setAttribute("w", w);
			 request.getSession().setAttribute("b", b);
			 request.getSession().setAttribute("reviewS", reviewS);
	         
	         request.getRequestDispatcher("views/book/bookDetailView.jsp").forward(request, response);
//	         response.sendRedirect(request.getContextPath() + "/views/book/bookDetailView.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
