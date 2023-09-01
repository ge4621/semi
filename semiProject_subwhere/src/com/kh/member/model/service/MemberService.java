package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Comments;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	//마이페이지 정보변경
	public int updateMember(Member m) {
		//update문
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn,m);
		
		//Member updateMem = null; //수정된 회원 정보를 담기 위한 과정??
		
		System.out.println(result + "dsfsdf");
		System.out.println(m.getProfileImg()+"dskjl");
		
		if(result > 0) { //수정 성공시
			commit(conn);
			
			//변경된 회원정보로 조회해오기
			//updateMem = new MemberDao().selectMember(conn,m.getMemberId());
			
		}else {//수정 실패시
			rollback(conn);
		}
		close(conn);
		return result;
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


	
	
	public int selectcReviewListCount(int memberNo) {
		Connection conn = getConnection();
		
		int rlistCount = new MemberDao().selectcReviewListCount(conn,memberNo);
		
		close(conn);
		return rlistCount;
		
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
	public ArrayList<Comments> selectRreviewList(int memberno) {
		Connection conn = getConnection();
		
		ArrayList<Comments> list = new MemberDao().selectRreviewList(conn,memberno);
		
		System.out.println(list+"dfafadf");
		
		close(conn);
		return list;
	}
	 // ajax 아이디 중복 체크
	   public int idCheck(String checkId) {
	      
	      Connection conn = getConnection();
	      int count = new MemberDao().idCheck(conn, checkId);
	      
	      close(conn);
	      return count;
	            
	   }
	   
	   //회원가입
	   public int insertMember(Member m) {
		      
		      Connection conn = getConnection();
		      
		      int result = new MemberDao().insertMember(conn, m);
		      
		      close(conn);
		      
		      return result;
		      
		   }
		   
	   //코스 게시판 댓글
	  public ArrayList<Comments> selectmyCreview(int memberNo){
		  Connection conn = getConnection();
		  
		  ArrayList<Comments> clist = new MemberDao().selectmyCreview(conn,memberNo);
		  
		  close(conn);
		  return clist;
		  
	  }
	  //여행지 게시판 댓글
	  public ArrayList<Comments> selectmyDreview(int memberno){
		  Connection conn = getConnection();
		  
		  ArrayList<Comments> dlist = new MemberDao().selectmyDreview(conn, memberno);
		  close(conn);
		  return dlist;
	  }
	  
	 } 


	  
//	  public ArrayList<Comments> selectbcosList(int memberno) {
//		  Connection conn = getConnection();
//		  
//		  ArrayList<Comments> blist = new MemberDao().selectbcosList(conn, memberno);
//		  
//		  close(conn);
//		  return blist;
//	  }

	  
	  
	
