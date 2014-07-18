package org.hhwy.fweb1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.hhwy.fweb1.exception.DataVersionConflictException;
import org.hhwy.fweb1.domain.ProjectSummary;
import org.hhwy.fweb1.mapper.ProjectSummaryMapper;

@Service
public class ProjectSummaryService {
    
	@Autowired
    private ProjectSummaryMapper mapper;

	  public void insert(ProjectSummary projectSummary){
        mapper.insert(projectSummary);
      }
	  
	  public void update(ProjectSummary projectSummary){
          if(mapper.getVersion(projectSummary.getId()) != projectSummary.getVersion()){
            throw new DataVersionConflictException("Data conflict has occurred， t_project_summary.id=" + projectSummary.getId() );
          }
          
        mapper.update(projectSummary);
      
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public ProjectSummary get(String id){
        return mapper.get(id);
      }
	  
	  public List<ProjectSummary> getAll(){
        return mapper.getAll();
      }
}

