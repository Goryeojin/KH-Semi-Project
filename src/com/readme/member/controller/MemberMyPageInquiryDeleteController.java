package com.readme.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.member.model.service.MemberService;

/**
 * Servlet implementation class MemberMyPageInquiryDeleteController
 */
@WebServlet("/deleteinquiry.me")
public class MemberMyPageInquiryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageInquiryDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int questionNo = Integer.parseInt(request.getParameter("qno"));
		
		int result = new MemberService().deleteQuestion(questionNo);
		
		if(result > 0) { 
					
			request.getSession().setAttribute("alertMsg", "성삭완(성공적으로삭제가완료되었다는뜻");
			response.sendRedirect(request.getContextPath()+"/inquiryList.me?currentPage=1");

		    
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
