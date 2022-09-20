package com.readme.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.readme.member.model.service.MemberService;

/**
 * Servlet implementation class IdSearchController
 */
@WebServlet("/idSearch.me")
public class MemberIdSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1) POST 방식 : 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//2) request로부터 요청시 전달한 값 뽑기
		String email = request.getParameter("email");
		
		//3) VO객체
		//4) 서비스단으로
		String userId = new MemberService().idSearchMember(email);
		
		//5)결과에 따른 응답뷰 지정해주기
		if(userId == null) {
			//실패 
			userId = "NN";
			request.setAttribute("userId", "NN");
			//request.getSession().setAttribute("alertMsg", "이메일주소를 다시한번 확인해주세요");
			request.getRequestDispatcher("views/member/idSearchForm.jsp").forward(request, response);
		}else {
			//성공 페이지로
			request.setAttribute("userId", userId);
			
			request.getRequestDispatcher("views/member/idSearchSuccess.jsp").forward(request, response);
			
			
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
