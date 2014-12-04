package net.raescott.seleniumexample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("simple-module")
public class SimpleModuleController {
	@RequestMapping(method = RequestMethod.GET)
	public String simpleModulePage(ModelMap model) {
		return "simpleModule";
	}

}