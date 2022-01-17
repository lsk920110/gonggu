package com.gong.gu.dao;

import com.gong.gu.dto.BoardDTO;

public interface RequestBoardDAO {

	void reqwrite(BoardDTO dto); // 요청게시글쓰기

	int reqfilewrite(int idx, String oriFileName, String newFileName); // 요청게시글 파일저장
	
	int reqwrite2(int idx, String category); // 요청게시글 카테고리

}
