package com.gong.gu.dao;

import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;

public interface InquireBoardDAO {

	BoardDTO inquireBoardDetail(String idx); // 문의게시글 상세정보
	
	void inqwrite(BoardDTO dto); // 문의게시글쓰기
	
	int inqfilewrite(int idx, String oriFileName, String newFileName); // 문의게시글 파일저장

	int inqwrite2(int idx, String category); // 문의게시글 카테고리

	int inqupdate(HashMap<String, String> params); // 문의게시글 수정


}
