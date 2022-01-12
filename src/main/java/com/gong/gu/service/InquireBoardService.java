package com.gong.gu.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dao.InquireBoardDAO;
import com.gong.gu.dto.BoardDTO;

@Service
public class InquireBoardService {
	@Autowired InquireBoardDAO dao;

	// 문의글쓰기
	public String inqwrite(MultipartFile[] photos, HashMap<String, String> params) {
		String page = "redirect:/";
		BoardDTO dto = new BoardDTO();
		dto.setBoard_title("board_title");
		dto.setBoard_content("board_content");
		dao.inqwrite(dto);
		
		int idx = dto.getBoard_no();
		
		
		return page;
	}
	

	// 문의글 수정
	public String inqupdate(MultipartFile[] photos, HashMap<String, String> params) {
		
		return null;
	}


}
