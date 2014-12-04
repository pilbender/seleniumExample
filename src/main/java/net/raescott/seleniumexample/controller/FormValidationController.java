package net.raescott.seleniumexample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/form-validation")
public class FormValidationController {
	@RequestMapping(method = RequestMethod.GET)
	public String formValidationPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "form-validation";
	}

}
