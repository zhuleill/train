package com.zl.biz;

import java.util.List;

import net.sf.json.JSONObject;

import com.zl.entity.Ticket;

public interface TicketBiz {
	public int addTicket(Ticket ticket);
	public int updateTicket(Ticket ticket);
	public int deleteTicket(int train_no);
	public List<Ticket> getAll();
	public Ticket getTicketById(int train_no);
	public  void getRequest1();
	public  void getRequest2();
	public  JSONObject getRequest3(String train_no);
	public  void getRequest4();
	public  JSONObject getRequest5(String start_Station,String end_Station,String gDate);
	public  JSONObject getRequest6(String start_Station,String end_Station,String gDate);
	public  void getRequest7();
	public  void getRequest8();
}
