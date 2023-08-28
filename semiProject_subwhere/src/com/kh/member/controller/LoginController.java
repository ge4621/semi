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

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
        String memberPwd = request.getParameter("memberPwd");
        
        
        Member loginMember = new MemberService().loginMember(memberId, memberPwd);
        //-----------------------------------------------------------------------
        System.out.println(loginMember);
        
        
        
        if(loginMember == null) {
           // 조회 결과 없음 == 로그인 실패!! => 에러문구가 보여지는 에러페이지 응답
           request.setAttribute("errorMsg", "로그인 실패");
           
           // 응답페이지(jsp)에게 위임시 필요한 객체 => RequestDispathcer
           // 포워딩 방식
           RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
           view.forward(request, response);
        }else {
           
           HttpSession session = request.getSession();
           session.setAttribute("loginMember", loginMember);
           response.sendRedirect(request.getContextPath());
           System.out.println("성공");
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
