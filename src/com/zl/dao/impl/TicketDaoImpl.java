package com.zl.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zl.dao.TicketDao;
import com.zl.entity.Ticket;

public class TicketDaoImpl  extends HibernateDaoSupport implements TicketDao{
	public int addTicket(Ticket ticket) {
		int count=0;
		try {
			this.getHibernateTemplate().save(ticket);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int deleteTicket(int train_no) {
		int count=0;
		Ticket ticket = getTicketById(train_no);
//		ticket.setPrice_list(train_no);
//		Set<Price_List> price_Lists=new HashSet<Price_List>();
//		price_Lists=ticket.getPrice_Lists();
//		ticket.setPrice_Lists(new HashSet<Price_List>());
//		for(Price_List price_List:price_Lists){
//			price_List.setTickets(ticket);
//			
//			ticket.getPrice_Lists().add(price_List);
//		}
		
		try {
			this.getHibernateTemplate().delete(ticket);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Ticket> getAll() {
		return this.getHibernateTemplate().find("from Ticket");
	}

	public Ticket getTicketById(int train_no) {
		return (Ticket)this.getHibernateTemplate().get(Ticket.class, train_no);
	}

	public int updateTicket(Ticket ticket) {
		int count=0;
		try {
			this.getHibernateTemplate().update(ticket);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

}
