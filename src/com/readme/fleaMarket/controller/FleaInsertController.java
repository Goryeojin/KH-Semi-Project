package com.readme.fleaMarket.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.readme.common.MyFileRenamePolicy;
import com.readme.fleaMarket.model.service.FleaMarketService;
import com.readme.fleaMarket.model.vo.Attachment;
import com.readme.fleaMarket.model.vo.FleaMarket;

/**
 * Servlet implementation class FleaInsertController
 */
@WebServlet("/insert.fl")
public class FleaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FleaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기전! multipart/form-data => 조건 먼저 제시
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// MultipartRequest 객체 생성 => 곧바로 서버에 파일이 올라옴
			// 객체 생성 전
			// 1_1. 전송 용량 제한(10Mbyte)
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2. 저장할 서버의 물리적 경로 제시
			String savePath = request.getSession().getServletContext().getRealPath("/resources/flea_upfiles/");
			
			// 2. MultipartRequest 객체 생성(**파일명 수정해서 올리기)
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2) multiRequest 객체로부터 값 뽑기 => getParameter 메소드 이용
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String title = multiRequest.getParameter("title");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String content = multiRequest.getParameter("content");
			int type = Integer.parseInt(multiRequest.getParameter("type"));
			
			// 3) VO 가공
			FleaMarket flea = new FleaMarket();
			flea.setUserNo(userNo);
			flea.setFleaTitle(title);
			flea.setPrice(price);
			flea.setFleaContent(content);
			flea.setFleaType(type);
			
			// 원본파일명이 존재하는지 메소드를 이용해서 파악 => 조건
				
			// 키값만 미리 변수로 셋팅
			String key = "file";
			
			Attachment at = new Attachment();
			
			if(multiRequest.getOriginalFileName(key) != null) { // 원본파일이 존재할 경우
				
				// 첨부파일이 존재할 경우 Attachment 객체 생성
				// 필드 : 원본명, 수정명, 폴더경로
				at.setOriginName(multiRequest.getOriginalFileName(key)); // 원본명
				at.setChangeName(multiRequest.getFilesystemName(key)); // 수정명
				at.setFilePath("/resources/flea_upfiles/"); // 파일 경로
			}
			
			
			// 4) Service단으로 토스
			int result = new FleaMarketService().insertFleaMarket(flea, at);
			
			// 5) 결과에 따른 응답뷰 지정
			if(result > 0) { // 성공 => list.th로 요청
				request.getSession().setAttribute("alertMsg", "업로드에 성공하였습니다.");
				if(type == 1) {
					response.sendRedirect(request.getContextPath()+"/sellBook.fl?currentPage=1");
				} else {
					response.sendRedirect(request.getContextPath()+"/buyBook.fl?currentPage=1");
				}
			} else {
				if(at != null) {
					// delete 메소드 호출
					new File(savePath, at.getChangeName()).delete();
				}
				request.getSession().setAttribute("alertMsg", "업로드에 실패하였습니다.");
				if(type == 1) {
					response.sendRedirect(request.getContextPath()+"/sellBook.fl?currentPage=1");
				} else {
					response.sendRedirect(request.getContextPath()+"/buyBook.fl?currentPage=1");
				}
				
			}
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
