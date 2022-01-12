package com.gong.gu.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dao.InquireBoardDAO;
import com.gong.gu.dto.BoardDTO;

@Service
public class InquireBoardService {
	@Autowired InquireBoardDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// 문의글쓰기
	public String inqwrite(MultipartFile[] photos, HashMap<String, String> params) {
		
		String page = "redirect:/";
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_title(params.get("board_title"));
		dto.setBoard_content(params.get("board_content"));
		dao.inqwrite(dto);
		
		int idx = dto.getBoard_no();
		logger.info("idx: "+idx);
		
		if (idx>0) {
			page = "readirect:/detail?idx="+idx;
			inqwrite2(idx,params);
			saveFile(idx,photos);
		}

		return page;
	}
	
	
	
	
	private void inqwrite2(int idx, HashMap<String, String> params) {
		logger.info("옵션 DB 데이터 넣기 : {}",params);
		
		try {
			String Category = params.get("Category");
			
			int row = dao.inqwrite2(idx,Category);
			logger.info("입력된 건수 : {}",row);
			
		} catch (Exception e) {

		}
		
	}




	private void saveFile(int idx, MultipartFile[] photos) {
		for (MultipartFile photo : photos) {
			
			try {
				String oriFileName = photo.getOriginalFilename();
				int index = oriFileName.lastIndexOf(".");
				logger.info("index : {}",index);
				
				if (index>0) {
					String ext = oriFileName.substring(index);
					String newFileName = System.currentTimeMillis()+ext;
					logger.info(oriFileName+ "=>" +newFileName);
				}
				
				
				
			} catch (Exception e) {

			}
		}
	}
	




	// 문의글 수정
	public String inqupdate(MultipartFile[] photos, HashMap<String, String> params) {
		
		int idx = Integer.parseInt(params.get("idx"));
		String page = "redirect:/detail?idx="+idx;
		
		if (dao.update(params)>0) {
			page = "redirect:/detail?idx="+idx;
			saveFile(idx, photos);
		}
		
		
		return page;
	}


}
