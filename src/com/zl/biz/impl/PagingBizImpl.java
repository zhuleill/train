package com.zl.biz.impl;

import java.util.List;

import com.zl.biz.PagingBiz;
import com.zl.dao.MemberDao;
import com.zl.entity.PageBean;

public class PagingBizImpl implements PagingBiz{
	private MemberDao memberDao;
	public PageBean queryUserInfoForPage(int pageSize, int page) {    
		final String hql = "from Userinfo user order by user.uid"; //查询语句    
		int allRow = memberDao.getAllRowCount(hql);  //总记录数    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //总页数    
		final int offset = PageBean.countOffset(pageSize, page); //当前页开始记录    
		final int length = pageSize; // 每页记录数    
		final int currentPage = PageBean.countCurrentPage(page); // 当前页    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//把分页信息保存到Bean当中    
		PageBean pageBean  = new PageBean();    
		pageBean.setPageSize(pageSize);    
		pageBean.setCurrentPage(currentPage);    
		pageBean.setAllRow(allRow);    
		pageBean.setTotalPage(totalPage);    
		pageBean.setList(list);    
		pageBean.init();    
		return pageBean;    
		}
	
	public PageBean queryOrderForPage(int pageSize, int page) {    
		final String hql = "from Ticket ticket order by ticket.price_list"; //查询语句    
		int allRow = memberDao.getAllRowCount(hql);  //总记录数    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //总页数    
		final int offset = PageBean.countOffset(pageSize, page); //当前页开始记录    
		final int length = pageSize; // 每页记录数    
		final int currentPage = PageBean.countCurrentPage(page); // 当前页    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//把分页信息保存到Bean当中    
		PageBean pageBean  = new PageBean();    
		pageBean.setPageSize(pageSize);    
		pageBean.setCurrentPage(currentPage);    
		pageBean.setAllRow(allRow);    
		pageBean.setTotalPage(totalPage);    
		pageBean.setList(list);    
		pageBean.init();    
		return pageBean;    
		}
	
	public PageBean queryMyOrderForPage(int pageSize, int page,int uid) {    
		final String hql = "from Ticket ticket where ticket.uid = "+uid+" order by ticket.start_time DESC"; //查询语句    
		int allRow = memberDao.getAllRowCount(hql);  //总记录数    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //总页数    
		final int offset = PageBean.countOffset(pageSize, page); //当前页开始记录    
		final int length = pageSize; // 每页记录数    
		final int currentPage = PageBean.countCurrentPage(page); // 当前页    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//把分页信息保存到Bean当中    
		PageBean pageBean  = new PageBean();    
		pageBean.setPageSize(pageSize);    
		pageBean.setCurrentPage(currentPage);    
		pageBean.setAllRow(allRow);    
		pageBean.setTotalPage(totalPage);    
		pageBean.setList(list);    
		pageBean.init();    
		return pageBean;    
		}
	
	public PageBean queryMyConnectionForPage(int pageSize, int page,int uid) {    
		final String hql = "from Connection c where c.uid = "+uid+" order by c.conid"; //查询语句    
		int allRow = memberDao.getAllRowCount(hql);  //总记录数    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //总页数    
		final int offset = PageBean.countOffset(pageSize, page); //当前页开始记录    
		final int length = pageSize; // 每页记录数    
		final int currentPage = PageBean.countCurrentPage(page); // 当前页    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//把分页信息保存到Bean当中    
		PageBean pageBean  = new PageBean();    
		pageBean.setPageSize(pageSize);    
		pageBean.setCurrentPage(currentPage);    
		pageBean.setAllRow(allRow);    
		pageBean.setTotalPage(totalPage);    
		pageBean.setList(list);    
		pageBean.init();    
		return pageBean;    
		}
	
	
	public PageBean queryNewsForPage(int pageSize, int page) {    
		final String hql = "from News news order by news.newsid"; //查询语句    
		int allRow = memberDao.getAllRowCount(hql);  //总记录数    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //总页数    
		final int offset = PageBean.countOffset(pageSize, page); //当前页开始记录    
		final int length = pageSize; // 每页记录数    
		final int currentPage = PageBean.countCurrentPage(page); // 当前页    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//把分页信息保存到Bean当中    
		PageBean pageBean  = new PageBean();    
		pageBean.setPageSize(pageSize);    
		pageBean.setCurrentPage(currentPage);    
		pageBean.setAllRow(allRow);    
		pageBean.setTotalPage(totalPage);    
		pageBean.setList(list);    
		pageBean.init();    
		return pageBean;    
		}
	
	
	public MemberDao getMemberDao() {
		return memberDao;
	}
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}    
	
}
