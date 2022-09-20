package com.readme.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.readme.review.model.service.ReviewService;
import com.readme.review.model.vo.Review;

/**
 * Servlet implementation class FooterReviewCountController
 */
@WebServlet("/footer.re")
public class FooterReviewCountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FooterReviewCountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		int count = new ReviewService().reviewCount();
		
		// count : 총 평가가 몇개인지 담겨져 있는 데이터
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		
		
		
		
		new Gson().toJson(count, response.getWriter());
		// ajax 데이터를 반환!
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
