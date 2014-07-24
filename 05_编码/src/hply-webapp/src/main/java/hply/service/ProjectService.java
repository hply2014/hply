package hply.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import hply.domain.Project;
import hply.mapper.ProjectMapper;

@Service
public class ProjectService {
    
	@Autowired
    private ProjectMapper mapper;

	  public void insert(Project project){
        mapper.insert(project);
      }
	  
	  public void update(Project project){
        mapper.update(project);
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public Project get(String id){
        return mapper.get(id);
      }
	  
	  public List<Project> getAll(){
        return mapper.getAll();
      }
}

