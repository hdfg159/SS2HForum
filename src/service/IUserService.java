/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service;

import java.util.List;

import model.Usertable;

/**
 * 
 */
public interface IUserService {
	List<Usertable> findAll();

	Usertable findById(Integer id);

	void delete(int id);

	void save(Usertable usertable);

	void saveOrUpdate(Usertable usertable);

	void webAdmin(int id);

	void plateAdmin(int id, int plateId);

	Usertable check(String username, String password);

	void modifyPassword(int id, String password);

	void modifyInformation(int id, String sex, String qq, String phonenum,
			String mail);

	void modHeadIcon(int id, String headname);
}
