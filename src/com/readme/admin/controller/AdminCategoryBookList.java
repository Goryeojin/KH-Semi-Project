package com.readme.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.admin.model.service.AdminService;
import com.readme.admin.model.vo.BookMG;
import com.readme.admin.model.vo.CategoryAd;
import com.readme.admin.model.vo.PageInfo;

/**
 * Servlet implementation class AdminCategoryBookList
 */
@WebServlet("/categoryBookList.ad")
public class AdminCategoryBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryBookList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//post 방식
		request.setCharacterEncoding("UTF-8");
		
		//카테고리 보내주기
		ArrayList<CategoryAd> category = new AdminService().AdminCategory();
		//____________페이징
				//필요한 변수들
				int listCount; // 현재 요청게시판의 게시글 총 개수
				int currentPage; //현재 페이지(사용자가 요청한 페이지)
				int pageLimit; //페이지 하단에 보여질 페이징바 최대 개수
				int boardLimit;//한 페이지에 보여질 게시글 최대 개수 
				
				int maxPage;//가장 마지막 페이지가 몇 번 페이지인지(== 총페이지의 개수)
				int startPage;//페이지 하단에 보여질 첫번째 페이징바
				int endPage;//페이지 하단에 보여질 마지막 페이징바
				
				//값뽑기
				int bookCategoryNo = Integer.parseInt(request.getParameter("bookCategory"));//여기에 카테고리 정보가 담김(숫자로)
				
				
				//listCount : 총 게시글 개수
				 listCount = new AdminService().selectCategoryCount(bookCategoryNo);
				
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
				 //-------------------------------------

		
		//Service단으로..
		ArrayList<BookMG> list = new AdminService().AdminCategoryBookList(pi, bookCategoryNo);
		
		//응답뷰 지정
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("category", category);
		
		request.getRequestDispatcher("views/admin/adminCategoryBookList.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
