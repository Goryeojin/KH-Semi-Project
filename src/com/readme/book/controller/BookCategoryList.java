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
import com.readme.member.model.vo.Member;

/**
 * Servlet implementation class BookCategory10List
 */
@WebServlet("/listCategory.bo")
public class BookCategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCategoryList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int gnereNo = Integer.parseInt(request.getParameter("gno")); // : String
		
		
		ArrayList<Book> categoryList = new BookService().selectCategory(gnereNo);
	        
		request.getSession().setAttribute("categoryList", categoryList);
         
		 request.getRequestDispatcher("views/book/bookCategoryListView.jsp").forward(request, response); //디스패쳐 있을때는 ajax 데이터 반환이 가능 하지만 이미지가 안뜸 
         //response.sendRedirect(request.getContextPath() + "/views/book/bookCategoryListView.jsp"); // 리 다이렉트일땐 이미지가 뜨지만 ajax가 안먹힘
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
