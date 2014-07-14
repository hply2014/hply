package hply.web;

import hply.domain.NewTable;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/newtable")
public class NewTableController {

	@RequestMapping(method=RequestMethod.POST, params="create")
	public String createNewTable(Model model){
		model.addAttribute(new NewTable());
		return "new-table";
	}
}
