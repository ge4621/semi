package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamepolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		
		//원본파일 명
		String originName = originFile.getName();
		//수정 파일명
		//1.파일 업로드 시간 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		//2.5자리 랜덤값
		int ranNum = (int)(Math.random()*90000+10000);
		
		//3.원본파일 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//합치기
		String changeName = currentTime + ranNum + ext;
		
		System.out.println("7777777777" + changeName);
		
		return new File(originFile.getParent(),changeName);
	}
	

}
