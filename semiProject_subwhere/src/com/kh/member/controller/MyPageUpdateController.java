package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		int maxSize = 10*1024*1024; //10메가바이트 (용량 설정)
		
		//전달된 파일을 저장 시킬 서버의 물리적은 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,"UTF-8");
		
		int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
		String profileimg = multiRequest.getParameter("profileImg");
		String nickname = multiRequest.getParameter("nickname");
		String memberPwd = multiRequest.getParameter("memberPwd");
		String phone = multiRequest.getParameter("phone");
		String email = multiRequest.getParameter("email");
		
		Member m = new Member(profileimg,nickname,memberPwd,phone,email);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem != null) {//update성공시
			HttpSession session = request.getSession();
			
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			
			response.sendRedirect(request.getContextPath()+"/mypageform.me");
			
		}else {//update 실패시
			request.setAttribute("errorMsg", "정보변경에 실패했습니다.");
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
