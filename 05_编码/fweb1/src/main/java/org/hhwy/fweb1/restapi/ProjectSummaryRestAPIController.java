package org.hhwy.fweb1.restapi;

import java.util.List;

import org.hhwy.fweb1.domain.ProjectSummary;
import org.hhwy.fweb1.service.ProjectSummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class ProjectSummaryRestAPIController {
    
	@Autowired
    private ProjectSummaryService service;
    
    @RequestMapping(value = "/projectsummary", method = RequestMethod.GET)
	public @ResponseBody List<ProjectSummary> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/projectsummary/{id}", method = RequestMethod.GET)
	public @ResponseBody ProjectSummary get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/projectsummary/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable ProjectSummary projectSummary) {
		service.insert(projectSummary);
		return "OK";
	}
    
	@RequestMapping(value = "/projectsummary/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable ProjectSummary projectSummary) {
		service.update(projectSummary);
		return "OK";
	}

	@RequestMapping(value = "/projectsummary/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

