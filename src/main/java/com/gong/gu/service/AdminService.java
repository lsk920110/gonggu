package com.gong.gu.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gong.gu.dao.AdminDAO;

@Service
public class AdminService {
   
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired AdminDAO dao;

	//1. 전체 주문 리스트 요청하기
	public ArrayList<HashMap<String, String>> adOrderList() {
		// 그냥 dao에 보내주기만 할 것
		return dao.adOrderList();
	}

	//2. 전체 문의 게시글 요청하기
	public ArrayList<HashMap<String, String>> adInquiry() {
		return dao.adInquiry();
	}

	//3. 전체 요청 게시글 요청하기
	public ArrayList<HashMap<String, String>> adRequire() {
		return dao.adRequire();
	}
	
	//4. 전체 문의 게시글 변경된 데이터 값 보내기
	public void adminInquiry_update(String update_boardNo, String update_exposure, String update_board_active,
			String update_inquiry_answer) {
		dao.adminInquiry_update(update_boardNo, update_exposure, update_board_active);
		
		dao.adminInquiry_update2(update_boardNo, update_inquiry_answer);
		logger.info(update_boardNo+" 번 게시글 수정 성공");
	}
	
	//5. 전체 요청 게시글 변경된 데이터 값 보내기
	public void adRequire_update(String update_boardNo, String update_exposure, String update_board_active,
			String update_inquiry_answer) {
		
		dao.adRequire_update(update_boardNo, update_exposure, update_board_active);
		
		dao.adRequire_update2(update_boardNo, update_inquiry_answer);
		logger.info(update_boardNo+" 번 게시글 수정 성공");
		
	}

   
   
   
   
   
   
   

   
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public ArrayList<HashMap<String, String>> adgroupbuylist() {
	ArrayList<HashMap<String, String>> adgroupbuylist = new ArrayList<HashMap<String,String>>();
	adgroupbuylist = dao.adgroupbuylist();
	logger.info("서비스에 요청게시판 데이터 받아옴 : {}",adgroupbuylist);
	
	return adgroupbuylist;
}

public void adminGroupbuy_update(String strKey, String exp, String act, String sta) {
	   dao.adminGroupbuy_update(strKey,exp,act);
	   dao.adminGroupbuy_update2(strKey,sta);	
}

public int gbcancel(String board_no, String cancelR) {
	int gbcancel_no = dao.gbcancel_no(board_no);
	int gbcancel_no_act = dao.gbcancel_no_act(board_no);
	int gbcancel_R = dao.gbcancel_R(board_no,cancelR);

	return gbcancel_no + gbcancel_no_act + gbcancel_R;
	
	
}


public ArrayList<HashMap<String, String>> adminuserlist() {
	
	
	ArrayList<HashMap<String, String>> adminuserlist = new ArrayList<HashMap<String, String>>();
	adminuserlist = dao.adminuserlist();
	logger.info("서비스  : 조회 결과물 {}",adminuserlist);
	
	return adminuserlist;
}


///////////////////////////////////////

public int adorder_rangecall(int currPage, int pagePerCnt ) {

	int totalCount = dao.adorder_allCount(); // 일단 테이블 글이 몇개인지? 
	int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수

	return range;
}

public ArrayList<HashMap<String, String>> adorder_listCall(int currPage, int pagePerCnt ) {
	int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-9, 2:10-19 이런식으로해야함
	//1페이지면 limit 10에, offset 0부터 조회
	//2페이지면 limit 10에, offset 10부터 조회
	//3페이지면 limit 10에, offset 20부터 조회
	if(offset < 0) {
		offset = 0;
	}
	
	ArrayList<HashMap<String, String>> listCall = dao.adorder_listCall(pagePerCnt,offset);
	
	
	return listCall;
}

public int adInq_rangecall(int currPage, int pagePerCnt) {
	int totalCount = dao.adInq_allCount(); // 일단 테이블 글이 몇개인지? 
	int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수

	return range;
}

public ArrayList<HashMap<String, String>> adInqr_listCall(int currPage, int pagePerCnt) {
	int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-9, 2:10-19 이런식으로해야함
	//1페이지면 limit 10에, offset 0부터 조회
	//2페이지면 limit 10에, offset 10부터 조회
	//3페이지면 limit 10에, offset 20부터 조회
	if(offset < 0) {
		offset = 0;
	}
	
	ArrayList<HashMap<String, String>> listCall = dao.adInq_listCall(pagePerCnt,offset);
	
	
	return listCall;
}

}