package com.readme.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminEditorInputController
 */
@WebServlet("/EditorY.ad")
public class AdminEditorInputController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditorInputController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		
		int result = new AdminService().AdminEditorInput(bookNo);
		
		
		if(result>0) {	
			request.getSession().setAttribute("alertMsg", "성공하였습니다.");
			response.sendRedirect(request.getContextPath()+"/editorList.ad?currentPage=1");
			
		}else {
			request.getSession().setAttribute("alertMsg", "실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/editorList.ad?currentPage=1");
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
