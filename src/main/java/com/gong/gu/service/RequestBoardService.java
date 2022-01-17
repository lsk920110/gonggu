package com.gong.gu.service;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dao.RequestBoardDAO;
import com.gong.gu.dto.BoardDTO;

@Service
public class RequestBoardService {
	
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RequestBoardDAO dao;
	



	// 요청글쓰기
	public String reqwrite(MultipartFile[] photos, HashMap<String, String> params) {
		
		String page= "redirect:/requireBoardList";
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_title("board_title");
		dto.setBoard_content("board_content");
		dao.reqwrite(dto);
		
		int idx = dto.getBoard_no();
		logger.info("idx : " +idx);
		
		if (idx>0) {
			page = "readirect:/requireBoardDetail?idx="+idx;
			reqwrite2(idx,params);
			saveFile(idx,photos);
		}
		
		
		return page;
	}


	// 요청글 사진 파일 저장 (실제 파일을 저장하고 경로를 DB 에 기록)
	private void saveFile(int idx, MultipartFile[] photos) {
		for (MultipartFile photo : photos) {
			String oriFileName = photo.getOriginalFilename();
			int index = oriFileName.lastIndexOf(".");
			String ext = oriFileName.substring(index);
			String newFileName = System.currentTimeMillis()+ext;
			logger.info(oriFileName+ "=>" +newFileName);
			
			try {
			
			byte[] bytes = photo.getBytes();
			Path path = Paths.get("C:/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(oriFileName+ "사진 올라가라!");
			int aed = dao.reqfilewrite(idx, oriFileName, newFileName);
			logger.info("사진 업데이트 됐으면 1 이상! {}", aed);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
	}


	// 옵션 DB 글쓰기
	private void reqwrite2(int idx, HashMap<String, String> params) {
		logger.info("옵션 DB 데이터 넣기 : {}",params);
		
		String Category = params.get("Category");
		
		int row = dao.reqwrite2(idx,Category);
		logger.info("입력된 건수 : {}",row);
		
	}
	
	
	
}


