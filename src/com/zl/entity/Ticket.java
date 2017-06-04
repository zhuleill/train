package com.zl.entity;

import java.io.Serializable;
import java.util.Set;

public class Ticket  implements Serializable{

	private String train_no;
	private int uid;
	private String train_type;
	private String start_station; 
	private String card_type;
	private String end_station;
	private String card_number;
	private String start_time;
	private String end_time;
	private String real_name;
	private int price_list;
	private Set<Price_List> price_Lists;
	
	public Ticket(){
		
	}
	public String getTrain_no() {
		return train_no;
	}
	public void setTrain_no(String train_no) {
		this.train_no = train_no;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getTrain_type() {
		return train_type;
	}
	public void setTrain_type(String train_type) {
		this.train_type = train_type;
	}
	public String getStart_station() {
		return start_station;
	}
	public void setStart_station(String start_station) {
		this.start_station = start_station;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public String getEnd_station() {
		return end_station;
	}
	public void setEnd_station(String end_station) {
		this.end_station = end_station;
	}

	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public int getPrice_list() {
		return price_list;
	}
	public void setPrice_list(int price_list) {
		this.price_list = price_list;
	}
	public Set<Price_List> getPrice_Lists() {
		return price_Lists;
	}
	public void setPrice_Lists(Set<Price_List> price_Lists) {
		this.price_Lists = price_Lists;
	}
	
	
}
