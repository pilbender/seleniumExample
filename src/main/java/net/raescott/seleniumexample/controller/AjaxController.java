package net.raescott.seleniumexample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("ajax")
public class AjaxController {
	@RequestMapping(method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "ajax";
	}

	@RequestMapping(value = "example-data", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> exampleJson() {
		Map<String, String> response = new TreeMap<String, String>();
		response.put("status", "true");
		return response;
	}

}