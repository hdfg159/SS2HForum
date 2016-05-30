/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service;

import java.util.List;

import model.Comments;

/**
 * 
 */
public interface ICommentService {
	List<Comments> findPostInAll(int postid);

	void delete(int id);

	void save(Comments comment);
}
