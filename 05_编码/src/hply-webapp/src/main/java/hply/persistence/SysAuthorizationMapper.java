﻿/**
 * @Template info: 2013/08/16, Chengqiyi.
 * ChengQiyi create in 2014-7-13 15:01:55
 * This class generated by CodeSmith Generator
 */

package hply.persistence;

import hply.domain.SysAuthorization;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository(value = "sysAuthorizationMapper")
public interface SysAuthorizationMapper {

	public void insert(SysAuthorization sysAuthorization);

	public void update(SysAuthorization sysAuthorization);

	public void delete(String id);

	public SysAuthorization get(String id);

	public List<SysAuthorization> getAll();
}
