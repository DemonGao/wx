package com.wxkf.Do;

import java.io.Serializable;
import java.util.List;

import org.hibernate.CacheMode;
import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.wxkf.Po.StudentExperience;
import com.wxkf.hibernate.HibernateSessionFactory;

public class BaseHibernateDAO implements IBaseHibernateDAO {

	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}

	public void closeSession() {
		HibernateSessionFactory.closeSession();
	}

	/**
	 * 添加实体
	 * 
	 * @param obj
	 *            ，要添加的实体对象
	 * @throws Exception
	 */
	public void add(Object obj) throws Exception {
		// 开启会话
		Session session = getSession();
		Transaction tc = null;
		try {
			tc = session.beginTransaction();
			// 执行操作
			session.save(obj);
			tc.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			tc.rollback();
		} finally {
			// 关闭会话
			closeSession();
		}
	}

	/**
	 * 删除实体
	 * 
	 * @param obj
	 *            ，要删除的实体
	 * @throws Exception
	 */
	public void delete(Class cls, Serializable key) {
		// 开启会话
		Session session = getSession();
		// 开启事务
		Transaction tc = null;
		try {
			tc = session.beginTransaction();
			Object obj = session.load(cls, key);
			// 删除实体
			if (obj != null) {
				session.delete(obj);
			}
			// 提交事务
			tc.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			tc.rollback();
		} finally {
			closeSession();
		}
	}

	public void del(Object obj){
		Configuration cfg = new AnnotationConfiguration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session Ssession = sf.openSession();
		Ssession.beginTransaction();
		Ssession.delete(obj);
		Ssession.getTransaction().commit();
		Ssession.close();
		sf.close();
	}
	
	/**
	 * 更新实体
	 * 
	 * @param obj
	 *            ，要更新的实体
	 * @throws Exception
	 */
	public void update(Object obj) throws Exception {
		// 开启会话
		Session session = getSession();
		// 开启事务
		Transaction tc = null;
		try {
			tc = session.beginTransaction();
			// 执行操作
			session.update(obj);
			
			tc.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tc.rollback();
		} finally {
			closeSession();
		}
	}

	/**
	 * 根据指定的hql进行查询，并返回查询结果
	 * 
	 * @param hql
	 *            ，hql语句
	 * @return 查询结果
	 * @throws Exception
	 */
	public List<?> findByHQL(String hql) throws Exception {
		// 开启会话
		Session session = getSession();
		List<?> list = null;
		Transaction tc = null;
		try {
			tc = session.beginTransaction();
			Query query = session.createQuery(hql);
			list = query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tc.rollback();
		} finally {
			// 关闭会话
			closeSession();
		}
		return list;
	}

	/**
	 * 根据指定的hql进行分页查询，并返回查询结果
	 * 
	 * @param hql
	 *            ，hql语句
	 * @return 查询结果
	 * @throws Exception
	 */
	public List<?> findByHQL(String hql, int index, int num) throws Exception {
		// 开启会话
		Session session = getSession();
		List<?> list = null;
		Transaction tc = null;
		try {
			tc = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setFirstResult(index);
			query.setMaxResults(num);
			list = query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tc.rollback();
		} finally {
			// 关闭会话
			closeSession();
		}
		return list;
	}

	/**
	 * 根据指定的实体类型和主键的值，查找实体对象
	 * 
	 * @param cls
	 *            ，实体的类
	 * @param key
	 *            ，主键的值
	 * @return，查找的实体对象
	 * @throws Exception
	 */
	public Object findById(String cls, Serializable key) throws Exception

	{
		Session session = getSession();
		// 开启事务
		Transaction tc = null;
		Object instance = null;
		try {
			tc = session.beginTransaction();
			instance = (Object) session.get(cls, key);
			tc.commit();
			
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tc.rollback();
		} finally {
			closeSession();
		}
		return instance;
	}

	public Object findById(Class cls, Serializable key) throws Exception {
		Session session = getSession();
		// 开启事务
		Object instance = null;
		try {
			instance = (Object) session.get(cls, key);
			
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeSession();
		}
		return instance;
	}
}