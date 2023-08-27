package com.kh.member.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member updateMember(Member m) {
		Connection conn = null;
		
		int result = new MemberDao().updateMember(conn,m);
		
		Member updateMem = null; //수정된 회원 정보를 담기 위한 과정??
		
		if(result > 0) { //수정 성공시
			
			close(conn);
			
			//변경된 회원정보로 조회해오기
			updateMem = new MemberDao().selectMember(conn,m.getMemberId());
			
		}else {//수정 실패시
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	public int deleteMember(String memberId,String memberPwd) {
		Connection conn = null;
		int result = new MemberDao().deleteMember(conn,memberId,memberPwd);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
	}
	
}
