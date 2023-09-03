package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.vo.Course;
import com.kh.board.model.vo.Review;
import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.Liked;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	//마이페이지 정보변경
	public Member updateMember(Member m) {
		//update문
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn,m);
		
		Member updateMem = null; //수정된 회원 정보를 담기 위한 과정??

		if(result > 0) { //수정 성공시
			commit(conn);
			
			//변경된 회원정보로 조회해오기
			updateMem = new MemberDao().selectMember(conn,m.getMemberId());
			
		}else {//수정 실패시
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	//회원 탈퇴
	public int deleteMember(String memberId,String memberPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn,memberId,memberPwd);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
	}
	
	//로그인
	public Member loginMember(String memberId, String memberPwd) {
         
         Connection conn = getConnection();
         Member loginMember = new MemberDao().loginMember(conn, memberId, memberPwd);

         //------------------------------------------------------------------
         
         close(conn);
         return loginMember;
         
      }   


	
	//비밀번호 변경
	public Member myupdatePwd(String memberId,String memberPwd,String updatePwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().myupdatePwd(conn,memberId,memberPwd,updatePwd);
		
		Member updateMem = null;
		if(result > 0) {//성공
			commit(conn);
			
			updateMem = new MemberDao().selectMember(conn,memberId);
		}else {//실패
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	//댓글 조회=> 여행 후기 게시판용
//	public ArrayList<Comments> selectRreviewList(int memberno) {
//		Connection conn = getConnection();
//		
//		ArrayList<Comments> list = new MemberDao().selectRreviewList(conn,memberno);
//		
//		System.out.println(list+"dfafadf");
//		
//		close(conn);
//		return list;
//	}
	
	 // ajax 아이디 중복 체크
	   public int idCheck(String checkId) {
	      
	      Connection conn = getConnection();
	      int count = new MemberDao().idCheck(conn, checkId);
	      
	      close(conn);
	      return count;
	            
	   }
	   
	//후기 게시글 댓글 총개수
	public int selectcReviewListCount(int memberno) {
		Connection conn = getConnection();
		
		int rlistCount = new MemberDao().selectcReviewListCount(conn,memberno);
		
		close(conn);
		return rlistCount;
		
	}
	
	//여행 후기 댓글 조회용 +페이징 바 포함
	public ArrayList<Comments> selectRreviewList(int memberno,PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Comments> list = new MemberDao().selectRreviewList(conn,memberno,pi);
		
		close(conn);
		return list;
	}
	
	
	   //회원가입
	   public int insertMember(Member m) {
		      
		      Connection conn = getConnection();
		      
		      int result = new MemberDao().insertMember(conn, m);
		      
		      close(conn);
		      
		      return result;
		      
		   }
		   
	   //코스 게시판 댓글
//	  public ArrayList<Comments> selectmyCreview(int memberNo){
//		  Connection conn = getConnection();
//		  
//		  ArrayList<Comments> clist = new MemberDao().selectmyCreview(conn,memberNo);
//		  
//		  close(conn);
//		  return clist;
//		  
//	  }
	   
	   //코스 게시판 댓글 총개수
	   public int selectCosListCount(int memberNo) {
		   Connection conn = getConnection();
		   
		   int clistCount = new MemberDao().selectCosListCount(conn,memberNo);
		   
		   close(conn);
		   return clistCount;
	   }
	   //코스게시판 댓글 조회+페이징
	   public ArrayList<Comments> selectmyCreview(int memberNo,PageInfo pi){
		   Connection conn = getConnection();
		   
		   ArrayList<Comments> clist = new MemberDao().selectmyCreview(conn,memberNo,pi);
		   
		   close(conn);
		   return clist;
	   }
	
	   //여행지 게시글 댓글 개수
	   public int selectDListCount(int memberno) {
		   Connection conn = getConnection();
		   
		   int dlistCount = new MemberDao().selectDListCount(conn,memberno);
		   
		   close(conn);
		   return dlistCount;
	   
	   
	}
	  //여행지 게시판 댓글
//	  public ArrayList<Comments> selectmyDreview(int memberno){
//		  Connection conn = getConnection();
//		  
//		  ArrayList<Comments> dlist = new MemberDao().selectmyDreview(conn, memberno);
//		  close(conn);
//		  return dlist;
//	  }
	   
	   //여행지 게시판 댓글조회 + 페이징
	   public ArrayList<Comments> selectmyDreview(int memberno,PageInfo pi){
		   Connection conn = getConnection();
		   
		   ArrayList<Comments> dlist = new MemberDao().selectmyDreview(conn,memberno,pi);
		   close(conn);
		   return dlist;
	   }
	   
	   
	   //내가 쓴 여행 코스 게시글 개수
	   public int selectCboardCount(int memberno) {
		   
		   Connection conn = getConnection();
		   
		   int listCount = new MemberDao().selectCboardCount(conn, memberno);
		   
		   close(conn);
		   return listCount;
		   
	   }

	  //마이페이지 내가 쓴 여행 코스 게시판
//	  public ArrayList<Course> selectbcosList(int memberno){
//		  Connection conn = getConnection();
//		  
//		  ArrayList<Course> blist = new MemberDao().selectbcosList(conn, memberno);
//		  
//		  close(conn);
//		  return blist;
//	  }
	   //마이페이지 내가 쓴 여행 코스 게시판
	  public ArrayList<Course> selectbcosList(PageInfo pi,int memberno){
		  
		  Connection conn = getConnection();
		  
		  ArrayList<Course> blist = new MemberDao().selectbcosList(conn,pi,memberno);
		  close(conn);
		  return blist;
		  
	  }
	   
	  //내가 쓴 후기글 개수
	  public int selectReBoardCount(int memberno) {
		  
		  Connection conn = getConnection();
		  
		  int klistCount = new MemberDao().selectReBoardCount(conn,memberno);
		  
		  close(conn);
		  return klistCount;
	  }
	  public ArrayList<Review> selectReview(PageInfo pi,int memberno){
		  Connection conn = getConnection();
		  
		  ArrayList<Review> list = new MemberDao().selectReview(conn,pi,memberno);
		  close(conn);
		  return list;
		  
	  }
	   
	   
	  
	  //마이페이지 내가쓴 후기글 게시판
//	  public ArrayList<Review> selectReview(int memberno){
//		  Connection conn = getConnection();
//		  
//		  ArrayList<Review> list = new MemberDao().selectReview(conn, memberno);
//		  
//		  close(conn);
//		  return list;
//	  }
	  //좋아요 보관함
	  public ArrayList<Liked> mylikelist(int memberno){
		  
		  Connection conn = getConnection();
		  ArrayList<Liked> list = new MemberDao().mylikelist(conn, memberno);
		  close(conn);
		  return list;
	  }
	  
	  
	 } 


	  

	  
	  
	
