package com.readme.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.event.model.service.EventService;

/**
 * Servlet implementation class EventAttendanceGoController
 */
@WebServlet("/goAttent.ev")
public class EventAttendanceGoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventAttendanceGoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new EventService().updateAttDate(userNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "출석체크 포인트 500 지급!");
			response.sendRedirect(request.getContextPath()+"/attend.ev");
		} else {
			request.getSession().setAttribute("alertMsg", "이미 출석하셨습니다.");
			response.sendRedirect(request.getContextPath()+"/attend.ev");
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
