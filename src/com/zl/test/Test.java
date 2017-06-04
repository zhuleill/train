package com.zl.test;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONObject;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zl.action.NewsAction;
import com.zl.biz.NewsBiz;
import com.zl.biz.Price_ListBiz;
import com.zl.biz.TicketBiz;
import com.zl.biz.UserinfoBiz;
import com.zl.biz.impl.TicketBizImpl;
import com.zl.entity.News;
import com.zl.entity.Price_List;
import com.zl.entity.Ticket;
import com.zl.entity.Userinfo;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		
//		ApplicationContext ac = new  ClassPathXmlApplicationContext("applicationContext.xml");
//		NewsBiz newsBiz=(NewsBiz) ac.getBean("newsBiz");
//		News news=new News();
//		news.setNewsid(1);
//		news.setNewshead("顶大大");
//		news.setNewscontent("法定税费");
//		
//		List<News> list = newsBiz.getAll();
//		JSONObject object=new JSONObject();
//		object.put("shownews", list);
//		System.out.println(object.toString());
//		for(News s:list){
//			System.out.println(s.getNewsid()+"\t"+s.getNewshead()+"\t"+s.getNewscontent());
//		}
		
		
		
		/*
		 * ApplicationContext ac = new
		 * ClassPathXmlApplicationContext("applicationContext.xml"); UserinfoBiz
		 * userBiz = (UserinfoBiz)ac.getBean("userBiz"); Userinfo user = new
		 * Userinfo();
		 * 
		 * user.setUname("bb"); user.setUpass("123"); userBiz.addUserinfo(user);
		 * List<Userinfo> list = userBiz.getAll(); for (Userinfo userinfo :
		 * list) {
		 * System.out.println(userinfo.getUid()+"\t"+userinfo.getUname()+
		 * "\t"+userinfo.getUpass()); }
		 */
/*		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		TicketBiz ticketBiz = (TicketBiz) ac.getBean("ticketBiz");
//		 Price_ListBiz price_ListBiz=(Price_ListBiz)
//		 ac.getBean("price_ListBiz");

		Ticket ticketTest=new Ticket();
		ticketTest.setUid(1);
		ticketTest.setTrain_no("G1346");
		ticketTest.setTrain_type("G");
		ticketTest.setStart_station("滁州");
		ticketTest.setStart_station_type("CH");
		ticketTest.setEnd_station("南京");
		ticketTest.setEnd_station_type("NJ");
		ticketTest.setStart_time("13:46");
		ticketTest.setEnd_time("14:00");
		ticketTest.setRun_time("24分钟");
		ticketTest.setPrice_Lists(new HashSet<Price_List>());
		Price_List price1=new Price_List();
		Price_List price2=new Price_List();
		price1.setPrice_type("二等座");
		price1.setPrice("49元");
		price1.setTickets(ticketTest);
		price2.setPrice_type("一等座");
		price2.setPrice("98元");
		price2.setTickets(ticketTest);
		ticketTest.getPrice_Lists().add(price1);
		ticketTest.getPrice_Lists().add(price2);
		ticketBiz.addTicket(ticketTest);
		
//		Ticket findticke=ticketBiz.getTicketById(135);
//		findticke.setTrain_no("G83");
//
//		Set<Price_List> list1=new HashSet<Price_List>();
//		list1=findticke.getPrice_Lists();
//		for(Price_List price4:list1){
//			if(price4.getPrice_type().equals("二等座")){
//				price4.setPrice("68元");
//			}
//		}
//		ticketBiz.updateTicket(findticke);
		
//		ticketBiz.deleteTicket(1);
		List<Ticket> listt = ticketBiz.getAll();
		System.out.println("---------------------------------------------------------------------------------");
		for (Ticket ticket : listt) {
			System.out.println(ticket.getTrain_no() + "\t" + ticket.getUid()
					+ "\t" + ticket.getTrain_type() + "\t"
					+ ticket.getStart_station() + "\t"
					+ ticket.getStart_station_type() + "\t"
					+ ticket.getEnd_station() + "\t"
					+ ticket.getEnd_station_type() + "\t"
					+ ticket.getStart_time() + "\t" + ticket.getEnd_time()
					+ "\t" + ticket.getRun_time());
			Set<Price_List> listp=ticket.getPrice_Lists();
			for(Price_List price_List:listp){
				System.out.println(price_List.getPrice_type()+"\t"+price_List.getPrice());
			}
			System.out.println("---------------------------------------------------------------------------------");
		}
		*/
		TicketBizImpl impl=new TicketBizImpl();
//		impl.getRequest1();
//		impl.getRequest3();
//		impl.getRequest4();
//		 impl.getTicket(10,"滁州", "南京","2017-05-24");
//		System.out.println(result.toString());
	}
}
