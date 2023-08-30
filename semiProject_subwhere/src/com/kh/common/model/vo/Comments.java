package com.kh.common.model.vo;

public class Comments {
	private int commentNo;
	private String memberNo;
	private String boardNo;
	private String commentConent;
	private String emrollDate;
	private String modifyDate;
	private String status;
	
	public Comments() {}

	public Comments(int commentNo, String memberNo, String boardNo, String commentConent, String emrollDate,
			String modifyDate, String status) {
		super();
		this.commentNo = commentNo;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.commentConent = commentConent;
		this.emrollDate = emrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	
	
	
	
	
	
	

	public Comments(int commentNo, String memberNo, String boardNo, String commentConent, String modifyDate,
			String status) {
		super();
		this.commentNo = commentNo;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.commentConent = commentConent;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getCommentConent() {
		return commentConent;
	}

	public void setCommentConent(String commentConent) {
		this.commentConent = commentConent;
	}

	public String getEmrollDate() {
		return emrollDate;
	}

	public void setEmrollDate(String emrollDate) {
		this.emrollDate = emrollDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Comments [commentNo=" + commentNo + ", memberNo=" + memberNo + ", boardNo=" + boardNo
				+ ", commentConent=" + commentConent + ", emrollDate=" + emrollDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}
	
	
	
}
