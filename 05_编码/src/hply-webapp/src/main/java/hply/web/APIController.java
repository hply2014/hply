package hply.web;

import hply.domain.TreeNode;
import hply.service.SysResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/api", produces = "application/json;charset=UTF-8")
public class APIController {

	@Autowired
	private SysResourceService sysResourceService;

	@ResponseBody
	@RequestMapping(value = "/tree/{userId}")
	public TreeNode getTreeData(@PathVariable String userId) {
		System.out.println("getTreeData ..." + userId);
		return sysResourceService.getTreeRoot(userId);
	}

}
