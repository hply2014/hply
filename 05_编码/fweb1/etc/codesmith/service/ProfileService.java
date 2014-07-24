package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.exception.DataVersionConflictException;
import hply.domain.Profile;
import hply.mapper.ProfileMapper;

@Service
public class ProfileService {
    
	@Autowired
    private ProfileMapper mapper;

	  public void insert(Profile profile){
        mapper.insert(profile);
      }
	  
	  public void update(Profile profile){
          if(mapper.getVersion(profile.getId()) != profile.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_profile.id=" + profile.getId() );
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

