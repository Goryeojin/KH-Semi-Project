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
 * Servlet implementation class AdminBookManagementList
 */
@WebServlet("/bookList.ad")
public class AdminBookManagementList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookManagementList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//카테고리 보내주기
		ArrayList<CategoryAd> category = new AdminService().AdminCategory();
		
		
		//쿼리스트링으로부터 요청!
		//--페이징처리--
		
		//필요한 변수들
		int listCount; // 현재 요청게시판의 게시글 총 개수
		int currentPage; //현재 페이지(사용자가 요청한 페이지)
		int pageLimit; //페이지 하단에 보여질 페이징바 최대 개수
		int boardLimit;//한 페이지에 보여질 게시글 최대 개수 
				
		int maxPage;//가장 마지막 페이지가 몇 번 페이지인지(== 총페이지의 개수)
		int startPage;//페이지 하단에 보여질 첫번째 페이징바
		int endPage;//페이지 하단에 보여질 마지막 페이징바
		
		//listCount : 총 게시글 개수
		listCount = new AdminService().selectBookListCount();
		
		//currentPage : 현재 페이지(== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//pageLimit
		pageLimit = 5;
		
		//boardLimit
		boardLimit = 5;
		
		//maxPage
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		//startPage
		startPage = (currentPage - 1)/pageLimit * pageLimit +1;
		
		//endPage
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//7개의 변수 할당~
		
		//3) 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<BookMG> list = new AdminService().AdminBookList(pi);
		
		//보내주기
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);

		
		request.getRequestDispatcher("views/admin/adminBookManagementView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
