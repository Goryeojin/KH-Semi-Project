package com.readme.fleaMarket.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class FleaUpdateController
 */
@WebServlet("/update.fl")
public class FleaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FleaUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1) POST => 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값뽑기 => 파일이 전송될 것인가 <<< 파악하고 난 뒤에
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일 내려받기 => 2가지 설정
			// 1. 전송파일 용량 제한 int maxSize = 10Mbyte
			int maxSize = 1024 * 1024 * 10;
			
			// 2. 전달될 파일 저장시킬 서버폴더의 물리적인 경로 알아내기 String savePath
			String savePath = request.getSession().getServletContext().getRealPath("/resources/flea_upfiles/");
			
			// 전달될 파일명 수정 후 서버에 업로드
			// MultipartRequest 객체를 생성함으로써 서버에 파일이 잘 저장됨
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// Update board
			
			// 2) 값 뽑기 request => multiRequest
			
			int fno = Integer.parseInt(multiRequest.getParameter("fno"));
			String title = multiRequest.getParameter("title");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String content = multiRequest.getParameter("content");
			int type = Integer.parseInt(multiRequest.getParameter("type"));
			
			// 3) VO 가공 - board 관련
			FleaMarket flea = new FleaMarket();
			flea.setFleaNo(fno);
			flea.setFleaTitle(title);
			flea.setPrice(price);
			flea.setFleaContent(content);
			flea.setFleaType(type);
			
			// Attachment와 관련딘 것도 처리하고 토스
			// Attachment 객체 선언만(null)
			// 실제 첨부파일이 있다면 => 객체 생성
			// 없다면 => null
			Attachment at = null;

			// 새로운 첨부파일명을 리턴해주는 메소드를 이용해서 첨부파일이 있는지 확인
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				
				// 새로운 파일명이 존재한다면 객체 생성 후 원본이름, 수정이름, 파일경로
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("/resources/flea_upfiles/");
				// => 여기까지는 새롭게 업로드한 새로운 첨부파일에 대한 내용 (SET절)
				
				// 첨부파일이 있었을 경우 + 원본파일도 있을 경우
				// 원본 파일의 파일번호, 수정명 필요
				if(multiRequest.getParameter("originFileName") != null) {
					
					// 기존 파일이 있었다면
					// 기존 파일에 대한 파일번호를 at에 담을 것 (WHERE절)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존에 서버에 존재하면 첨부파일 삭제
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
				} else {
					// 새로운 첨부파일이 넘어왔지만 기존 파일이 없는 경우 => INSERT
					// + 어느 게시글의 첨부파일인지 boardNo (REF_BNO컬럼)
					
					at.setRefFno(fno);
				}
			}
			
			// 4) Service단으로 토스
			
			// Service단 작성 전 경우의 수 정리
			// case 1 : 새로운 첨부파일 X => b, null => BOARD UPDATE
			// case 2 : 새로운 첨부파일 O, 기존 첨부파일 O => BOARD UPDATE, ATTACHMENT UPDATE
			// case 3 : 새로운 첨부파일 O, 기존 첨부파일 X => BOARD UPDATE, ATTACHMENT INSERT
			// 경우를 모두 따져서 트랜잭션 처리
			
			int result = new FleaMarketService().updateFleaMarket(flea, at);
			
			
			// 5) 결과에 따른 응답 뷰 지정
			if(result > 0) { // 성공 => 상세보기 페이지 이동
				// localhost:8001/jsp/detail.bo?bno=X => sendRedirect방식
				// alertMsg 성공메세지 보내고 난 후에
				request.getSession().setAttribute("alertMsg", "중고장터 수정하기를 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.fl?fno=" + fno);
			} else { // 실패 => 에러페이지 보여주기
				request.getSession().setAttribute("alertMsg", "중고장터 수정하기를 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.fl?fno=" + fno);
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
