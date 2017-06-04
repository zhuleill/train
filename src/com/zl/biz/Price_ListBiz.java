package com.zl.biz;

import java.util.List;

import com.zl.entity.Price_List;

public interface Price_ListBiz {
	public int addPrice_List(Price_List price_list);
	public int updatePrice_List(Price_List price_list);
	public int deletePrice_List(int price_list);
	public List<Price_List> getAll();
	public Price_List getPrice_ListById(int price_list);
}
