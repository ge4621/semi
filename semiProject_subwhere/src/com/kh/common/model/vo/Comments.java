package com.kh.common.model.vo;

public class Comments {
	private int commentNo;
	private int memberNo;
	private String boardNo;
	private String commentConent;
	private String emrollDate;
	private String modifyDate;
	private String status;
	private String memberName;
	
	private String title;
	private String comment;
	
	public Comments() {}

	public Comments(int commentNo, int memberNo, String boardNo, String commentConent, String emrollDate,
			String modifyDate, String status, String memberName) {
		super();
		this.commentNo = commentNo;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.commentConent = commentConent;
		this.emrollDate = emrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.memberName = memberName;
	}
	

	public Comments(int commentNo, int memberNo, String boardNo, String commentConent, String modifyDate,
			String status) {
		super();
		this.commentNo = commentNo;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.commentConent = commentConent;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	

//	public Comments(String modifyDate, String title, String comment) {
//		super();
//		this.modifyDate = modifyDate;
//		this.title = title;
//		this.comment = comment;
//	}
	
	


	public Comments(String boardNo, String commentConent, String modifyDate, String title) {
		super();
		this.boardNo = boardNo;
		this.commentConent = commentConent;
		this.modifyDate = modifyDate;
		this.title = title;
	}

	public Comments(String commentConent, String modifyDate, String title) {
		super();
		this.commentConent = commentConent;
		this.modifyDate = modifyDate;
		this.title = title;
	}

	public Comments(int memberNo, String boardNo, String commentConent, String modifyDate, String status) {
		super();
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.commentConent = commentConent;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Comments [commentNo=" + commentNo + ", memberNo=" + memberNo + ", boardNo=" + boardNo
				+ ", commentConent=" + commentConent + ", emrollDate=" + emrollDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + ", memberName=" + memberName + ", title=" + title + ", comment=" + comment
				+ "]";
	}

	
	
}
