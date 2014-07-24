﻿package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.exception.DataVersionConflictException;
import hply.domain.Chop;
import hply.mapper.ChopMapper;

@Service
public class ChopService {
    
	@Autowired
    private ChopMapper mapper;

	  public void insert(Chop chop){
        mapper.insert(chop);
      }
	  
	  public void update(Chop chop){
          if(mapper.getVersion(chop.getId()) != chop.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_chop.id=" + chop.getId() );
          }
          
        mapper.update(chop);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public Chop get(String id){
        return mapper.get(id);
      }
	  
	  public List<Chop> getAll(){
        return mapper.getAll();
      }
}

