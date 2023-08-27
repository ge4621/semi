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
		
		String sql = prop.getProperty(null);
		
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
	

}
