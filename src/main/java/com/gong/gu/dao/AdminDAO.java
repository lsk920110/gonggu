package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface AdminDAO {

	ArrayList<HashMap<String, String>> adRequire();

	ArrayList<HashMap<String, String>> adOrderList();

	ArrayList<HashMap<String, String>> adInquiry();

	void adminInquiry_update(String strKey, String exp, String act);

	void adminInquiry_update2(String strKey, String sta);



}
