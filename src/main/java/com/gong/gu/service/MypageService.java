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
		gbadto.setProduct_category_name(params.get("product_category_name"));
		gbadto.setGroupbuy_target(Integer.parseInt(params.get("groupbuy_target")));
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

	public HashMap<String, String> orderConfirmPage(String board_no, String loginId) {
		//user_info 에서 user_name,user_address,user_phone,
		//board JOIN groupbuy_addit 에서 board_no, board_title, unit_price
		HashMap<String, String> user_info = dao.orderConfirm_user(loginId);
		logger.info("회원정보 가져오기 {}",user_info);
		HashMap<String, String> board = dao.orderConfirm_board(board_no);
		logger.info("게시글 정보 가져오기 {}",board);

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

	public HashMap<String, String> groupbuydetail(String board_no) {
		dao.groupbuydetail_upHit(board_no);
		HashMap<String, String> groupbuydetail = dao.groupbuydetail(board_no);
		//조회수 업
		
		return groupbuydetail;
	}

	public String orderquansum(String board_no) {
		String orderquansum = dao.orderquansum(board_no);
		if(orderquansum == null) {
			orderquansum = "0";
		}
		
		
		return orderquansum;
	}

	public ArrayList<HashMap<String, String>> photolist(String board_no) {
		return dao.photolist(board_no);
	}

	
	public int rangecall(int currPage, int pagePerCnt, String loginId) {

		int totalCount = dao.allCount(loginId); // 일단 테이블 글이 몇개인지? 
		int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수

		return range;
	}

	public ArrayList<HashMap<String, String>> listCall(int currPage, int pagePerCnt, String loginId) {
		int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-9, 2:10-19 이런식으로해야함
		//1페이지면 limit 10에, offset 0부터 조회
		//2페이지면 limit 10에, offset 10부터 조회
		//3페이지면 limit 10에, offset 20부터 조회
		if(offset < 0) {
			offset = 0;
		}
		
		ArrayList<HashMap<String, String>> listCall = dao.listCall(pagePerCnt,offset,loginId);
		
		
		return listCall;
	}

	


	public int groupBuyRangeCall1(int currPage, int pagePerCnt, String loginId) {
		int totalCount = dao.groupBuyRangeCall1(loginId); // 일단 테이블 글이 몇개인지? 
		int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수

		return range;
	}
	
	
	

	public ArrayList<HashMap<String, String>> groupBuyListCall1(int currPage, int pagePerCnt, String loginId) {
		int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-7, 2:8-15 이런식으로해야함
		//1페이지면 limit 10에, offset 0부터 조회
		//2페이지면 limit 10에, offset 10부터 조회
		//3페이지면 limit 10에, offset 20부터 조회
		if(offset < 0) {
			offset = 0;
		}
		
		ArrayList<HashMap<String, String>> listCall = dao.groupBuyListCall1(pagePerCnt,offset,loginId);
		
		
		return listCall;
	}



	public int groupBuyRangeCall2(int currPage, int pagePerCnt) {
		int totalCount = dao.groupBuyRangeCall2(); // 일단 테이블 글이 몇개인지? 
		int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수
		logger.info("range : {}",range);
		return range;
	}



	public ArrayList<HashMap<String, String>> groupBuyListCall2(int currPage, int pagePerCnt) {
		
		int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-7, 2:8-15 이런식으로해야함
		//1페이지면 limit 10에, offset 0부터 조회
		//2페이지면 limit 10에, offset 10부터 조회
		//3페이지면 limit 10에, offset 20부터 조회
		if(offset < 0) {
			offset = 0;
		}
		logger.info("offset : {}",offset);
		ArrayList<HashMap<String, String>> listCall = dao.groupBuyListCall2(pagePerCnt,offset);
		logger.info("listCall : {}",listCall);
		
		return listCall;
	}


	//찜 목록 확인
	public ArrayList<String> wishlist(String loginId) {
		
		return dao.wishlist(loginId);
	}



	public int wishList_Insert(String loginId, String board_no) {
		
		int row = dao.wishList_Insert(loginId,board_no);
		logger.info(" 입력된 건수 : {}",row);
		return row;
	}



	public int wishList_delete(String board_no, String loginId) {
		
		return dao.wishList_delete(board_no,loginId);
		
	}



	public String wishlist2(String loginId, String board_no) {
		String wishlist2 = dao.wishlist2(board_no,loginId);
		return wishlist2;
	}

	public ArrayList<HashMap<String, String>> reply_call(String board_no) {
		logger.info("reply_call : DAO호출");
		
		return dao.reply_call(board_no);
	}

	public void reply_write(HashMap<String, String> reply) {
		dao.reply_write(reply);
		if(reply.get("board_name").equals("문의게시판")) {
			dao.answercomplete(reply);
			
		}
	}

	public int groupBuyRangeCall_wish(int currPage, int pagePerCnt, String loginId) {
		int totalCount = dao.groupBuyRangeCall_wish(loginId); // 일단 테이블 글이 몇개인지? 
		int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt) + 1 : (totalCount/pagePerCnt);//만들 수 있는 페이지의 갯수

		return range;
	}

	public ArrayList<HashMap<String, String>> groupBuyListCall_wish(int currPage, int pagePerCnt, String loginId) {
		int offset = (currPage -1)* pagePerCnt - 1;//DB에 요청할 인덱스 번호임 , 1:0-7, 2:8-15 이런식으로해야함
		//1페이지면 limit 10에, offset 0부터 조회
		//2페이지면 limit 10에, offset 10부터 조회
		//3페이지면 limit 10에, offset 20부터 조회
		if(offset < 0) {
			offset = 0;
		}
		
		ArrayList<HashMap<String, String>> listCall = dao.groupBuyListCall_wish(pagePerCnt,offset,loginId);
		
		
		return listCall;
	}


	
	
	
	
}
