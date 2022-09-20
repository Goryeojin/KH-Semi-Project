package com.readme.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.readme.book.model.service.BookService;
import com.readme.book.model.vo.Book;

/**
 * Servlet implementation class MainBestSellerController
 */
@WebServlet("/mainBestSeller.bo")
public class MainBestSellerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainBestSellerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
				int bestRate = Integer.parseInt(request.getParameter("no"));
				
				// DB로부터 데이터를 조회했다는 가정하에 Member객체에 값을 담긴
				Book b = new BookService().mainBestSeller(bestRate);
				
		
				
				
				response.setContentType("application/json; charset=UTF-8");
				
				
				new Gson().toJson(b, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
