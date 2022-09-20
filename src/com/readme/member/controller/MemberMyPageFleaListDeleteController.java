package com.readme.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.member.model.service.MemberService;
import com.readme.member.model.vo.Member;


/**
 * Servlet implementation class MemberMyPageFleaListDeleteController
 */
@WebServlet("/fleaListDelete.me")
public class MemberMyPageFleaListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageFleaListDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] deleteNoArr = request.getParameterValues("fleaMarketList");
		
		int result = 0;
		
		if(deleteNoArr.length>0) {
			result = new MemberService().deleteFleaMarket(deleteNoArr);
		}

		response.sendRedirect(request.getContextPath()+"/fleaList.me?currentPage=1");
		
		
//		Member member = (Member)request.getSession().getAttribute("loginUser");
//		int userNo = member.getUserNo();
//		ArrayList list = new MemberService().findAllFleaMarket(userNo);
//		request.setAttribute("fleaMarketList", list);
//		
//		
//		request.setAttribute("msgResult", "중고장터 거래 "+result+"건을 삭제했습니다.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
