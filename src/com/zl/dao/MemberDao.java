package com.zl.dao;

import java.util.List;


public interface MemberDao {    
/**   
 * ��ҳ��ѯ   
 * @param hql  ��ѯ����   
 * @param offset  ��ʼ��¼   
 * @param length  һ�β�ѯ������¼   
 * @return ��ѯ�ļ�¼����   
 */    
public List<Object> queryForPage(final String hql,final int offset,final int length);    
/**   
 * ��ѯ���еļ�¼��   
 * @param hql ��ѯ����   
 * @return �ܼ�¼��   
 */    
public int getAllRowCount(String hql);    
}    