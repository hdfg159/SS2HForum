/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import dao.IBaseDao;

@SuppressWarnings("unchecked")
public class BaseDao<T, ID extends Serializable> implements IBaseDao<T, ID> {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * 查询所有实体的集合
	 * 
	 * @param clazz
	 * @return
	 */
	@Override
	public List<T> findAll(Class<T> clazz) {
		try {
			return getCurrentSession().createQuery("from " + clazz.getName())
					.list();
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 根据id查询实体类对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	@Override
	public T findById(Class<T> clazz, ID id) {
		try {
			return (T) getCurrentSession().get(clazz, id);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 保存实体
	 * 
	 * @param t
	 */
	@Override
	public void save(T t) {
		try {
			getCurrentSession().save(t);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 删除指定实体
	 * 
	 * @param t
	 */
	@Override
	public void delete(T t) {
		try {
			getCurrentSession().delete(t);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 更新或保存实体
	 * 
	 * @param t
	 */
	@Override
	public void saveOrUpdate(T t) {
		try {
			getCurrentSession().saveOrUpdate(t);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 根据hql语句返回集合
	 * 
	 * @param hql
	 * @param values
	 * @return
	 */
	@Override
	public List<?> find(String hql, Object... values) {
		try {
			Query query = getCurrentSession().createQuery(hql);
			if (values != null && values.length > 0) {
				for (int i = 0; i < values.length; i++) {
					query.setParameter(i, values[i]);
				}
			}
			return query.list();
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 根据条件查询实体类对象
	 */
	@Override
	public T get(String hql, Object... values) {
		try {
			Query query = getCurrentSession().createQuery(hql);
			if (values != null && values.length > 0) {
				for (int i = 0; i < values.length; i++) {
					query.setParameter(i, values[i]);
				}
			}
			List<T> list = query.list();
			if (list != null && list.size() > 0) {
				return list.get(0);
			} else {
				return null;
			}
		} catch (RuntimeException e) {
			throw e;
		}
	}
}
