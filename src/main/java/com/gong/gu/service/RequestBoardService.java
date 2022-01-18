package com.gong.gu.service;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dao.RequestBoardDAO;
import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.PhotoDTO;

@Service
public class RequestBoardService {
	
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RequestBoardDAO dao;
	



	// 요청글쓰기
	public String reqwrite(MultipartFile[] photos, HashMap<String, String> params) {
		
		logger.info("요청 글쓰기 서비스 요청");
		
		String page= "redirect:/requireBoardlist";
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_title(params.get("board_title"));
		dto.setBoard_content(params.get("board_content"));
		dao.reqwrite(dto);
		
		int board_no = dto.getBoard_no();
		logger.info("board_no : " +board_no);
		
		if (board_no>0) {
			page = "readirect:/requireBoardDetail?board_no="+board_no;
			reqwrite2(board_no,params);
			saveFile(board_no,photos);
		}
		
		
		return page;
	}


	// 요청글 사진 파일 저장 (실제 파일을 저장하고 경로를 DB 에 기록)
	private void saveFile(int board_no, MultipartFile[] photos) {
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
			int aed = dao.reqfilewrite(board_no, oriFileName, newFileName);
			logger.info("사진 업데이트 됐으면 1 이상! {}", aed);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
	}


	// 옵션 DB 글쓰기
	private void reqwrite2(int board_no, HashMap<String, String> params) {
		logger.info("옵션 DB 데이터 넣기 : {}",params);
		
		String Category = params.get("Category");
		
		int row = dao.reqwrite2(board_no,Category);
		logger.info("입력된 건수 : {}",row);
		
	}

	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	
/*	
	// 요청글 리스트
			public ArrayList<BoardDTO> list() {
				logger.info("list 쿼리 요청");
				return dao.list();
			}
*/

	//2. 요청게시글 요청하기
	   public ArrayList<HashMap<String, String>> RequestList() {
	      // TODO Auto-generated method stub
	      return dao.RequestList();
	   }
	
	
	

			// 요청글 상세보기
			public BoardDTO detail(String board_no) {
				logger.info("요청글 상세보기 서비스 요청");
				
				dao.upHit(board_no);
				
				return dao.detail(board_no);
			}

			// 요청글 비노출
			
			public void exposure(String board_no) {
				logger.info("요청글 비노출 처리 요청");
				
				dao.exposure(board_no);
			}




			public ArrayList<PhotoDTO> photolist(String board_no) {
				logger.info("포토게시판 리스트 서비스 요청");
				
				return dao.photolist(board_no);
			}
			
		
	
}


