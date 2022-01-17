package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface AdminDAO {

	ArrayList<HashMap<String, String>> adRequire();

	ArrayList<HashMap<String, String>> adOrderList();

	ArrayList<HashMap<String, String>> adInquiry();

	void adminInquiry_update(String strKey, String exp, String act);

	void adminInquiry_update2(String strKey, String sta);

	ArrayList<HashMap<String, String>> adgroupbuylist();

	void adminGroupbuy_update(String strKey, String exp, String act);

	void adminGroupbuy_update2(String strKey, String sta);

	int gbcancel_no(String board_no);

	int gbcancel_no_act(String board_no);

	int gbcancel_R(String board_no, String cancelR);




}
