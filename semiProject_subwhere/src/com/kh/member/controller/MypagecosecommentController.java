package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Comments;
import com.kh.member.model.service.MemberService;

/**
 * 마이페이지 코스 게시판 댓글
 * Servlet implementation class MypagecosecommentController
 */
@WebServlet("/mycosreview")
public class MypagecosecommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagecosecommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int memberNo = Integer.parseInt(request.getParameter("Cno"));
		
		ArrayList<Comments> clist = new MemberService().selectmyCreview(memberNo);
		
		request.setAttribute("clist",clist);
		
		request.getRequestDispatcher("views/mypage/mypagecosreviewList.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
