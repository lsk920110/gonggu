package com.gong.gu.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dao.MypageDAO;
import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.Groupbuy_additDTO;
import com.gong.gu.dto.MemberDTO;
import com.gong.gu.dto.Order_infoDTO;
import com.gong.gu.dto.PhotoDTO;

@Service
public class MypageService {
	@Autowired MypageDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ArrayList<HashMap<String, String>> orderlist(String loginId) {
		
		ArrayList<HashMap<String, String>> orderList = dao.orderlist(loginId);
		
		
		return orderList;
	}

	public ArrayList<HashMap<String, String>> inquirelist(String loginId) {
		logger.info("서비스에 문의글요청");
		ArrayList<HashMap<String, String>> inquireList = dao.inquirelist(loginId);
		
		return inquireList;
	}

	public ArrayList<HashMap<String, String>> requirelist(String loginId) {
		logger.info("요청게시판관련글 불러와!!");
		ArrayList<HashMap<String, String>> requireList = dao.requirelist(loginId);

		return requireList;
	}

	public String login_temp(String id, String pw) {
		String loginId = dao.login_temp(id,pw);
		
		return loginId;
	}

	public MemberDTO myprofile(String loginId) {
		MemberDTO myProfile = dao.myprofile(loginId);

		return myProfile;
	}

	public HashMap<String, String> orderDetail(String order_no, String loginId) {
		
		
		HashMap<String, String> orderdetail = dao.orderDetail(order_no,loginId);
		
		
		return orderdetail;
	}

	public int ordercancel(String order_no) {
		return dao.ordercancel(order_no);

	}

	
	//사진관련

	public ArrayList<String> groupbuyPhotowrite2(MultipartFile[] photos) {  //idx
		
		ArrayList<String> newphotonames = new ArrayList<String>();

		for(MultipartFile photo : photos) {

			
			try {
				String oriFileName = photo.getOriginalFilename();
				int index = oriFileName.lastIndexOf("."); 
				logger.info("index : {}",index);
			
								
				//방어코드 : 예외 발생이 예상되는 지점을 피해가도록 처리
				if(index>0) {
					
					
					String ext = oriFileName.substring(index); //확장자(보여주기 시작할 인덱스)
					String newFileName = System.currentTimeMillis()+ext;//새로운 파일명 생성
					Thread.sleep(1);//파일 중복 피하기위함
					logger.info(oriFileName+" => "+newFileName);
					
					
					//파일 저장(photo 로부터 byte 를 뽑아내 경로를 지정하여 넣는다.)
					byte[] bytes = photo.getBytes();
					
					Path path = Paths.get("C:/upload/"+newFileName); //경로설정
					Files.write(path, bytes);
					logger.info(oriFileName+" 컴퓨터에 SAVE");
					newphotonames.add(newFileName);

					
					//dao.fileWrite(oriFileName,newFileName);//DB에 저장한 파일명을 기록 //idx
					
					
					//1.dto 만들어서 new ori 넣고 filewrite 진행
					//2.생성된 값들을 다시 넣어서 dto 반환

					
					
				}
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
		
		}
		return newphotonames;
	}

	public void groupbuywrite2(String loginId, HashMap<String, String> params, String board_name) {

		BoardDTO boarddto = new BoardDTO();
		boarddto.setUser_id(loginId);
		boarddto.setBoard_title(params.get("board_title"));
		boarddto.setBoard_content(params.get("board_content"));
		boarddto.setBoard_name(board_name);
		
		int row = dao.groupbuywrite2(boarddto);
		if(row>0) {
			logger.info("board에 입력 성공!! board_no : {}",boarddto.getBoard_no());
		}
		
		//공구게시판 추가정보
		Groupbuy_additDTO gbadto = new Groupbuy_additDTO();
		gbadto.setBoard_no(boarddto.getBoard_no());
		gbadto.setGroupbuy_unitprice(Integer.parseInt(params.get("groupbuy_unitprice")));
		gbadto.setGroupbuy_max(Integer.parseInt(params.get("groupbuy_max")));
		gbadto.setGroupbuy_due_date(Date.valueOf(params.get("groupbuy_due_date")));
		gbadto.setProduct_category_name("product_category_name");
		
		dao.groupbuywrite2_gba(gbadto);
		
		
		
		PhotoDTO photodto = new PhotoDTO();
		for (int i = 1; i <= Integer.parseInt(params.get("photo_cnt")); i++) {
			if(params.get("photo_thum").equals(params.get("photo"+i))) {
				logger.info("썸네일 확인!!");
				photodto.setPhoto_thum("Y");
				photodto.setBoard_no(boarddto.getBoard_no());
				photodto.setPhoto_newname(params.get("photo"+i));
			} else {
				logger.info("썸네일 아님!!");
				photodto.setPhoto_thum("N");
				photodto.setBoard_no(boarddto.getBoard_no());
				photodto.setPhoto_newname(params.get("photo"+i));
			}
			
			dao.groupbuywrite2_pho(photodto);
		}
		
		
	}

	public HashMap<String, String> orderConfirmPage(int board_no, String loginId) {
		//user_info 에서 user_name,user_address,user_phone,
		//board JOIN groupbuy_addit 에서 board_no, board_title, unit_price
		HashMap<String, String> user_info = dao.orderConfirm_user(loginId);
		logger.info("회원정보 가져오기 {}",user_info);
		HashMap<String, String> board = dao.orderConfirm_board(board_no);
		logger.info("회원정보 가져오기 {}",board);

		HashMap<String, String>orderConfirm_info = new HashMap<String, String>();
		orderConfirm_info.putAll(user_info);
		orderConfirm_info.putAll(board);
		logger.info("합채결과 {}",orderConfirm_info);
		
		
		return orderConfirm_info;
	}

	public Order_infoDTO orderrequest(HashMap<String, String> params, String loginId) {
		Order_infoDTO orderDTO = new Order_infoDTO();
		orderDTO.setUser_id(loginId);
		orderDTO.setOrder_name(params.get("user_name"));
		orderDTO.setOrder_address(params.get("user_address"));
		orderDTO.setOrder_phone(params.get("user_phone"));
		orderDTO.setBoard_no(Integer.parseInt(params.get("board_no")));
		orderDTO.setOrder_quantity(params.get("order_quantity"));
		
		dao.orderrequest(orderDTO);
		
		return orderDTO;
	}

	public HashMap<String, Object> emailIdentify(String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overlayd = dao.emailIdentify(email);
		boolean emailTF = overlayd == null? false : true;
		map.put("emailTF", emailTF);
		return map;
	}

	public HashMap<String, Object> profileUpdate(HashMap<String, String> userupdate) {
		logger.info("파라메터가 서비스에 도착함? {}",userupdate);
		int row = dao.profileUpdate(userupdate);	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		logger.info("성공했니? {}",row);
		
		return map;
	}

	
}
