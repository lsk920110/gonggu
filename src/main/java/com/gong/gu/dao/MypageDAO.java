package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.Groupbuy_additDTO;
import com.gong.gu.dto.MemberDTO;
import com.gong.gu.dto.Order_infoDTO;
import com.gong.gu.dto.PhotoDTO;

public interface MypageDAO {

	ArrayList<HashMap<String, String>> orderlist(String loginId);

	ArrayList<HashMap<String, String>> inquirelist(String loginId);

	ArrayList<HashMap<String, String>> requirelist(String loginId);

	String login_temp(String id, String pw);

	MemberDTO myprofile(String loginId);

	HashMap<String, String> orderDetail(String order_no, String loginId);

	int ordercancel(String order_no);

	int groupbuywrite2(BoardDTO boarddto);

	void groupbuywrite2_gba(Groupbuy_additDTO gbadto);

	void groupbuywrite2_pho(PhotoDTO photodto);

	HashMap<String, String> orderConfirm_user(String loginId);

	HashMap<String, String> orderConfirm_board(int board_no);

	void orderrequest(Order_infoDTO orderDTO);

	String emailIdentify(String email);

}
