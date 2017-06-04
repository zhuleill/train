package com.zl.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zl.biz.TicketBiz;
import com.zl.entity.Price_List;
import com.zl.entity.Ticket;

public class TicketAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private Ticket ticket;
	private Price_List price_List;
	private TicketBiz ticketBiz;
	private String result;
	private String randomMessage;
	private String trainNum;
	
	
	public String getAll() throws Exception{
		try {
			List<Ticket> list=ticketBiz.getAll();
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list";
	}
	public String doDelete() throws Exception {
		int result = ticketBiz.deleteTicket(ticket.getPrice_list());
		if(result>0){
			return "delete";
		}
		return this.ERROR;
	}
	
	public String doDetail() throws Exception {
		Ticket ticket1 = ticketBiz.getTicketById(ticket.getPrice_list());
		request.setAttribute("ticketinfo", ticket1);
		return "detail";
	}
	public String doUpdate() throws Exception {
		price_List.setTickets(ticket);
		ticket.setPrice_Lists(new HashSet<Price_List>());
		ticket.getPrice_Lists().add(price_List);
		int result = ticketBiz.updateTicket(ticket);
		if(result>0){
			return this.SUCCESS;
		}
		return this.ERROR;
	}	
/*----------------------查询车票-------------------------------*/
	public String excuteAjax(){
		int TicketNum=100;
//		System.out.println(ticket.getStart_station()+"-"+ticket.getEnd_station()+"-"+ticket.getStart_time());
		JSONObject object=new JSONObject();
		JSONObject object2=ticketBiz.getRequest5(ticket.getStart_station(),ticket.getEnd_station(),ticket.getStart_time());
		List<Ticket> ticketList=ticketBiz.getAll();
		JSONArray array=object2.getJSONObject("result").getJSONArray("list");
		if(object2!=null){
		for(int i=0;i<array.size();i++){ //网上数据库循环
			JSONObject o=array.getJSONObject(i);
			JSONArray priceList=o.getJSONArray("price_list"); //获取网上的价格列表
			for(int k=0;k<priceList.size();k++){   //网上价格列表循环
				TicketNum=100;
				for(int j=0;j<ticketList.size();j++){ //自己数据库循环
					String price_type=priceList.getJSONObject(k).getString("price_type"); //网上的票类型
					Set<Price_List> priceLi=ticketList.get(j).getPrice_Lists();
					for(Price_List p:priceLi){ //自己数据库的类型
						if(o.getString("train_no").equals(ticketList.get(j).getTrain_no())){ //判断列车号是否相同
							if(p.getPrice_type().equals(price_type)){  //判断车票类型是否相同
								if(ticket.getStart_time().equals(ticketList.get(j).getStart_time().substring(0, 10))){
									if(TicketNum>0){
										TicketNum--;
									}
								}
							}
						}
					}
				}
				
				object2.getJSONObject("result").getJSONArray("list").getJSONObject(i).getJSONArray("price_list").getJSONObject(k).put("ticket_num", TicketNum);
				
			}
		}
		}
		
		object.put("plist", object2.get("result"));
		result=object.toString();
		System.out.println(result);
		return "ticket";
	}
	
	
	public String pdyzm(){
		String yzmString;
		try {
		String inrandom=request.getParameter("inrandom");
		String trueRandom=(String) ActionContext.getContext().getSession().get("random");
		
		if(inrandom.equals(trueRandom)){
			yzmString="验证码准确";
			JSONObject object=new JSONObject();
			object.put("randomMes", yzmString);
			
			randomMessage=object.toString();
			
		}
		
		trueRandom=trueRandom.toLowerCase();
//		System.out.println(inrandom);
//		System.out.println(trueRandom+"---");
		if(inrandom.equals(trueRandom)){
			yzmString="验证码准确";
			JSONObject object=new JSONObject();
			object.put("randomMes", yzmString);
			
			randomMessage=object.toString();
			
		}else{
			yzmString="验证码错误";
			JSONObject object=new JSONObject();
			object.put("randomMes", yzmString);
			
			randomMessage=object.toString();
		} 
		} catch (Exception e) {
            e.printStackTrace();
        }
		return SUCCESS;
	}
	public String queryTrainNum(){
		try{
		String trainType=request.getParameter("train_type");
		JSONObject object1=ticketBiz.getRequest3(trainType);
		System.out.println(trainType);
		trainNum=object1.get("result").toString();
		System.out.println(trainNum);
		}catch (Exception e) {
            e.printStackTrace();
        }
		return "checi";
	}
	
	//创建订单
	public String doSaveTicketDetail() throws Exception{
		try {
			String[] ttype=request.getParameterValues("ttype");
			String ticketdate=request.getParameter("ticketdate");
			int uid=Integer.parseInt( request.getParameter("userid"));
			String train_no=request.getParameter("train_no");
			String train_type=request.getParameter("train_type");
			String start_station=request.getParameter("start_station");
			String end_station=request.getParameter("end_station");
			String start_time=request.getParameter("start_time");
			String end_time=request.getParameter("end_time");
			Ticket ticketdetail=new Ticket();
			ticketdetail.setUid(uid);
			ticketdetail.setTrain_no(train_no);
			ticketdetail.setTrain_type(train_type);
			ticketdetail.setStart_station(start_station);
			ticketdetail.setEnd_station(end_station);
			ticketdetail.setStart_time(start_time);
			ticketdetail.setEnd_time(end_time);
			HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("ticketdate", ticketdate);
			session.setAttribute("ticketdetail", ticketdetail);
			session.setAttribute("ttype", ttype);
//			System.out.println(ttype[1]);
//			System.out.println(uid+"-"+train_no+"-"+train_type+"-"+start_station+"-"+end_station+"-"+start_time+"-"+end_time+"-"+run_time);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "orderdetail";
	}
	
	//查询自己订单
	public String getMyOrder() throws Exception{
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			int train_no= (Integer) session.getAttribute("userid");
			List<Ticket> ticket=ticketBiz.getAll(); 
			List<Ticket> ticks=new ArrayList<Ticket>();
			for(Ticket t:ticket){
				if(t.getUid()==train_no){
					ticks.add(t);
				}
			}
			request.setAttribute("myorder", ticks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "myorder";
	}
	
	//创建订单
	public String createOrder() throws Exception{
		try {
			String ss=price_List.getPrice_type();
			price_List.setPrice(ss.substring(ss.indexOf("(")+1,ss.indexOf(")")));
			price_List.setPrice_type(ss.substring(0,ss.indexOf("(")));
			price_List.setTickets(ticket);
			ticket.setPrice_Lists(new HashSet<Price_List>());
			ticket.getPrice_Lists().add(price_List);
			int result=ticketBiz.addTicket(ticket);
			if(result>0){
				return "createorder";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.ERROR;
	}
	//删除订单
	public String doDeleteOrder() throws Exception{
		try {
			int result=ticketBiz.deleteTicket(ticket.getPrice_list());
			if(result>0){
				return "deleteorder";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.ERROR;
	}
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getRandomMessage() {
		return randomMessage;
	}

	public void setRandomMessage(String randomMessage) {
		this.randomMessage = randomMessage;
	}

	public String getTrainNum() {
		return trainNum;
	}

	public void setTrainNum(String trainNum) {
		this.trainNum = trainNum;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

	public Price_List getPrice_List() {
		return price_List;
	}
	public void setPrice_List(Price_List price_List) {
		this.price_List = price_List;
	}
	public TicketBiz getTicketBiz() {
		return ticketBiz;
	}

	public void setTicketBiz(TicketBiz ticketBiz) {
		this.ticketBiz = ticketBiz;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	
	
	
}
