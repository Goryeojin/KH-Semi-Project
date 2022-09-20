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
 * Servlet implementation class BestSellerEditorPickList
 */
@WebServlet("/editorPick.be")
public class BestSellerEditorPickListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestSellerEditorPickListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<BestSeller> list2 = new BestSellerService().selectBestSellerEditorPickList();
		
		
		request.getSession().setAttribute("list2", list2);
		
		
//		 response.sendRedirect(request.getContextPath() + "/views/bestSeller/bestSellerEditorPickView.jsp");
		request.getRequestDispatcher("views/bestSeller/bestSellerEditorPickView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
