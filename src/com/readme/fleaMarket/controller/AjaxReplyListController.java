package com.readme.fleaMarket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.readme.fleaMarket.model.service.FleaMarketService;
import com.readme.fleaMarket.model.vo.Reply;

/**
 * Servlet implementation class AjaxReplyListController
 */
@WebServlet("/rlist.fl")
public class AjaxReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//  GET => 인코딩 X
		
		// 값 뽑기
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		// VO 가공
		
		// Service단으로 토스~ => 게시판 관련 기능
		ArrayList<Reply> list = new FleaMarketService().selectReply(fno);
		
		// 응답 !! 
		// GSON 이용해보자 !! => ArrayList를 자바스크립트의 배열 형태로 변환
		// 형식, 인코딩 지정
		response.setContentType("aplication/json; charset=UTF-8");
		
		 new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
