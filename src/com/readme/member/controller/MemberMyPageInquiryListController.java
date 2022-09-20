package com.readme.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.readme.bestSeller.model.service.BestSellerService;
import com.readme.common.model.vo.PageInfo;
import com.readme.member.model.service.MemberService;
import com.readme.member.model.vo.Member;
import com.readme.member.model.vo.Question;

/**
 * Servlet implementation class MemberMyPageInquiryListController
 */
@WebServlet("/inquiryList.me")
public class MemberMyPageInquiryListController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageInquiryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
         int listCount; // 현재 일반게시판의 게시글 총 갯수=> BOARD테이블로부터 조회 COUNT(*)활용
         int currentPage; // 현재페이지(사용자가 요청한 페이지)
         int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 갯수=> 10개
         int boardLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 10개
         
         int maxPage; // 가장 마지막페이지가 몇번 페이지인지 (== 총페이지의 갯수)
         int startPage; // 페이지 하단에 보여질 첫번째 페이징바
         int endPage; // 페이지 하단에 보여질 마지막 페이징바
         
         
         Member m = (Member)request.getSession().getAttribute("loginUser");
          
         int userNo = m.getUserNo();
         
         // *listCount : 총 게시글 갯수
         listCount = new MemberService().selectInquiryListCount(userNo);
         
         
               
         // * currentPage : 현재페이지(== 사용자가 요청한 페이지)
         currentPage = Integer.parseInt(request.getParameter("currentPage")); // : String
               
         // * pageLimit : 페이징바의 최대 갯수
         pageLimit = 10;
               
         // * boardLimit : 한페이지에 보여질 게시글의 최대 갯수
         boardLimit = 5;
         
         maxPage = (int)Math.ceil((double)listCount / boardLimit);
         
         startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
         
         endPage = startPage + pageLimit - 1;
         
         if(endPage > maxPage) {
            endPage = maxPage;
         }
         
         PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
         


      
      ArrayList<Question> list = new MemberService().selectQuestionList(pi, userNo);
      
      // 5) 뽑아온 list를 어디에 담아서 응답페이지로 보내버리고 싶음
      request.setAttribute("list", list);
      
      
      request.getSession().setAttribute("pi", pi);
      
      request.getRequestDispatcher("views/member/myPageInquiryListView.jsp").forward(request, response);
      
      
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}