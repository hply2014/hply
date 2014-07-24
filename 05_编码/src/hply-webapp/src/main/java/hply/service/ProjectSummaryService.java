package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.ProjectSummary;
import hply.mapper.ProjectSummaryMapper;

@Service
public class ProjectSummaryService {
    
	@Autowired
    private ProjectSummaryMapper mapper;

	  public void insert(ProjectSummary projectSummary){
        mapper.insert(projectSummary);
      }
	  
	  public void update(ProjectSummary projectSummary){
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

