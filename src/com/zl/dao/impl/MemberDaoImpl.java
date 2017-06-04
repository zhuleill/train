package com.zl.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zl.dao.MemberDao;

public class MemberDaoImpl extends HibernateDaoSupport implements MemberDao {
	/**
	 * ��ѯ���еļ�¼��
	 * 
	 * @param hql
	 *            ��ѯ����
	 * @return �ܼ�¼��
	 */
	public int getAllRowCount(String hql) {
		return this.getHibernateTemplate().find(hql).size();
	}

	/**
	 * ��ҳ��ѯ
	 * 
	 * @param hql
	 *            ��ѯ����
	 * @param offset
	 *            ��ʼ��¼
	 * @param length
	 *            һ�β�ѯ������¼
	 * @return ��ѯ�ļ�¼����
	 */
	@SuppressWarnings("unchecked")
	public List<Object> queryForPage(final String hql, final int offset,
			final int length) {
		Session session = this.getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		List<Object> list = q.list();
//		System.out.println(list.size());
//		session.close();
		return list;
	}
}