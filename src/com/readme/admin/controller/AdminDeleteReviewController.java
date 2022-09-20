package com.readme.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminDeleteReviewController
 */
@WebServlet("/deleteReview.ad")
public class AdminDeleteReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 request.setCharacterEncoding("UTF-8");
	      
	      String[] checkArr = request.getParameterValues("reviewCheck");
	      
	      
	        ArrayList<Integer> checkNumbers = new ArrayList<Integer>();
	        
	        for(int i = 0; i < checkArr.length; i++) { 
	           Integer.parseInt(checkArr[i]);
	           checkNumbers.add(Integer.parseInt(checkArr[i])); 
	        }
	        

	        int result = new AdminService().deleteReview(checkNumbers);
	   
//	      한명만 삭제하기는 이렇게 할 수 있다
//	      int userNo = 0;
//	      for(int i = 0; i < checkArr.length; i++) {
//	         userNo = Integer.parseInt(checkArr[i]);
//	      }
//	      
//	      System.out.println(userNo);
//	      
//	      int result = new AdminService().deleteUser(userNo);
	      
	      if(result > 0) {
	         request.getSession().setAttribute("alertMsg", "리뷰 삭제 성공");
	         response.sendRedirect(request.getContextPath() + "/userBoardReview.ad?currentPage=1");
	      } else {
	         request.getSession().setAttribute("alertMsg", "삭제할 수 없습니다.");
	         response.sendRedirect(request.getContextPath() + "/userBoardReview.ad?currentPage=1");
	      } 
		
		//개천재 미라 짱짱 미쳤다 와...........
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
