package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mypagereviewController
 */
@WebServlet("/myrlist.me")
public class mypagereviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagereviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher view = request.getRequestDispatcher("views/mypage/mypagereviewlist.jsp");
//		view.forward(request, response);
		
		//--페이징 처리 
		int listCount;//현재 총 게시글 개수
		int currentPage;//현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; //페이징 바 버튼이 한번에 보여질 개수
		int boardLimit;//한페이지에서 사용자가 볼 수 있는 최대 게시글 개수
		
		int maxPage;//가장 마지막 페이지(총 페이지 수)
		int startPage;//페이징바의 시작 수
		int endPage;//페이징 바의 끝수
		
		//총 게시글 수
		listCount = new MemberService
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
