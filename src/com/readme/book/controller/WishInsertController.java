package com.readme.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.book.model.service.BookService;
import com.readme.book.model.vo.Wish;

/**
 * Servlet implementation class WishInsertController
 */
@WebServlet("/insertWish.bo")
public class WishInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new BookService().insertWish(bno, userNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "찜하기 완료!");
			response.sendRedirect(request.getContextPath() + "/detail.bo?bno="+bno);
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
