package com.readme.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxEmailController
 */
@WebServlet("/emailCheck.me")
public class AjaxEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
				//GET
		
				//2)request로부터 값뽑기
				String email = request.getParameter("email");
				
				//3) Vo 가공 => 패스
				
				//4) Service단으로 토스 ~(MemberService)
				int count = new MemberService().emailCheck(email);
				
				if(count > 0) {
					//존재하는 이메일 있을 경우 -- 사용불가능
					response.getWriter().print("NNN");
					
				}else {
					//존재하는 이메일 없을 경우
					response.getWriter().print("YYY");
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
