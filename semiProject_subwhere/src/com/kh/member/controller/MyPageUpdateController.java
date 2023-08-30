package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamepolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPageUpdateController
 */
@WebServlet("/myupdate.me")
public class MyPageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				 request.setCharacterEncoding("UTF-8");
			      
			      
			      
			      if(ServletFileUpload.isMultipartContent(request)) {
			         
			         int maxSize = 10*1024*1024;
			         
			         String savePath = request.getSession().getServletContext().getRealPath("resources/profile_upfiles/");
			         
			         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamepolicy());
			        
			        String memberId = multiRequest.getParameter("memberId");
			        String nickname = multiRequest.getParameter("nickName");
					String email = multiRequest.getParameter("email");
					String phone = multiRequest.getParameter("phone");
			        String profileImg = multiRequest.getParameter("profileImg");
			        
			        String changeFileName = multiRequest.getFilesystemName("profileImg");
			        profileImg = savePath + changeFileName;
			        
					System.out.println(savePath+"dsaf"); //파일 확인용
					System.out.println(profileImg+"사진확인하자"); //파일 확인용
					
			         Member m = new Member();
			         
			         	m.setMemberId(memberId);
						m.setNickname(nickname);
						m.setEmail(email);
						m.setPhone(phone);
						m.setProfileImg(profileImg);
						
						
					
						
					if(multiRequest.getParameter(profileImg)!= null) {
						
						
						
						multiRequest.getOriginalFileName(profileImg);
						multiRequest.getOriginalFileName(profileImg);
						m.setProfileImg("resources/profile_upfiles");
						
						
					}
						
					System.out.println(savePath+"asd"); //파일 확인용
			
			      	int result = new MemberService().updateMember(m);
			         
			         if(result > 0) {
			            HttpSession session = request.getSession();
			            session.setAttribute("alertMsg", "성공적으로 정보변경이 되었습니다.");
			            response.sendRedirect(request.getContextPath()+"/mypageform.me");
			            
			         }else {
			            request.setAttribute("errorMsg", "정보변경에 실패했습니다");
			            RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			            view.forward(request, response);
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
