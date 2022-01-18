package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.PhotoDTO;

public interface InquireBoardDAO {

	
	void inqwrite(BoardDTO dto); // 문의게시글쓰기
	
	int inqfilewrite(int board_no, String oriFileName, String newFileName); // 문의게시글 파일저장

	int inqwrite2(int board_no, String category); // 문의게시글 카테고리

	int inqupdate(HashMap<String, String> params); // 문의게시글 수정

	int inqupdate2(int inquiry_category_name, String categoryname);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////	

	ArrayList<HashMap<String, String>> InquiryList();//1. 문의 게시글 리스트
	
	//ArrayList<BoardDTO> list();

	void upHit(String board_no);

	BoardDTO detail(String board_no);

	void exposure(String board_no);

	ArrayList<PhotoDTO> photolist(String board_no);

	HashMap<String, String> inqboardetail(String board_no);




}
