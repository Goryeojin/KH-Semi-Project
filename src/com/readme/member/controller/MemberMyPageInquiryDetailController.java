package com.readme.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.member.model.service.MemberService;
import com.readme.member.model.vo.Question;

/**
 * Servlet implementation class MemberMyPageInquiryDetailController
 */
@WebServlet("/detail.me")
public class MemberMyPageInquiryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageInquiryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int questionNo = Integer.parseInt(request.getParameter("qno"));
		
		
		// 3) 가공 패싱
		
	
		
		// 4) Service단으로 전달 (UPDATE가 성공했다면 상세조회 요청)
		
			
			Question q = new MemberService().selectQuestion(questionNo);
			
			
			
			
			request.setAttribute("q", q);
			
			if(q != null) {
			
			request.getRequestDispatcher("views/member/myPageInquiryDetailView.jsp").forward(request, response);
			} else { // 실패 => errorPage로 보내보리보리보리기
				 
				request.getSession().setAttribute("alertMsg", "아직 답변이 완료되지 않았습니다 ㅠㅠ");
				 
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
