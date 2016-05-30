/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service;

import java.util.List;

import model.Posts;

/**
 * 
 */
public interface IPostService {
	List<Posts> findAll();

	List<Posts> findPlateInAll(int plateid);

	Posts findById(Integer id);

	void save(Posts post);

	void delete(int id);

	void saveOrUpdate(Posts post);

	List<Posts> keySearch(String key);

	void top(int id);
}
