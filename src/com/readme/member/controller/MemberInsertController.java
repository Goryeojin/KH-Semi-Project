package com.readme.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.member.model.service.MemberService;
import com.readme.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식 
		request.setCharacterEncoding("UTF-8");
		
		// 값뽑기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String[] clauseArr = request.getParameterValues("clause");
		
		String event = "";
		String info = "";
		
		if(clauseArr == null) {
			event = "N";
			info = "N";
		} else {
			for(int i=0; i<clauseArr.length; i++) {
				if(clauseArr[i].equals("eventAgreement")) {
					event = "Y";
				} else {
					info = "Y";
				}
			}
		}
		
		// VO로 가공
		Member m = new Member(userId, userPwd, userName, email, gender, birth, event, info);
		
		// Service단으로 토스~
		int result = new MemberService().insertMember(m);
		
		// 응답뷰 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "리드미 회원이 되신 걸 환영합니다~");
			request.setAttribute("m", m);
			RequestDispatcher view = request.getRequestDispatcher("views/member/enrollSuccess.jsp");
			view.forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "회원가입 실패~~ 4조의 운명은..?");
			response.sendRedirect(request.getContextPath());
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
