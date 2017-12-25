package hply.service;

import hply.core.DataVersionConflictException;
import hply.core.SessionHelper;
import hply.domain.SysParameter;
import hply.mapper.SysParameterMapper;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

/**
 * 14_系统参数，服务类
 */
public class SysParameterService {
    Logger logger = LoggerFactory.getLogger(SysParameterService.class);
    
	@Autowired
    private SysParameterMapper mapper;
    
    /**
     * 14_系统参数，插入对象
     */
	  public void insert(SysParameter sysParameter){
        sysParameter.setCreateUser(SessionHelper.getCurrentUserId());
        mapper.insert(sysParameter);
      }
      
	  /**
     * 14_系统参数，不进行冲突检测的更新
     */
	  public void update(SysParameter sysParameter){
        sysParameter.setUpdateUser(SessionHelper.getCurrentUserId());
        mapper.update(sysParameter);
      }
      
    /**
     * 14_系统参数，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(SysParameter sysParameter){
      sysParameter.setUpdateUser(SessionHelper.getCurrentUserId());
      if(mapper.getVersion(sysParameter.getId()) != sysParameter.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_sys_parameter.id=" + sysParameter.getId() );
          }
        mapper.update(sysParameter);
      }
      
	  /**
     * 14_系统参数，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 14_系统参数，根据主键获取一个对象
     */
	  public SysParameter get(String id){
        return mapper.get(id);
      }
      
	  /**
     * 14_系统参数，获取所有对象
     */
	  public List<SysParameter> getAll(){
        return mapper.getAll();
      }
      
	  /**
     * 14_系统参数，获取记录总行数
     */
	  public int getRowCount(){
        return mapper.getRowCount();
      }
      
	  /**
     * 14_系统参数，获取所有对象，分页方式
     */
	  public List<SysParameter> getAllPaged(int pageIndex, int pageSize){
        return mapper.getAllPaged(pageIndex, pageSize);
      }

		public SysParameter getByEnName(String enName) {
			return mapper.getByEnName(enName);
		}

		public String getNextCode(String prefixCode) {
			return mapper.getNextCode(prefixCode);
		}

		public int getParamIntValue(String enName, int defaultValue) {
			try {
				SysParameter p = getByEnName(enName);
				return Integer.valueOf(p.getParamValue());
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return defaultValue;
		}

		public double getParamDoubleValue(String enName) {
			try {
				SysParameter p = getByEnName(enName);
				return Double.valueOf(p.getParamValue());
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return 0.0;

		}

	}
