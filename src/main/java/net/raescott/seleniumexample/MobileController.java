package net.raescott.seleniumexample;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mobile")
public class MobileController {
	@RequestMapping(method = RequestMethod.GET)
	public String mobilePage(ModelMap model) {
		return "mobile";
	}
}
