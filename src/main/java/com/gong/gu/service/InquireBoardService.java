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
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dao.InquireBoardDAO;
import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.Inquiry_categoryDTO;
import com.gong.gu.dto.PhotoDTO;

@Service
public class InquireBoardService {
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireBoardDAO dao;

	
	//2.문의글쓰기
	public String inqwrite(HashMap<String, String> params) {
		
		String page = "redirect:/inquireBoardList";
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_title(params.get("board_title"));
		dto.setBoard_content(params.get("board_content"));
		dto.setUser_id(params.get("user_id"));
		dao.inqwrite(dto);
		
		int board_no = dto.getBoard_no();
		logger.info("board_no: "+board_no);
		
		if (board_no>0) {
			page = "redirect:/inquireBoardDetail?board_no="+board_no;
			inqwrite2(board_no,params);
			//saveFile(board_no,photos);
		}

		return page;
	}
	
	
	//2.문의글 사진 파일 저장 (실제 파일을 저장하고 경로를 DB 에 기록)
	private void saveFile(int board_no, MultipartFile[] photos) {
		for (MultipartFile photo : photos) {
			String oriFileName = photo.getOriginalFilename();
			int index = oriFileName.lastIndexOf(".");
			String ext = oriFileName.substring(index);
			String newFileName = System.currentTimeMillis()+ext;
			logger.info(oriFileName+ "=>"+newFileName);
			
			try {
				// 파일 저장(photo 로부터 byte 를 뽑아내 경로를 지정하여 넣는다.)
				byte[] bytes = photo.getBytes();
				Path path = Paths.get("C:/upload/"+newFileName);
				Files.write(path, bytes);
				logger.info(oriFileName+"사진 올라갔냐!");
				int asd = dao.inqfilewrite(board_no, oriFileName, newFileName);
				logger.info("사진 업데이트 됬으면 1이상! {}",asd);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	
	//2.옵션 DB 글쓰기 (문의 카테고리 추가)
	private void inqwrite2(int board_no, HashMap<String, String> params) {
		logger.info("문의 카테고리 데이터 넣기 : {}",params);
	
			String Category = params.get("Category");
		
			int row = dao.inqwrite2(board_no,Category);
			logger.info("입력된 건수 : {}",row);
			
		} 
		


	// 문의글 수정페이지 요청
	public HashMap<String, String> inqupdateForm(String board_no) {
		logger.info("service 동작 :{} 번 글 데이터 요청",board_no);
		HashMap<String, String> inqboardetail = dao.inqboardetail(board_no);
		return inqboardetail;
	}
	


	// 문의글 수정
	public String inqupdate(HashMap<String, String> params) {
		
		int board_no = Integer.parseInt(params.get("board_no"));
		String page = "redirect:/inquireBoardDetail?board_no="+board_no;
		
		if (dao.inqupdate(params)>0) {
			page = "redirect:/inquireBoardDetail?board_no="+board_no;
			dao.inqupdate2(params);
			
			//saveFile(board_no, photos);
		}
		return page;
	}
	
	
	/*
	// 문의글 수정(문의 카테고리 수정)
	private void inqupdate(int inquiry_category_name, HashMap<String, String> params) {
		logger.info("문의 카테고리 데이터 수정 : {}",params);
	
			String Categoryname = params.get("inquiry_category_name");
		
			int row = dao.inqupdate2(inquiry_category_name,Categoryname);
			logger.info("입력된 건수 : {}",row);
			
		}
		
		 */
		

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//1. 문의게시글 요청하기
   public ArrayList<HashMap<String, String>> InquiryList() {
   
      return dao.InquiryList();
   }
	
/*
	// 문의글 리스트
	public ArrayList<BoardDTO> list() {
		logger.info("list 쿼리 요청");
		return dao.list();
	}
*/



	// 문의글 상세보기
	public BoardDTO detail(String board_no) {
		logger.info("문의글 상세보기 서비스 요청");
		
		dao.upHit(board_no);
		
		return dao.detail(board_no);
	}

	
	// 문의글 비노출
	public void exposure(String board_no) {
		logger.info("문의글 비노출 처리 요청");
		
		dao.exposure(board_no);
	}




	public ArrayList<PhotoDTO> photolist(String board_no) {
		logger.info("포토게시판 리스트 서비스 요청");
		
		return dao.photolist(board_no);
	}


	



}
