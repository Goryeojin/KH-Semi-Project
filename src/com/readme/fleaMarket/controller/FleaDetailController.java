package com.readme.fleaMarket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.fleaMarket.model.service.FleaMarketService;
import com.readme.fleaMarket.model.vo.Attachment;
import com.readme.fleaMarket.model.vo.FleaMarket;

/**
 * Servlet implementation class FleaDetailController
 */
@WebServlet("/detail.fl")
public class FleaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FleaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FleaMarket flea = new FleaMarketService().selectFleaMarket(fno);
		Attachment at = new FleaMarketService().selectAttachment(fno);
		
		request.setAttribute("flea", flea);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/fleaMarket/fleaDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
