package com.gong.gu.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gong.gu.service.AdminService;


@Controller
public class AdminController {
   
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired AdminService service;
   
   @RequestMapping(value = "/MainSlider", method = RequestMethod.GET)
   public String MainSlider(Model model) {
      logger.info("이벤트 슬라이드 불러오기");

      return "MainSlider";
   }
   
   @RequestMapping(value = "/header", method = RequestMethod.GET)
   public String header(Model model) {
      logger.info("헤더 불러오기");

      return "header";
   }
   
   @RequestMapping(value = "/footer", method = RequestMethod.GET)
   public String footer(Model model) {
      logger.info("풋터 불러오기");

      return "footer";
   }
   
   //1. 전체 주문리스트 요청하기
   @RequestMapping(value = "/adminOrderList", method = RequestMethod.GET)
   public String adminOrderList(Model model) {
      logger.info("전체주문내역 리스트 불러오기");
      
      ArrayList<HashMap<String, String>> adOrderList = service.adOrderList();
      logger.info("가져온 리수트 수 : {}", adOrderList.size());
      model.addAttribute("adOrderList", adOrderList);
      return "adminOrderList";
   }
   
   //2. 전체 문의 게시글
   @RequestMapping(value = "/adminInquiry", method = RequestMethod.GET)
   public String adminInquiry(Model model) {
      logger.info("전체 문의 게시글 리스트 불러오기");
      
      ArrayList<HashMap<String, String>> adInquiry = service.adInquiry();
      logger.info("가져온 리수트 수 : {}", adInquiry.size());
      model.addAttribute("adInquiry", adInquiry);
      model.addAttribute("length",adInquiry.size());
      return "adminInquiry";
   }
   
   //3. 전체 요청 게시글
   @RequestMapping(value = "/adminRequire", method = RequestMethod.GET)
   public String adRequire(Model model) {
      logger.info("전체 요청 게시글 리스트 불러오기");
      
      ArrayList<HashMap<String, String>> adRequire = service.adRequire();
      logger.info("가져온 리수트 수 : {}", adRequire.size());
      model.addAttribute("adRequire", adRequire);
      return "adminRequire";
   }
   

   //4. 전체 문의 게시글 변경된 데이터 값 보내기
   @RequestMapping(value = "/adminInquiry_update", method = RequestMethod.POST)
   public String update(Model model, 
         @RequestParam  HashMap<String, String> params) {
      logger.info("수정요청 요청 : {}", params);

      for(String strKey : params.keySet()) {
    	  String strValue = params.get(strKey);
    	  String exp = strValue.substring(0,1);
    	  String act = strValue.substring(1,2);
    	  String sta = strValue.substring(2,3);
    	  service.adminInquiry_update(strKey,exp,act,sta);
    	  
    	  logger.info(strValue+strKey+'/'+exp+'/'+act+'/'+sta);
      }
      
      
      
      return "redirect:/adminInquiry";//
   }
   
   
   
   //5. 전체 요청 게시글
   @RequestMapping(value = "/admingroupbuylist", method = RequestMethod.GET)
   public String admingroupbuylist(Model model) {
      logger.info("전체 요청 게시글 리스트 불러오기");
      
      ArrayList<HashMap<String, String>> adgroupbuylist = service.adgroupbuylist();
      logger.info("가져온 리수트 수 : {}", adgroupbuylist.size());
      model.addAttribute("adgroupbuylist", adgroupbuylist);
      return "admingroupbuylist";
   }

   //6. 전체 문의 게시글 변경된 데이터 값 보내기
   @RequestMapping(value = "/adminGroupbuy_update", method = RequestMethod.POST)
   public String adminGroupbuy_update(Model model, 
         @RequestParam  HashMap<String, String> params) {
      logger.info("수정요청 요청 : {}", params);

      for(String strKey : params.keySet()) {
    	  String strValue = params.get(strKey);
    	  String exp = strValue.substring(0,1);
    	  String act = strValue.substring(1,2);
    	  String sta = strValue.substring(2);
    	  service.adminGroupbuy_update(strKey,exp,act,sta);
    	  
    	  logger.info(strValue+strKey+'/'+exp+'/'+act+'/'+sta);
      }
      

      return "redirect:/admingroupbuylist";//
   }   
   
   @RequestMapping(value = "/gbcancel", method = RequestMethod.GET)
   public String gbcancel(Model model, 
         @RequestParam String cancelR ,  @RequestParam String board_no) {
      logger.info("{} 게시글 취소요청 {}",board_no, cancelR);
      	int success = service.gbcancel(board_no,cancelR);
      	
      	if(success > 0) {
      		logger.info("{} 취소 완료 , 삭제사유 : {}",board_no,cancelR);      		
      	} else {
      		logger.info("취소 실패");
      	}
      

      return "redirect:/admingroupbuylist";//
   }   
   
}