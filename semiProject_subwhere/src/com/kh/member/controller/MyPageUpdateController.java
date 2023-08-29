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
		
			String resourePath ="/resources/profile_upfiles/";

			request.setCharacterEncoding("UTF-8");
			
			//String memberId = request.getParameter("memberId");
			
			String nickname = request.getParameter("nickname");
			
			//String memberPwd = request.getParameter("memberPwd");
			
			String email = request.getParameter("email");
			
			String phone = request.getParameter("phone");
			
			//String fileImg = request.getParameter("fileImg");
			String profileImg = null;
			
			if(ServletFileUpload.isMultipartContent(request)) {
				
				int maxSize = 10*1024*1024;
				
				 // 2_2. 저장시킬 폴더의 물리적인 경로
		         // application == request.getSession().getServletContext()
		         String savePath = request.getSession().getServletContext().getRealPath(resourePath); // '/'

				
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,"UTF-8",new MyFileRenamepolicy());
				
				nickname = multiRequest.getParameter("nickname");
				email = multiRequest.getParameter("email");
				phone = multiRequest.getParameter("phone");
				
				String changeFileName = multiRequest.getFilesystemName("profileImg"); // name 키값
		         profileImg = resourePath + changeFileName;
		         //           /resources/profile_upfiles/2023082717374710069.png
		        
		      }

				
				
				Member m = new Member();
				//m.setMemberId(memberId);
				m.setNickname(nickname);
				//m.setMemberPwd(memberPwd);
				m.setEmail(email);
				m.setPhone(phone);
				m.setProfileImg(profileImg);
				
				
				int result =  new MemberService().updateMember(m);
				
				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "정보변경 수정 완료");
					response.sendRedirect(request.getContextPath()+"/mypageform.me");
				}else {
					request.setAttribute("errorMsg", "정보변경에 실패했습니다.");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
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
