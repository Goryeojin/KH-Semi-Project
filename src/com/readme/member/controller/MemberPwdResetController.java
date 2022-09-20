package com.readme.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.readme.member.model.service.MemberService;

/**
 * Servlet implementation class PwdResetController
 */
@WebServlet("/pwdReset.me")
public class MemberPwdResetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdResetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1)인코딩
		request.setCharacterEncoding("UTF-8");
		//2)값뽑기
		//아이디/비번 로 받아서 비밀번호를 바꿔주기
		
		//인증번호/비밀번호 받아서 비밀번호 바꿔주기
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		String pwdKey = request.getParameter("pwdKey");
	
		String userId = request.getParameter("userId");
		String changePwd1 = request.getParameter("changePwd1");
		
		
	        if(!AuthenticationKey.equals(pwdKey))
	        {
	            request.getSession().setAttribute("alertMsg", "인증번호가 일치하지 않습니다.");
	            request.getRequestDispatcher("/views/member/pwdResetForm.jsp").forward(request, response);
	            return;
	        }
		
		//3)VO가공 안함
		
		//Service단으로
		int result = new MemberService().pwdResetMember(userId, changePwd1);
		
		
		//보여줄 페이지 지정
		if(result > 0) {//성공
			request.getSession().setAttribute("alertMsg", "비밀번호 변경 성공");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");//로그인 페이지로 이동
			
		}else {
			request.getSession().setAttribute("alertMsg", "비밀번호 변경 실패");
			request.getRequestDispatcher("views/member/pwdResetForm.jsp").forward(request, response);//비밀번호 변경 페이지로
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
