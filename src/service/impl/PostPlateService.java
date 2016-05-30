/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service.impl;

import java.util.List;

import model.Postplate;
import service.IPostPlateService;
import dao.IBaseDao;

/**
 * 
 */
public class PostPlateService implements IPostPlateService {

	private IBaseDao<Postplate, Integer> baseDao;

	public void setBaseDao(IBaseDao<Postplate, Integer> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Postplate> findAll() {
		return baseDao.findAll(Postplate.class);
	}

	@Override
	public Postplate findById(Integer id) {
		return baseDao.findById(Postplate.class, id);
	}

	@Override
	public void delete(int id) {
		Postplate postplate = findById(id);
		baseDao.delete(postplate);
	}

	@Override
	public void save(Postplate postplate) {
		baseDao.save(postplate);
	}

	@Override
	public void saveOrUpdate(Postplate postplate) {
		baseDao.saveOrUpdate(postplate);
	}

	@Override
	public void modifyPlateInfo(int plateid, String platename) {
		Postplate postplate = findById(plateid);
		postplate.setPlatename(platename);
		saveOrUpdate(postplate);
	}

}
