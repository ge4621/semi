package com.kh.board.model.vo;

public class Liked {
   private int memberNo;
   private String boardNo;
   
   private String titleImg;//대표이미지
   
   public Liked() {}
   
   public Liked(int memberNo, String boardNo) {
      super();
      this.memberNo = memberNo;
      this.boardNo = boardNo;
   }
   
   public Liked(String boardNo, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.titleImg = titleImg;
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
   
   public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
   
   @Override
   public String toString() {
      return "Liked [memberNo=" + memberNo + ", boardNo=" + boardNo + "]";
   }
   
   
}