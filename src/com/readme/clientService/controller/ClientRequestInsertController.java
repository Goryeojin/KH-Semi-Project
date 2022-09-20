package com.readme.clientService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.clientService.model.service.ClientService;
import com.readme.clientService.model.vo.Request;

/**
 * Servlet implementation class ClientRequestInsertController
 */
@WebServlet("/insertRequest.cs")
public class ClientRequestInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientRequestInsertController() {
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
		
		Request r = new Request();
		
		r.setUserNo(userNo);
		r.setRequestTitle(title);
		r.setRequestContent(content);
		
		int result = new ClientService().insertRequest(r);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "도서 요청 성공! 마이페이지에서 확인하세요!");
			response.sendRedirect(request.getContextPath()+"/request.cs");
		} else {
			request.getSession().setAttribute("alertMsg", "도서 요청 실패!");
			response.sendRedirect(request.getContextPath()+"/request.cs");
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
