package org.hhwy.rdc.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.rdc.fweb1.DataVersionConflictException;
import org.hhwy.rdc.fweb1.domain.Profile;
import org.hhwy.rdc.fweb1.mapper.ProfileMapper;

@Service
public class ProfileService {
    
	@Autowired
    private ProfileMapper mapper;

	  public void insert(Profile profile){
        mapper.insert(profile);
      }
	  
	  public void update(Profile profile){
          if(mapper.getVersion(profile.getId()) != profile.getVersion()){
            throw new DataVersionConflictException("Updating t_profile." + profile.getId() );
          }
          
        mapper.update(profile);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public Profile get(String id){
        return mapper.get(id);
      }
	  
	  public List<Profile> getAll(){
        return mapper.getAll();
      }
}

