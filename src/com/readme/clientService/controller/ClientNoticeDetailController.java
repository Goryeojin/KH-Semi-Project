package com.readme.clientService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.clientService.model.service.ClientService;
import com.readme.clientService.model.vo.Notice;

/**
 * Servlet implementation class ClientNoticeController
 */
@WebServlet("/notice.cs")
public class ClientNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		int result = new ClientService().increaseNoticeCount(nno);
		
		if(result > 0) {
			Notice n = new ClientService().selectNotice(nno);
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/clientService/clientNoticeDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "공지사항 조회에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath()+"/noticeList.cs");
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
