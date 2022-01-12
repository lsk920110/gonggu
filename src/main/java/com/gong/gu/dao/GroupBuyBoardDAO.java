package com.gong.gu.dao;

import java.util.Date;

import com.gong.gu.dto.BoardDTO;

public interface GroupBuyBoardDAO {

	void groupbuywrite(BoardDTO dto);

	void fileWrite(int idx, String oriFileName, String newFileName);

	int groupbuywrite2(int idx, String category, int groupbuy_target, int groupbuy_unitprice, Date due_date, int groupbuy_max);

}
