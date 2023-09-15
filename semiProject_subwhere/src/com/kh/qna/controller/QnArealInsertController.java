package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.qna.model.service.QnAService;

/**
 * Servlet implementation class QnArealInsertController
 */
@WebServlet("/insertsemi.qa")
public class QnArealInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnArealInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 인코딩 
		request.setCharacterEncoding("UTF-8");
		
			
		
		String faqTitle = request.getParameter("faqTitle");
	    String faqContent = request.getParameter("faqContent");
	    
	    
	    int result = new QnAService().insertQnA(faqTitle,faqContent);
	    
	    
	    response.setContentType("application/json; charset=utf-8");
	    new Gson().toJson(result, response.getWriter());
	    
	    
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
