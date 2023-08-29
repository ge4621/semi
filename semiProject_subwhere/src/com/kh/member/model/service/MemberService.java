package com.kh.member.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public int updateMember(Member m) {
		//update문
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn,m);
		
		//Member updateMem = null; //수정된 회원 정보를 담기 위한 과정??
		
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
	
	public Member loginMember(String memberId, String memberPwd) {
		 Connection conn = getConnection();
	      Member m = new MemberDao().loginMember(conn, memberId, memberPwd);

	      close(conn);
	      return m;

	}
	
	public int selectcReviewListCount(int memberNo) {
		Connection conn = getConnection();
		
		int rlistCount = new MemberDao().selectcReviewListCount(conn,memberNo);
		
		close(conn);
		return rlistCount;
		
	}
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
	
	}