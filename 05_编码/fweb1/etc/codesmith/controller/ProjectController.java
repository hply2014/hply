package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.Project;
import org.hhwy.fweb1.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class ProjectController {
    
	@Autowired
    private ProjectService service;
    
    @RequestMapping(value = "/project", method = RequestMethod.GET)
	public @ResponseBody List<Project> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/project/{id}", method = RequestMethod.GET)
	public @ResponseBody Project get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/project/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable Project project) {
		service.insert(project);
		return "OK";
	}
    
	@RequestMapping(value = "/project/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable Project project) {
		service.update(project);
		return "OK";
	}

	@RequestMapping(value = "/project/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

