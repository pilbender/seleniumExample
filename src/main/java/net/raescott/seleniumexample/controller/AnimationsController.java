package net.raescott.seleniumexample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("animations")
public class AnimationsController {
	@RequestMapping(method = RequestMethod.GET)
	public String animationsPage(ModelMap model) {
		return "animations";
	}
}