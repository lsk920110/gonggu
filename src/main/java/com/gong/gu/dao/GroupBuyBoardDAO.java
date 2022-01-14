package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;

public interface GroupBuyBoardDAO {

	void groupbuywrite(BoardDTO dto);

	void fileWrite(String oriFileName, String newFileName);

	int groupbuywrite2(int idx, String category, int groupbuy_target, int groupbuy_unitprice, Date due_date, int groupbuy_max);

	ArrayList<HashMap<String, String>> groupBuyList();

	ArrayList<HashMap<String, String>> categoryCheck(String param);

	String wishlist(String loginId);


}
