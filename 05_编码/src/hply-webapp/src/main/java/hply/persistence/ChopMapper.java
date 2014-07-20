﻿/**
 * @Template info: 2013/08/16, Chengqiyi.
 * ChengQiyi create in 2014-7-13 15:01:55
 * This class generated by CodeSmith Generator
 */

package hply.persistence;

import hply.domain.Chop;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository(value = "chopMapper")
public interface ChopMapper {

	public void insert(Chop chop);

	public void update(Chop chop);

	public void delete(String id);

	public Chop get(String id);

	public List<Chop> getAll();
}
