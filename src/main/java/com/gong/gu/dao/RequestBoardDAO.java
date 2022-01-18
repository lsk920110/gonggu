package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.PhotoDTO;

public interface RequestBoardDAO {

	void reqwrite(BoardDTO dto); // 요청게시글쓰기

	int reqfilewrite(int board_no, String oriFileName, String newFileName); // 요청게시글 파일저장
	
	int reqwrite2(int board_no, String category); // 요청게시글 카테고리

//////////////////////////////////////////////////////////////////////////////////////////////////

	ArrayList<HashMap<String, String>> RequestList();//요청게시글 리스트
	
	//ArrayList<BoardDTO> list();

	void upHit(String board_no);

	BoardDTO detail(String board_no);

	void exposure(String board_no);

	ArrayList<PhotoDTO> photolist(String board_no);

}
