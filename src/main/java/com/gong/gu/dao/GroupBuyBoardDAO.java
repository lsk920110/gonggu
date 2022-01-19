package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.WishlistDTO;

public interface GroupBuyBoardDAO {

	void groupbuywrite(BoardDTO dto);

	void fileWrite(String oriFileName, String newFileName);

	int groupbuywrite2(int idx, String category, int groupbuy_target, int groupbuy_unitprice, Date due_date, int groupbuy_max);

	ArrayList<HashMap<String, String>> groupBuyList();

	ArrayList<HashMap<String, String>> categoryCheck(String param);

	ArrayList<String> wishlist(String loginId);

	int wishList_Insert(String loginId, String board_no);

	int wishList_delete(String board_no, String loginId);

	String wishlist2(String board_no, String loginId);

	ArrayList<HashMap<String, String>> groupBuyList2(String category);

	int groupBuyRangeCall1();

	ArrayList<HashMap<String, String>> groupBuyListCall1(int pagePerCnt, int offset);

	int groupBuyRangeCall2(String category);

	ArrayList<HashMap<String, String>> groupBuyListCall2(int pagePerCnt, int offset, String category);


}
