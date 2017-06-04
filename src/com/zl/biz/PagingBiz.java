package com.zl.biz;

import com.zl.entity.PageBean;

public interface PagingBiz {
	public PageBean queryUserInfoForPage(int pageSize,int page);  
	public PageBean queryOrderForPage(int pageSize,int page);  
	public PageBean queryNewsForPage(int pageSize,int page);
	public PageBean queryMyOrderForPage(int pageSize,int page,int uid); 
	public PageBean queryMyConnectionForPage(int pageSize,int page,int uid); 
}
