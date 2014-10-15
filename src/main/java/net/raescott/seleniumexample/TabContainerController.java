package net.raescott.seleniumexample;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("tab-container")
public class TabContainerController {
	@RequestMapping(method = RequestMethod.GET)
	public String tabContainerPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "tab-container";
	}

	@RequestMapping(value = "example-data", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, String> exampleJson() throws InterruptedException {
		Map<String, String> response = new TreeMap<String, String>();
		Thread.sleep(5000);
		response.put("status", "true");
		return response;
	}
}