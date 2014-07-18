package org.hhwy.fweb1.controller;

import java.util.List;

import org.hhwy.fweb1.domain.Profile;
import org.hhwy.fweb1.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class ProfileController {
    
	@Autowired
    private ProfileService service;
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
	public @ResponseBody List<Profile> get() {
		return service.getAll();
	}

	@RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
	public @ResponseBody Profile get(@PathVariable String id) {
		return service.get(id);
	}

	@RequestMapping(value = "/profile/{id}", method = RequestMethod.PUT)
	public @ResponseBody String put(@PathVariable Profile profile) {
		service.insert(profile);
		return "OK";
	}
    
	@RequestMapping(value = "/profile/{id}", method = RequestMethod.POST)
	public @ResponseBody String post(@PathVariable Profile profile) {
		service.update(profile);
		return "OK";
	}

	@RequestMapping(value = "/profile/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delete(@PathVariable String id) {
		service.delete(id);
		return "OK";
	}
}

