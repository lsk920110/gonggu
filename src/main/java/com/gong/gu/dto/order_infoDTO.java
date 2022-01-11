package com.gong.gu.dto;

import java.sql.Date;

public class Order_infoDTO {
	private int order_no;
	private int board_no;
	private String groupbuy_state;
	private String user_id;
	private String order_name;
	private String order_phone;
	private String order_address;
	private String order_quantity;
	private Date order_date;
	private int order_price;
	private String order_state;
	private String order_etc;
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getGroupbuy_state() {
		return groupbuy_state;
	}
	public void setGroupbuy_state(String groupbuy_state) {
		this.groupbuy_state = groupbuy_state;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(String order_quantity) {
		this.order_quantity = order_quantity;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_etc() {
		return order_etc;
	}
	public void setOrder_etc(String order_etc) {
		this.order_etc = order_etc;
	}

}
