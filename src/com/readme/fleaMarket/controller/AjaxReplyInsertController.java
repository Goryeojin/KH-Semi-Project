package com.readme.fleaMarket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.fleaMarket.model.service.FleaMarketService;
import com.readme.fleaMarket.model.vo.Reply;
import com.readme.member.model.vo.Member;


/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/rinsert.fl")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		// request로 부터 값 뽑기
		String replyContent = request.getParameter("content");
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		// 로그인한 회원 정보
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		// VO로 가공 => Reply
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setRefFno(fno);
		r.setUserNo(userNo);
		
		// Service단 호출
		int result = new FleaMarketService().insertReply(r);
		
		// Gson, Json => 넘겨야할 값이 여러개일때 묶을 때
		
		// result 1개 그냥 넘기기
		
		
		response.setContentType("text/html; charset=UTF-8");
		
//		request.setAttribute("result", result);
//		response.sendRedirect(request.getContextPath()+"/detail.fl?fno"+fno);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
