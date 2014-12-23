﻿/**
 * @ cqiyi create in 2014-8-25 23:07:45 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper.partial;

import hply.domain.Arrears;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 数据表： [t_arrears] 07_往来欠款
 */
@Repository
public interface PartialArrearsMapper {

	public void insert(Arrears arrears);

	public void update(Arrears arrears);

	public void delete(String id);

	public void check(String id);

	public Arrears get(String id);

	public int getVersion(String id);

	public List<Arrears> getAll();

	public int getRowCount();

	public List<Arrears> getAllPaged(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
}
