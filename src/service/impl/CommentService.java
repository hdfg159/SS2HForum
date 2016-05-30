/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service.impl;

import java.util.List;

import model.Comments;
import service.ICommentService;
import dao.IBaseDao;

/**
 * 
 */
public class CommentService implements ICommentService {
	private IBaseDao<Comments, Integer> baseDao;

	public void setBaseDao(IBaseDao<Comments, Integer> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void delete(int id) {
		Comments comment = baseDao.findById(Comments.class, id);
		baseDao.delete(comment);
	}

	@Override
	public void save(Comments comment) {
		baseDao.save(comment);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comments> findPostInAll(int postid) {
		return (List<Comments>) baseDao.find(
				"from Comments c where c.post.id=?", postid);
	}

}
