﻿/**
 * @ cqiyi create in 2014/7/24 20:53:29 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper;

import hply.domain.Chop;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_chop]
 * 
 */
@Repository
public interface ChopMapper {

	public void insert(Chop chop);

	public void update(Chop chop);

	public void delete(String id);

	public Chop get(String id);

	public int getVersion(String id);

	public List<Chop> getAll();
}
