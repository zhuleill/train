package com.zl.biz.impl;

import java.util.List;

import com.zl.biz.PagingBiz;
import com.zl.dao.MemberDao;
import com.zl.entity.PageBean;

public class PagingBizImpl implements PagingBiz{
	private MemberDao memberDao;
	public PageBean queryUserInfoForPage(int pageSize, int page) {    
		final String hql = "from Userinfo user order by user.uid"; //��ѯ���    
		int allRow = memberDao.getAllRowCount(hql);  //�ܼ�¼��    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //��ҳ��    
		final int offset = PageBean.countOffset(pageSize, page); //��ǰҳ��ʼ��¼    
		final int length = pageSize; // ÿҳ��¼��    
		final int currentPage = PageBean.countCurrentPage(page); // ��ǰҳ    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//�ѷ�ҳ��Ϣ���浽Bean����    
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
		final String hql = "from Ticket ticket order by ticket.price_list"; //��ѯ���    
		int allRow = memberDao.getAllRowCount(hql);  //�ܼ�¼��    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //��ҳ��    
		final int offset = PageBean.countOffset(pageSize, page); //��ǰҳ��ʼ��¼    
		final int length = pageSize; // ÿҳ��¼��    
		final int currentPage = PageBean.countCurrentPage(page); // ��ǰҳ    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//�ѷ�ҳ��Ϣ���浽Bean����    
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
		final String hql = "from Ticket ticket where ticket.uid = "+uid+" order by ticket.start_time DESC"; //��ѯ���    
		int allRow = memberDao.getAllRowCount(hql);  //�ܼ�¼��    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //��ҳ��    
		final int offset = PageBean.countOffset(pageSize, page); //��ǰҳ��ʼ��¼    
		final int length = pageSize; // ÿҳ��¼��    
		final int currentPage = PageBean.countCurrentPage(page); // ��ǰҳ    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//�ѷ�ҳ��Ϣ���浽Bean����    
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
		final String hql = "from Connection c where c.uid = "+uid+" order by c.conid"; //��ѯ���    
		int allRow = memberDao.getAllRowCount(hql);  //�ܼ�¼��    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //��ҳ��    
		final int offset = PageBean.countOffset(pageSize, page); //��ǰҳ��ʼ��¼    
		final int length = pageSize; // ÿҳ��¼��    
		final int currentPage = PageBean.countCurrentPage(page); // ��ǰҳ    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//�ѷ�ҳ��Ϣ���浽Bean����    
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
		final String hql = "from News news order by news.newsid"; //��ѯ���    
		int allRow = memberDao.getAllRowCount(hql);  //�ܼ�¼��    
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //��ҳ��    
		final int offset = PageBean.countOffset(pageSize, page); //��ǰҳ��ʼ��¼    
		final int length = pageSize; // ÿҳ��¼��    
		final int currentPage = PageBean.countCurrentPage(page); // ��ǰҳ    
		List<Object> list = memberDao.queryForPage(hql, offset, length); //    
		//�ѷ�ҳ��Ϣ���浽Bean����    
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
