package com.readme.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.readme.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminRequestOkController
 */
@WebServlet("/requestY.ad")
public class AdminRequestOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRequestOkController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int requestNo = Integer.parseInt(request.getParameter("requestNo"));
		
		int result = new AdminService().AdminRequestOk(requestNo);
		
		if(result>0) {	
			request.getSession().setAttribute("alertMsg", "성공하였습니다.");
			response.sendRedirect(request.getContextPath()+"/requestList.ad?currentPage=1");
			
		}else {
			request.getSession().setAttribute("alertMsg", "실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/requestList.ad?currentPage=1");
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
