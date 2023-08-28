package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties(); //전역 선언으로 사용하기 편하게 함
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath)); //파일 불려오는 과정
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int updateMember(Connection conn,Member m) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, m.getProfileImg());
			pstmt.setString(2, m.getNickname());
			pstmt.setString(3, m.getMemberPwd());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member selectMember(Connection conn, String memberId) {
		//select문
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member m = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("member_no"),
								rset.getString("member_name"),
								rset.getString("member_id"),
								rset.getString("member_pwd"),
								rset.getString("phone"),
								rset.getString("email"),
								rset.getString("nickname"),
								rset.getString("status"),
								rset.getString("enroll_date"),
								rset.getString("profile_img"));
					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	public int deleteMember(Connection conn,String memberId,String memberPwd) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
	      // select문 => ResultSet객체 필요(한 행) = > Member 객체
	      
	            Member m = null;
	            
	            PreparedStatement pstmt = null;
	            ResultSet rset = null;
	            
	            try {
	               
	               String sql = prop.getProperty("loginMember");
	               
	               pstmt = conn.prepareStatement(sql); // 미완성된 쿼리
	               
	               pstmt.setString(1, memberId);
	               pstmt.setString(2, memberPwd);
	               
	               rset = pstmt.executeQuery();
	               // pstmt 쿼리를 돌려서 rset에 담아라
	               // 조회된 결과가 있다면 한 행 | 조회결과 없다고 하면 아무것도 안 담김
	               
	               if(rset.next()) {
	                  // new Member(~~) => 매개변수 생성자 생성
	                  // rset에는 db의 컬럼이 들어감 => get~ 가져올 때는 변수명이 아닌 컬럼명 그대로! 써야 함 => 오타나거나 없는 컬럼 쓰면 "부적절한 인덱스~" 오류 뜸
	                  m = new Member(rset.getInt("MEMBER_NO"),
	                              rset.getString("MEMBER_NAME"),
	                              rset.getString("MEMBER_ID"),
	                              rset.getString("MEMBER_PWD"),
	                              rset.getString("PHONE"), 
	                              rset.getString("EMAIL"), 
	                              rset.getString("NICKNAME"), 
	                              rset.getString("STATUS"), 
	                              rset.getString("ENROLL_DATE"),
	                              rset.getString("PROFILE_IMG"));
	               }
	               
	            } catch (SQLException e1) {
	               e1.printStackTrace();
	            } finally {
	               close(rset);
	               close(pstmt);
	            }
	            
	            return m;
	   }   
	

}
