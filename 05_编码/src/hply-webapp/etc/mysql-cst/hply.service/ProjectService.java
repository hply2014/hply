﻿/**
  * @Template info: 2013/08/16, Chengqiyi.
  * ChengQiyi create in 2014-7-13 16:09:22
  * This class generated by CodeSmith Generator
  */

package hply.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import hply.persistence.ProjectMapper;

import hply.domain.Project;

@Service(value = "projectService")
public class ProjectService {
    
    @Resource(name = "projectMapper")
    private ProjectMapper projectMapper;

	  public void insert(Project project){
        projectMapper.insert(project);
      }
	  
	  public void update(Project project){
        projectMapper.update(project);
      
      }
	  
	  public void delete(String id){
        projectMapper.delete(id);
      }
	  
	  public Project get(String id){
        return projectMapper.get(id);
      }
	  
	  public List<Project> getAll(){
        return projectMapper.getAll();
      }
}


