package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Course;
import com.kh.common.model.vo.Comments;
import com.kh.member.model.service.MemberService;

/**
 * 내가 쓴 코스 댓글 삭제
 * Servlet implementation class mypagecosrdeleteController
 */
@WebServlet("/cdelete.my")
public class mypagecosrdeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagecosrdeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//ArrayList<Course> list = new ArrayList<Course>();
		
		String[] commentsArr = request.getParameterValues("deletebox");
		
		String comments = "";
		if(commentsArr != null) {
			comments = String.join(",", commentsArr);
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
