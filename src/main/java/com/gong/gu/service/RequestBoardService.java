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

import com.gong.gu.dao.RequestBoardDAO;
import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.PhotoDTO;

@Service
public class RequestBoardService {
	
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RequestBoardDAO dao;
	



	// 요청글쓰기
	public String reqwrite(HashMap<String, String> params) {
		
	
		String page= "redirect:/requireBoardlist";
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_title(params.get("board_title"));
		dto.setBoard_content(params.get("board_content"));
		dto.setUser_id(params.get("user_id"));
		dao.reqwrite(dto);
		
		int board_no = dto.getBoard_no();
		logger.info("board_no : " +board_no);
		
		
		if (board_no>0) {
			page = "redirect:/RequestBoardDetail?board_no="+board_no;
			reqwrite2(board_no,params);
			// saveFile(board_no,photos);
		}
		
		
		return page;
	}


	/*
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
	*/


	// 옵션 DB 글쓰기
	private void reqwrite2(int board_no, HashMap<String, String> params) {
		logger.info("옵션 DB 데이터 넣기 : {}",params);
		
		String Category = params.get("Category");
		
		int row = dao.reqwrite2(board_no,Category);
		logger.info("입력된 건수 : {}",row);
		
	}

	

	
	// 요청글 수정페이지 요청
	public HashMap<String, String> requpdateForm(String board_no) {
		logger.info("service 동작:{} 번 글 데이터 요청", board_no);
		HashMap<String, String> RequestBoardDetail = dao.RequestBoardDetail(board_no); 
		return RequestBoardDetail;
	}
	

	// 요청글 수정
	public String requpdate(HashMap<String, String> params) {
		
		int board_no = Integer.parseInt(params.get("board_no"));
		String page = "redirect:/RequestBoardDetail?board_no="+board_no;
		
		if (dao.requpdate(params)>0) {
			page = "redirect:/RequestBoardDetail?board_no="+board_no;
			dao.requpdate2(params);
			
			//saveFile(board_no, photos);
		}
		return page;

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


			public int RequestBoardlist_rangecall(int currPage, int pagePerCnt) {
				int totalCount = dao.RequestBoardlist_allCount(); // 일단 테이블 글이 몇개인지? 
				logger.info("totalCount : {}" , totalCount);
				
				int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수
				logger.info("range : {}" , range);

				return range;
			}


			public ArrayList<HashMap<String, String>> RequestBoardlist_listCall(int currPage, int pagePerCnt) {
				int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-9, 2:10-19 이런식으로해야함
				logger.info("currpage : {}" , currPage);
				if(offset < 0) {
					offset = 0;
				}
				
				logger.info("offset : {}" , offset);
				ArrayList<HashMap<String, String>> listCall = dao.RequestBoardlist_listCall(pagePerCnt,offset);
				logger.info("listcall 쿼리문 실행");
				
				return listCall;
			}


			public HashMap<String, String> additdetail(String board_no) {
				HashMap<String, String> additdetail = dao.additdetail(board_no);
				return additdetail;
			}






		





		
	
}


