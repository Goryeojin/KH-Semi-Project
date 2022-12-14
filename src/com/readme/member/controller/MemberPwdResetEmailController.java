package com.readme.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.Session;


import com.readme.member.model.service.MemberService;

/**
 * Servlet implementation class MemberPwdResetEmailController
 */
@WebServlet("/pwdResetEmail.me")
public class MemberPwdResetEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdResetEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 request.setCharacterEncoding("UTF-8");
		 
		 String userId = request.getParameter("userId");
	     String email = request.getParameter("email");
	        
	        //먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
	         String result = new MemberService().memberLogin(userId);//userId주고 받아온 email이 result
	         
	        if(!result.equals(email)){//DB에 있는 email과 input태그로 방금 받아온 email이랑 비교 
	           request.getSession().setAttribute("alertMsg", "아이디나 이메일 정보가 맞지 않습니다");
	           request.getRequestDispatcher("/views/member/pwdResetForm.jsp").forward(request, response);

	           return;
	        }
	        
	                //mail server 설정
	                String host = "smtp.gmail.com";
	                String user = "etoile13y@gmail.com"; //자신의 네이버 계정
	                String password = "Dmsql1027!";//자신의 네이버 패스워드
	                
	                //메일 받을 주소
	                String to_email = result;
	                
	                //SMTP 서버 정보를 설정한다.
	                Properties props = new Properties();
	             
	                props.put("mail.smtp.host", host);
	                props.put("mail.smtp.port", 465);
	                props.put("mail.smtp.auth", "true");
	                props.put("mail.smtp.ssl.enable", "true");
	                props.put("mail.smtp.ssl.trust", host);
	                
	                //인증 번호 생성기
	                StringBuffer temp =new StringBuffer();
	                Random rnd = new Random();
	                for(int i=0;i<10;i++)
	                {
	                    int rIndex = rnd.nextInt(3);
	                    switch (rIndex) {
	                    case 0:
	                        // a-z
	                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
	                        break;
	                    case 1:
	                        // A-Z
	                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
	                        break;
	                    case 2:
	                        // 0-9
	                        temp.append((rnd.nextInt(10)));
	                        break;
	                    }
	                }
	                String AuthenticationKey = temp.toString();
	                
	                
	                
	                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication(user,password);
	                    }
	                });
	                
	                //email 전송
	                try {
	                    MimeMessage msg = new MimeMessage(session);
	                    msg.setFrom(new InternetAddress(user));//보낸이(아이디/유저이름)
	                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));//수신자 이메일 주소
	                    
	                    //메일 제목
	                    msg.setSubject("안녕하세요 README 인증 메일입니다.");
	                    //메일 내용
	                    msg.setText("인증 번호는 : "+ temp);
	                    
	                    Transport.send(msg);//전송
	                    
	                }catch (AddressException e) {
	                	// TODO Auto-generated catch block 
	                	e.printStackTrace(); }
	                	 catch (MessagingException e) 
	                	{ // TODO Auto-generated catch block
	                	 e.printStackTrace();
	                }
	                HttpSession saveKey = request.getSession();
	                saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
	                //여기서 보낸 인증키 넘겨줌(pwdResetUpdate에서 입력한 값과 AuthenticationKey를 비교해줘야하니까 보내줌)
	               
	                //패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
	                request.setAttribute("userId", userId);
	                request.setAttribute("email", email);
	                request.getRequestDispatcher("/views/member/pwdResetUpdate.jsp").forward(request, response);
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
