package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.PhotoDTO;

public interface InquireBoardDAO {

	
	void inqwrite(BoardDTO dto); // 문의게시글쓰기
	
	int inqfilewrite(int idx, String oriFileName, String newFileName); // 문의게시글 파일저장

	int inqwrite2(int idx, String category); // 문의게시글 카테고리

	int inqupdate(HashMap<String, String> params); // 문의게시글 수정

	ArrayList<BoardDTO> list();

	void upHit(String board_no);

	BoardDTO detail(String board_no);

	void exposure(String board_no);

	ArrayList<PhotoDTO> photolist(String board_no);

	HashMap<String, String> inqboardetail(String board_no);
}
