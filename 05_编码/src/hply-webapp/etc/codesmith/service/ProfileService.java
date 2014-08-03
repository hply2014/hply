package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import hply.domain.Profile;
import hply.mapper.ProfileMapper;
import hply.core.DataVersionConflictException;

@Service

/**
 * 08_型材，服务类
 */
public class ProfileService {
    Logger logger = LoggerFactory.getLogger(ProfileService.class);
    
	@Autowired
    private ProfileMapper mapper;
    
    /**
     * 08_型材，插入对象
     */
	  public void insert(Profile profile){
        mapper.insert(profile);
      }
      
	  /**
     * 08_型材，不进行冲突检测的更新
     */
	  public void update(Profile profile){
        mapper.update(profile);
      }
      
    /**
     * 08_型材，更新数据前检测冲突，防止并发更新错误。
     */
	  public void updateNoConflict(Profile profile){
      if(mapper.getVersion(profile.getId()) != profile.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_profile.id=" + profile.getId() );
          }
        mapper.update(profile);
      }
      
	  /**
     * 08_型材，根据主键删除对象
     */
	  public void delete(String id){
        mapper.delete(id);
      }
	  /**
     * 08_型材，根据主键获取一个对象
     */
	  public Profile get(String id){
        return mapper.get(id);
      }
	  /**
     * 08_型材，获取所有对象
     */
	  public List<Profile> getAll(){
        return mapper.getAll();
      }
}

