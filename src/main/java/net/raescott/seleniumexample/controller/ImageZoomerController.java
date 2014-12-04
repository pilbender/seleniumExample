package net.raescott.seleniumexample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("image-zoomer")
public class ImageZoomerController {
	@RequestMapping(method = RequestMethod.GET)
	public String imageZoomerPage(ModelMap model) {
		return "image-zoomer";
	}
}