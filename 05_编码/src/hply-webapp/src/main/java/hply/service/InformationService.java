package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.Information;
import hply.domain.InformationCertificateAmount;
import hply.domain.ProjectSummary;
import hply.domain.Where;
import hply.mapper.InformationCertificateAmountMapper;
import hply.mapper.InformationMapper;
import hply.mapper.SysOrganizationMapper;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

/**
 * 10_信息登记，服务类
 */
public class InformationService {
    Logger logger = LoggerFactory.getLogger(InformationService.class);


	@Autowired
    private InformationMapper mapper;

	@Autowired
	private SysOrganizationMapper orgMapper;
	
	@Autowired
    private InformationCertificateAmountMapper informationCertificateAmountMapper;
    
    /**
     * 10_信息登记，插入对象
     */
	  public void insert(Information information){
        information.setCreateUser(SessionHelper.getCurrentUserId());
        mapper.insert(information);
      }
      
	  /**
     * 10_信息登记，不进行冲突检测的更新
     */
	  public void update(Information information){
        information.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(information);
      }
      
    /**
     * 10_信息登记，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(Information information){
      information.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(information.getId()) != information.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_information.id=" + information.getId() );
          }
        mapper.update(information);
      }
      
	  /**
     * 10_信息登记，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 10_信息登记，根据主键获取一个对象
     */
	  public Information get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 10_信息登记，获取所有对象
     */
	  public List<Information> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 10_信息登记，获取记录总行数
     */
	  public int getRowCount(Where where){
        return mapper.getRowCount(where);
      }
      
	  /**
     * 10_信息登记，获取所有对象，分页方式
     */
	  public List<Information> getAllPaged(Where where){
        return mapper.getAllPaged(where);
      }
      
	  /**
     * 10_信息登记，获取所有对象
     */
	  public List<Information> getAllBy(String p1, String p2, String organizationId){
        return mapper.getAllBy(p1,p2,organizationId);
      }
	  
	  
	  public Map<String,Object> getSimilarity(String text) {
			return mapper.getSimilarity(text);
		}
	  
	  public List<String> getMonths() {
			return mapper.getMonths();
		}
  
		public List<Map<String,Object>> getExport(List<Information> list) {
			List<Map<String,Object>> listExport = new ArrayList<Map<String,Object>>();
			Map<String,Object> item,subtotal;
			for (Information info : list) {
				item = new HashMap<String,Object>();
				item.put("id", info.getId());
				item.put("organizationId", info.getOrganizationId());
				item.put("organizationName", orgMapper.get(info.getOrganizationId()).getOrganizationName());
				item.put("projectName", info.getProjectName());
				item.put("address", info.getAddress());
				item.put("constructionCompany", info.getConstructionCompany());
				item.put("generalContractor", info.getGeneralContractor());
				item.put("joinRealName", info.getJoinRealName());
				item.put("decorationType", info.getDecorationType());
				item.put("quantities", info.getQuantities());
				item.put("serviceAmount", info.getServiceAmount());
				item.put("payFlag", info.getPayFlag());
				item.put("payTime", info.getPayTime());
				item.put("payUser", info.getPayUser());
				item.put("sealFlag", info.getSealFlag());
				item.put("sealTime", info.getSealTime());
				item.put("sealUser", info.getSealUser());
				item.put("auditTime", info.getAuditTime());
				item.put("auditUser", info.getAuditUser());
				item.put("subscriber", info.getSubscriber());
				item.put("trice", DateFormatUtils.format(info.getTrice(), "yyyy-MM-dd"));
				item.put("description", info.getDescription());
		        
				List<InformationCertificateAmount> listAmount = informationCertificateAmountMapper.getAllByInfo(info.getId());
				item.put("listAmount", listAmount);
				int childSize = listAmount.size();
				item.put("childSize", childSize > 0 ? childSize+1 : childSize);

				item.put("planAmount",0);
				item.put("realAmount",0);
				item.put("oweAmount",0);
				for(InformationCertificateAmount amount : listAmount){
					item.put("planAmount", Double.parseDouble(item.get("planAmount").toString()) + amount.getPlanAmount());
					item.put("realAmount", Double.parseDouble(item.get("realAmount").toString()) + amount.getRealAmount());
					item.put("oweAmount", Double.parseDouble(item.get("oweAmount").toString()) + amount.getOweAmount());
				}
				subtotal = new HashMap<String,Object>();
				subtotal.put("title", "小计");
				subtotal.put("planAmount", item.get("planAmount"));
				subtotal.put("realAmount", item.get("realAmount"));
				subtotal.put("oweAmount", item.get("oweAmount"));
				item.put("subtotal", subtotal);
				listExport.add(item);
			}
			return listExport;
		}
		

		public Map<String,Object> getTotal(List<Map<String,Object>> list) {
			Map<String,Object> total = new HashMap<String,Object>();
			total.put("title", "合计");
			total.put("serviceAmount", 0);
			total.put("planAmount", 0);
			total.put("realAmount", 0);
			total.put("oweAmount", 0);
			if(list.size() > 0){
				for (Map<String,Object> item : list) {
					total.put("serviceAmount", Double.parseDouble(total.get("serviceAmount").toString()) + Double.parseDouble(item.get("serviceAmount").toString()));
					total.put("planAmount", Double.parseDouble(total.get("planAmount").toString()) + Double.parseDouble(item.get("planAmount").toString()));
					total.put("realAmount", Double.parseDouble(total.get("realAmount").toString()) + Double.parseDouble(item.get("realAmount").toString()));
					total.put("oweAmount", Double.parseDouble(total.get("oweAmount").toString()) + Double.parseDouble(item.get("oweAmount").toString()));
				}
			}
			return total;
		}
		
}

