﻿/**
  * @ cqiyi create in 2014-8-25 23:07:45 by Template
  * This class generated by Forever Web Rapid Framework Code Generator
  */
  
package hply.mapper;

import hply.domain.PartyBilling;
import hply.mapper.partial.PartialPartyBillingMapper;

import java.util.List;

import org.springframework.stereotype.Repository;



/**
  * 数据表： [t_party_billing]
  * 03_甲方开票情况
  */
@Repository
public interface PartyBillingMapper extends PartialPartyBillingMapper {

	/*
	 * 获取指定项目的已审核的开票额度
	 */
	public Double getCheckedAmount(String projectId);
	

	public List<PartyBilling> getAllByProject(String projectId);
}


