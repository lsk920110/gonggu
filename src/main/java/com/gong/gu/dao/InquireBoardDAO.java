package com.gong.gu.dao;

import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;

public interface InquireBoardDAO {

	void inqwrite(BoardDTO dto);
	
	void fileWrite(int idx, String oriFileName, String newFileName);

	int inqwrite2(int idx, String category);

	int update(HashMap<String, String> params);
	
	

}
