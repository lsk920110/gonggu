package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface AdminDAO {

	//1. 전체 주문리스트 불러오기
	ArrayList<HashMap<String, String>> adOrderList();
	
	//2. 전체 문의게시글 리시트 불러오기
	ArrayList<HashMap<String, String>> adInquiry();

	//3. 전체 요청게시글 리스트 불러오기
	ArrayList<HashMap<String, String>> adRequire();

	//4. 전체 문의 게시글 변경된 데이터 값 보내기
	void adminInquiry_update(String update_boardNo, String update_exposure, String update_board_active);

	void adminInquiry_update2(String update_boardNo, String update_inquiry_answer);
	
	//5. 전체 요청 게시글 변경된 데이터 값 보내기
	void adRequire_update(String update_boardNo, String update_exposure, String update_board_active);

	void adRequire_update2(String update_boardNo, String update_inquiry_answer);
	
	
	
	
	
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	ArrayList<HashMap<String, String>> adgroupbuylist();

	void adminGroupbuy_update(String strKey, String exp, String act);

	void adminGroupbuy_update2(String strKey, String sta);

	int gbcancel_no(String board_no);

	int gbcancel_no_act(String board_no);

	int gbcancel_R(String board_no, String cancelR);

	ArrayList<HashMap<String, String>> adminuserlist();



}
