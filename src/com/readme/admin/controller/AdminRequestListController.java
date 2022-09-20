package com.readme.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.admin.model.vo.PageInfo;
import com.readme.admin.model.vo.Request;
import com.readme.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminRequestListController
 */
@WebServlet("/requestList.ad")
public class AdminRequestListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRequestListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//쿼리스트링으로 요청/jsp/requesList.ad
		
		//2)request로부터 값 뽑기
		//-- 페이징처리 --
		
		//필요한 변수들
		int listCount; // 현재 요청게시판의 게시글 총 개수
		int currentPage; //현재 페이지(사용자가 요청한 페이지)
		int pageLimit; //페이지 하단에 보여질 페이징바 최대 개수
		int boardLimit;//한 페이지에 보여질 게시글 최대 개수 
		
		int maxPage;//가장 마지막 페이지가 몇 번 페이지인지(== 총페이지의 개수)
		int startPage;//페이지 하단에 보여질 첫번째 페이징바
		int endPage;//페이지 하단에 보여질 마지막 페이징바
		
		//listCount : 총 게시글 개수
		 listCount = new AdminService().selectRequestListCount();
		
		 //currentPage : 현재 페이지(== 사용자가 요청한 페이지)
		 currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
		//pageLimit : 페이징바의 최대 개수
		 pageLimit = 5;
		 
		 //boardLimit : 한 페이지에 보여질 게시글의 최대 개수
		 boardLimit = 5;
		 
		 maxPage = (int)Math.ceil((double)listCount/boardLimit);
		 startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		 endPage = startPage + pageLimit - 1;
		 
		 if(endPage > maxPage) {
			 endPage = maxPage;
		 }
		 //총 7개 변수 할당
		 //7의 변수를 가지고 해당되는 범위에 따른 게시글 5개씩만 SELECT
		 //Service단으로 토스 => 7개의 변수
		 
		 //3)vo로 가공
		 PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		 
		 //4)Service단으로 토스
		 ArrayList<Request> list = new AdminService().AdminRequestSelectList(pi);
		 
		 /* status=n 인 애들 count*/
		 int Ncount = new AdminService().selectRequestNCount();
		 
		 //5)응답뷰 지정 -> list랑 pi넘김
		 request.setAttribute("Ncount", Ncount);
		 request.setAttribute("list", list);
		 request.setAttribute("pi", pi);
		 
		 
		//가지고 가자~
		request.getRequestDispatcher("views/admin/adminRequestView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}