/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package dao;

import java.io.Serializable;
import java.util.List;

/**
 * @param <T>
 * @param <ID>
 */
public interface IBaseDao<T, ID extends Serializable> {

	/**
	 * 查询所有实体的集合
	 * 
	 * @param clazz
	 * @return
	 */
	List<T> findAll(Class<T> clazz);

	/**
	 * 根据id查询实体类对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	T findById(Class<T> clazz, ID id);

	/**
	 * 保存实体
	 * 
	 * @param t
	 */
	void save(T t);

	/**
	 * 删除指定实体
	 * 
	 * @param t
	 */
	void delete(T t);

	/**
	 * 更新或保存实体
	 * 
	 * @param t
	 */
	void saveOrUpdate(T t);

	/**
	 * 根据hql语句返回集合
	 * 
	 * @param hql
	 * @param values
	 * @return
	 */
	List<?> find(String hql, Object... values);

	T get(String hql, Object... values);
}