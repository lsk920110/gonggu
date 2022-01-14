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

   public void adminInquiry_update(String strKey, String exp, String act, String sta) {
	   dao.adminInquiry_update(strKey,exp,act);
	   dao.adminInquiry_update2(strKey,sta);
   }
   
}