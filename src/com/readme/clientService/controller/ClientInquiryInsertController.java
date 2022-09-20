package com.readme.clientService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.clientService.model.service.ClientService;
import com.readme.clientService.model.vo.Question;

/**
 * Servlet implementation class ClientInquiryInsertController
 */
@WebServlet("/insertInquiry.cs")
public class ClientInquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientInquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Question q = new Question();
		
		q.setUserNo(userNo);
		q.setqTitle(title);
		q.setqContent(content);
		
		int result = new ClientService().insertInquiry(q);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의하기 성공! 마이페이지에서 확인하세요!");
			response.sendRedirect(request.getContextPath()+"/inquiry.cs");
		} else {
			request.getSession().setAttribute("alertMsg", "문의하기 실패!");
			response.sendRedirect(request.getContextPath()+"/inquiry.cs");
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
