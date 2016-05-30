/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service.impl;

import java.util.List;

import model.Posts;
import service.IPostService;
import dao.IBaseDao;

/**
 * 
 */
public class PostService implements IPostService {
	private IBaseDao<Posts, Integer> baseDao;

	public void setBaseDao(IBaseDao<Posts, Integer> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Posts> findAll() {
		return baseDao.findAll(Posts.class);
	}

	@Override
	public Posts findById(Integer id) {
		return baseDao.findById(Posts.class, id);
	}

	@Override
	public void save(Posts post) {
		baseDao.save(post);
	}

	@Override
	public void delete(int id) {
		Posts post = findById(id);
		baseDao.delete(post);
	}

	@Override
	public void saveOrUpdate(Posts post) {
		baseDao.saveOrUpdate(post);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Posts> keySearch(String key) {
		String skey = "%" + key + "%";
		List<?> results = baseDao
				.find("SELECT posts FROM Posts posts WHERE posts.content LIKE ? or posts.title LIKE ?",
						skey, skey);
		return (List<Posts>) results;
	}

	@Override
	public void top(int id) {
		Posts post = findById(id);
		if (post.getPosition() == 0) {
			post.setPosition(1);
		} else {
			post.setPosition(0);
		}
		saveOrUpdate(post);
	}

	@Override
	public List<Posts> findPlateInAll(int plateid) {
		@SuppressWarnings("unchecked")
		List<Posts> posts = (List<Posts>) baseDao.find(
				"from Posts p where p.plate.id=?", plateid);
		// PostsUtil.sortpost(posts, "position");
		return posts;
	}

}
