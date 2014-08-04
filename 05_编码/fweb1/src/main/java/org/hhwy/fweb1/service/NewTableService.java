package org.hhwy.fweb1.service;

import java.util.List;

import org.hhwy.fweb1.core.DataVersionConflictException;
import org.hhwy.fweb1.domain.NewTable;
import org.hhwy.fweb1.mapper.NewTableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewTableService {
    
	@Autowired
    private NewTableMapper mapper;

	  public void insert(NewTable newTable){
        mapper.insert(newTable);
      }
	  
	  public void update(NewTable newTable){
          if(mapper.getVersion(newTable.getId()) != newTable.getVersion()){
            throw new DataVersionConflictException("数据更新冲突 new_table." + newTable.getId() );
          }
          
        mapper.update(newTable);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public NewTable get(String id){
        return mapper.get(id);
      }
	  
	  public List<NewTable> getAll(){
        return mapper.getAll();
      }
}

