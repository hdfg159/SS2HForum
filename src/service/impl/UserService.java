/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service.impl;

import java.util.List;

import model.Usertable;
import service.IUserService;
import dao.IBaseDao;

/**
 * 
 */
public class UserService implements IUserService {
	private IBaseDao<Usertable, Integer> baseDao;

	public void setBaseDao(IBaseDao<Usertable, Integer> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Usertable> findAll() {
		return baseDao.findAll(Usertable.class);
	}

	@Override
	public Usertable findById(Integer id) {
		return baseDao.findById(Usertable.class, id);
	}

	@Override
	public void delete(int id) {
		Usertable usertable = findById(id);
		baseDao.delete(usertable);
	}

	@Override
	public void save(Usertable usertable) {
		baseDao.save(usertable);
	}

	@Override
	public void saveOrUpdate(Usertable usertable) {
		baseDao.saveOrUpdate(usertable);
	}

	@Override
	public void webAdmin(int id) {
		Usertable user = findById(id);
		if (user.getRank() == 1) {
			user.setRank(0);
		} else {
			user.setRank(1);
		}
		user.setPlateid(0);
		saveOrUpdate(user);
	}

	@Override
	public void plateAdmin(int id, int plateId) {
		Usertable user = findById(id);
		if (user.getRank() == 2) {
			user.setRank(0);
			user.setPlateid(0);
		} else {
			user.setRank(2);
			user.setPlateid(plateId);
		}
		saveOrUpdate(user);
	}

	@Override
	public Usertable check(String username, String password) {
		return baseDao.get("from Usertable where username=? and password=?",
				username, password);
	}

	@Override
	public void modifyPassword(int id, String password) {
		Usertable usertable = findById(id);
		usertable.setPassword(password);
		saveOrUpdate(usertable);
	}

	@Override
	public void modifyInformation(int id, String sex, String qq,
			String phonenum, String mail) {
		Usertable usertable = findById(id);
		usertable.setSex(sex);
		usertable.setQq(qq);
		usertable.setPhonenum(phonenum);
		usertable.setMail(mail);
		saveOrUpdate(usertable);
	}

	@Override
	public void modHeadIcon(int id, String headname) {
		Usertable usertable = findById(id);
		usertable.setHead(headname);
		saveOrUpdate(usertable);
	}

}
