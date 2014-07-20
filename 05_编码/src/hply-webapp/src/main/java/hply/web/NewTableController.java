package hply.web;

import hply.domain.NewTable;
import hply.service.NewTableService;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/newtable")
public class NewTableController {

	@Autowired
	private NewTableService newTableService;

	@RequestMapping(method = RequestMethod.GET, params = "create")
	public String createNewTable(Model model) {
		model.addAttribute(new NewTable());
		return "new-table";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String createNewTable(@Valid NewTable newTable,
			BindingResult bindingResult) {
		System.out.println("new table=" + newTable);
		if (bindingResult.hasErrors()) {
			return "new-table";
		}

		newTableService.insert(newTable);

		return "success";
	}
}
