package com.zl.entity;

import java.io.Serializable;
import java.util.Set;

public class Price_List  implements Serializable{
	
	private int price_no;
	private String price_type;
	private String price;
	private Ticket tickets;
	
	public Price_List(){
		
	}
	
	public int getPrice_no() {
		return price_no;
	}
	public void setPrice_no(int price_no) {
		this.price_no = price_no;
	}
	public String getPrice_type() {
		return price_type;
	}
	public void setPrice_type(String price_type) {
		this.price_type = price_type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	public Ticket getTickets() {
		return tickets;
	}

	public void setTickets(Ticket tickets) {
		this.tickets = tickets;
	}

	
}
