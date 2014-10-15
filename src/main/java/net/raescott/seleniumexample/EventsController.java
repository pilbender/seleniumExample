package net.raescott.seleniumexample;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("events")
public class EventsController {
	@RequestMapping(method = RequestMethod.GET)
	public String eventsPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "events";
	}

}