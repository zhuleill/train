package com.zl.dao;

import java.util.List;

import com.zl.entity.Ticket;

public interface TicketDao {
	public int addTicket(Ticket user);
	public int updateTicket(Ticket ticket);
	public int deleteTicket(int train_no);
	public List<Ticket> getAll();
	public Ticket getTicketById(int train_no);
}
