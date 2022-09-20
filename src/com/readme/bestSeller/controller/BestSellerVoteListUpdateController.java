package com.readme.bestSeller.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.readme.bestSeller.model.service.BestSellerService;
import com.readme.bestSeller.model.vo.BestSeller;

/**
 * Servlet implementation class BestSellerVoteListUpdateController
 */
@WebServlet("/userVoteUpdate.be")
public class BestSellerVoteListUpdateController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestSellerVoteListUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       
   
      // 값뽑기 
      
      int bookNo = Integer.parseInt(request.getParameter("bno"));
      // System.out.println(bookNo);
      
      // VO 가공 
      
      BestSeller bs = new BestSeller();   
      bs.setBookNo(bookNo);
      
      // 4) Service 단으로 토스
      
      int result = new BestSellerService().updateBestSellerVoteList(bs);
      
      
      // 5) 결과값에 따라 응답 지정
      
      if(result > 0) {
         
      
      int result2 = new BestSellerService().seBestSellerVoteList(bookNo);
         
      // request.getRequestDispatcher("views/bestSeller/bestSellerVoteView.jsp").forward(request, response);
      
      response.setContentType("application/json; charset=UTF-8");
        
   

      new Gson().toJson(result2, response.getWriter());

      
      
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