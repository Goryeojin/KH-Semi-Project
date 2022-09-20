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
 * Servlet implementation class BestSellerOriginalListController
 */
@WebServlet("/original.be")
public class BestSellerOriginalListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestSellerOriginalListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ArrayList<BestSeller> list1 = new BestSellerService().selectBestSellerOriginalList();
		ArrayList<BestSeller> list2 = new BestSellerService().selectBestSellerEditorPickList();
 		
//		request.setAttribute("list", list);
		
		request.getSession().setAttribute("list1", list1);
		request.getSession().setAttribute("list2", list2);
		
		
		request.getRequestDispatcher("views/bestSeller/bestSellerOriginalView.jsp").forward(request, response);
//		response.sendRedirect(request.getContextPath() + "/views/bestSeller/bestSellerOriginalView.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
