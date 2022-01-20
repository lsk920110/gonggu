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

	//페이징 : 전체주문
	int adorder_allCount();
	ArrayList<HashMap<String, String>> adorder_listCall(int pagePerCnt, int offset);

	//페이징 : 전체문의
	int adInq_allCount();
	ArrayList<HashMap<String, String>> adInq_listCall(int pagePerCnt, int offset);

	//페이징 : 전체요청게시글
	int adReq_allCount();
	ArrayList<HashMap<String, String>> adReq_listCall(int pagePerCnt, int offset);

	//페이징 : 공구게시판
	int adGrp_allCount();
	ArrayList<HashMap<String, String>> adGrp_listCall(int pagePerCnt, int offset);

	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//6. 검색테스트
	ArrayList<String> wishlist_search(String loginId);
	//6-1. 리스트 범위불러오기1
	int groupBuyRangeCall_search1(String keyword);
	//6-2. 리스트 불러오기1
	ArrayList<HashMap<String, String>> groupBuyListCall_search1(int pagePerCnt, int offset, String keyword);
	//6-3. 리스트 범위불러오기2
	int groupBuyRangeCall_search2(String category, String keyword);
	//6-4. 리스트 불러오기2
	ArrayList<HashMap<String, String>> groupBuyListCall_search2(int pagePerCnt, int offset, String category,
			String keyword);

	//7-1. 문의글 리스트 범위 불러오기
	int list_rangecall_search(String keyword);
	
	//7-2. 문의글 리스트 불러오기
	ArrayList<HashMap<String, String>> list_listCall_search(int pagePerCnt, int offset, String keyword);

	//8-1. 요청글 리스트 범위 불러오기
	int RequestBoardlist_rangecall_search(String keyword);

	//8-2. 요청글 리스트 불러오기
	ArrayList<HashMap<String, String>> RequestBoardlist_listCall_search(int pagePerCnt, int offset, String keyword);



}
