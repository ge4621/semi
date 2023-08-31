package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Comments;
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
		
		System.out.println(m.getMemberId() + "####");
		System.out.println(m.getProfileImg()+"가나다");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, m.getProfileImg());
			pstmt.setString(2, m.getNickname());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result + "adfdsf");
		System.out.println(m.getProfileImg()+" adfadf");
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
								rset.getDate("enroll_date"),
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
	
	 /**
     * 로그인
     * @param conn
     * @param memberId
     * @param memberPwd
     * @return
     */
    public Member loginMember(Connection conn, String memberId, String memberPwd) {
       // select문 => ResultSet객체 필요(한 행) = > Member 객체
       
             Member loginMember = null;
             
             PreparedStatement pstmt = null;
             ResultSet rset = null;
             
             try {
                
                String sql = prop.getProperty("loginMember");
                
                pstmt = conn.prepareStatement(sql); // 미완성된 쿼리
                
                pstmt.setString(1, memberId);
                pstmt.setString(2, memberPwd);
                
                rset = pstmt.executeQuery();
                // 조회된 결과가 있다면 한 행 | 조회결과 없다고 하면 아무것도 안 담김
                
                if(rset.next()) {
                   // rset에는 db의 컬럼이 들어감 => get~ 가져올 때는 변수명이 아닌 컬럼명 그대로! 써야 함 => 오타나거나 없는 컬럼 쓰면 "부적절한 인덱스~" 오류 뜸
                   loginMember = new Member(rset.getInt("MEMBER_NO"),
                                       rset.getString("MEMBER_NAME"),
                                       rset.getString("MEMBER_ID"),
                                       rset.getString("MEMBER_PWD"),
                                       rset.getString("PHONE"), 
                                       rset.getString("EMAIL"), 
                                       rset.getString("NICKNAME"), 
                                       rset.getString("STATUS"), 
                                       rset.getDate("ENROLL_DATE"),
                                       rset.getString("PROFILE_IMG"));
                      }
                
             } catch (SQLException e1) {
                e1.printStackTrace();
             } finally {
                close(rset);
                close(pstmt);
             }
             
             return loginMember;
    }

	  
	

	public int selectcReviewListCount(Connection conn, int memberNo) {
		int rlistCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectrreviewListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,memberNo );
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rlistCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rlistCount;
	}
	
	public int myupdatePwd(Connection conn,String memberId,String memberPwd,String updatePwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, memberId);
			pstmt.setString(3, memberPwd);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	public ArrayList<Comments> selectRreviewList(Connection conn,String memberno) {
		ArrayList<Comments> list = new ArrayList<Comments>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRlist");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, memberno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Comments(rset.getInt("comment_no"),
										rset.getString("member_no"),
										rset.getString("title"),
										rset.getString("contnet"),
										rset.getString("modify_date"),
										rset.getString("status")
										));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	//수진언니
	// ajax 아이디 중복 체크
	   public int idCheck(Connection conn, String checkId) {
	      // select문 => ResultSet => 한개 숫자 => int
	      
	      int count = 0;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("idCheck");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, checkId);
	         
	         rset = pstmt.executeQuery();
	         if(rset.next()) {
	            count = rset.getInt("count"); // count(*)을 별칭 count로 줌
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return count;
	   }
	   
	   
	   public int insertMember(Connection conn, Member m) {
	      //insert
	      int result = 0;
	      PreparedStatement pstmt = null;
	      
	      String sql = prop.getProperty("insertMember");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, m.getMemberName());
	         pstmt.setString(2, m.getMemberId());
	         pstmt.setString(3, m.getMemberPwd());
	         pstmt.setString(4, m.getPhone());
	         pstmt.setString(5, m.getEmail());
	         pstmt.setString(6, m.getNickname());
	         pstmt.setString(7, m.getProfileImg());
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      return result;
	      
	   }

	
	
	
}
