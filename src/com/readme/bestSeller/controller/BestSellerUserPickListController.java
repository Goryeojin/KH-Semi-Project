package com.readme.bestSeller.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.bestSeller.model.service.BestSellerService;
import com.readme.bestSeller.model.vo.BestSeller;

/**
 * Servlet implementation class BestSellerUserPickList
 */
@WebServlet("/userPick.be")
public class BestSellerUserPickListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestSellerUserPickListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<BestSeller> list1 = new BestSellerService().selectBestSellerOriginalList();
		
		
		request.getSession().setAttribute("list1", list1);

//	    response.sendRedirect(request.getContextPath() + "/views/bestSeller/bestSellerUserPickView.jsp");
		 request.getRequestDispatcher("views/bestSeller/bestSellerUserPickView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
