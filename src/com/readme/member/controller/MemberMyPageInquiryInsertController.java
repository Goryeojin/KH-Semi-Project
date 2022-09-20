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
 * Servlet implementation class MemberMyPageInquiryInsertController
 */
@WebServlet("/inquiry.me")
public class MemberMyPageInquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageInquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("UTF-8");
	
		String userNo = request.getParameter("userNo");
	
		String qTitle = request.getParameter("qTitle");
		
		String qContent = request.getParameter("qContent");
		
		Question q = new Question();
		q.setqWriter(userNo);
		q.setqTitle(qTitle);
		q.setqContent(qContent);
		
		int result = new MemberService().MemberMyPageInquiry(q);
		
	      // 5) 결과에따른 응답페이지를 지정
	      if(result > 0) { 
	    	  request.getSession().setAttribute("alertMsg", "성문등(성공적으로문의사항이등록되었다뜻)");
	    	  // request.getRequestDispatcher("views/member/myPageInquiryForm.jsp").forward(request, response);
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
