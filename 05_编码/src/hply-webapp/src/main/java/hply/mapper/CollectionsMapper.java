﻿/**
 * @ cqiyi create in 2014-8-5 20:27:38 by Template
 * This class generated by Forever Web Rapid Framework Code Generator
 */

package hply.mapper;

import org.springframework.stereotype.Repository;

import hply.mapper.partial.PartialCollectionsMapper;

/**
 * 数据表： [t_collections] 05_收款情况
 */
@Repository
public interface CollectionsMapper extends PartialCollectionsMapper {
	public Double getTotalProjectAmount(String projectId);
}
