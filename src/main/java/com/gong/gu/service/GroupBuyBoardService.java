package com.gong.gu.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dao.GroupBuyBoardDAO;
import com.gong.gu.dto.BoardDTO;

@Service
public class GroupBuyBoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GroupBuyBoardDAO dao;

	
	//글쓰기
	public String groupbuywrite(MultipartFile[] photos, HashMap<String, String> params) {
		
		
		String page = "redirect:/groupBuyList";
		
	
		//방금 넣은 데이터에 대한 idx(key값)를 알고 싶다면 조건 2가지
		//조건1. 파라메터는 DTO형태로 넣을 것
		BoardDTO dto = new BoardDTO();
		
		dto.setBoard_title(params.get("board_title"));
		dto.setBoard_content(params.get("board_content"));
		
		dao.groupbuywrite(dto);
		
		//dto에 방금 넣은 게시글에 대한 idx가 담겨져 나온다.
		int idx = dto.getBoard_no();
		logger.info("idx : "+idx);
		
		if(idx>0) {
			page = "redirect:/detail?idx="+idx; //★수정하기 detail page
			groupbuywrite2(idx,params);
			//saveFile(idx,photos);// 파일 저장 처리	
		}
		
		return page;
	}
	
	
	
	//사진 파일 저장
	private HashMap<String,String> saveFile(MultipartFile[] photos) {  //idx
		
		HashMap<String, String> newphotonames = new HashMap<String, String>();
		
		int i = 1;

		for(MultipartFile photo : photos) {
			
			try {
				String oriFileName = photo.getOriginalFilename();
				int index = oriFileName.lastIndexOf("."); 
				logger.info("index : {}",index);
			
								
				//방어코드 : 예외 발생이 예상되는 지점을 피해가도록 처리
				if(index>0) {
					
					
					String ext = oriFileName.substring(index); //확장자(보여주기 시작할 인덱스)
					String newFileName = System.currentTimeMillis()+ext;//새로운 파일명 생성
					Thread.sleep(1);//파일 중복 피하기위함
					logger.info(oriFileName+" => "+newFileName);
					
					
					//파일 저장(photo 로부터 byte 를 뽑아내 경로를 지정하여 넣는다.)
					byte[] bytes = photo.getBytes();
					
					Path path = Paths.get("C:/upload/"+newFileName); //경로설정
					Files.write(path, bytes);
					logger.info(oriFileName+" 컴퓨터에 SAVE");
					newphotonames.put(Integer.toString(i), newFileName);
					i++;
					
					//dao.fileWrite(oriFileName,newFileName);//DB에 저장한 파일명을 기록 //idx
					
					
					//1.dto 만들어서 new ori 넣고 filewrite 진행
					//2.생성된 값들을 다시 넣어서 dto 반환

					
					
				}
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
		
		}
		return newphotonames;
	}
	
	//공구게시글 옵션 DB 글쓰기
	private void groupbuywrite2(int idx, HashMap<String, String> params){
		logger.info("옵션 DB 데이터 넣기 : {}",params);

		try {
			String Category = params.get("Category");
			
			String from = params.get("due_date");
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date due_date = transFormat.parse(from);

			int Groupbuy_target = Integer.parseInt(params.get("Target"));
			int Groupbuy_unitprice = Integer.parseInt(params.get("price"));
			int groupbuy_max = Integer.parseInt(params.get("Max"));
			
			int row = dao.groupbuywrite2(idx,Category,Groupbuy_target,Groupbuy_unitprice,due_date,groupbuy_max); 
			logger.info(" 입력된 건수 : {}",row);

		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}


	//photo 저장
	public HashMap<String, String> groupbuyPhotowrite(MultipartFile[] photos) {
		saveFile(photos);
		return saveFile(photos);
	}


	//공구리스트
	public ArrayList<HashMap<String, String>> groupBuyList() {
		ArrayList<HashMap<String, String>> groupBuyList = dao.groupBuyList();
		return groupBuyList;
	}


	//카테고리 체크
	@RequestMapping(value = "/categoryCheck", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, String>> categoryCheck(String param) {
		
		ArrayList<HashMap<String, String>> groupBuyList = dao.categoryCheck(param);
		
		return groupBuyList;
	}



	public String wishlist(String loginId) {
		
		return dao.wishlist(loginId);
	}





}
