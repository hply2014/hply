package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.SysUser;
import hply.mapper.SysUserMapper;

@Service
public class SysUserService {
    
	@Autowired
    private SysUserMapper mapper;

	  public void insert(SysUser sysUser){
        mapper.insert(sysUser);
      }
	  
	  public void update(SysUser sysUser){
        mapper.update(sysUser);
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public SysUser get(String id){
        return mapper.get(id);
      }
	  
	  public List<SysUser> getAll(){
        return mapper.getAll();
      }
}

