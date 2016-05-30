/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package service;

import java.util.List;

import model.Postplate;

/**
 * 
 */
public interface IPostPlateService {
	List<Postplate> findAll();

	Postplate findById(Integer id);

	void delete(int id);

	void save(Postplate postplate);

	void saveOrUpdate(Postplate postplate);

	void modifyPlateInfo(int plateid, String platename);
}
