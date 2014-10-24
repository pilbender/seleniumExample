package net.raescott.seleniumexample.controller;

import net.raescott.seleniumexample.dto.UserDto;

import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class UserController {
	@RequestMapping(method = RequestMethod.GET)
	public String loginView() {
		return "login";
	}

	@RequestMapping(value = "logout", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> logout() {
		Map<String, String> response = new TreeMap<String, String>();
		response.put("status", "true");
		return response;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("userDto") UserDto userDto, BindingResult result
			, HttpServletRequest request, HttpSession session, Model model) {
		// Make a database call here for user information by username in a real application.
		UserDto checkUserDto =  new UserDto();
		checkUserDto.setUsername("myusername");
		checkUserDto.setPassword("mypassword");

		if (checkUserDto.getUsername() == null || checkUserDto.getUsername().equals("anonymousUser")) {
			result.addError(new FieldError("userDto", "username", "That is not a valid username"));
			model.addAttribute("emailInvalid", "That is not a valid email");
		} else if (!checkUserDto.getPassword().equals(userDto.getPassword())) {
			result.addError(new FieldError("userDto", "password", "Invalid password"));
			model.addAttribute("passwordInvalid", "Invalid password");
		}
		if (result.hasErrors()) {
			return "login";
		}

		// In a real application, if all the validation passes, you might return all the user information by fetching
		// from a database here.  For now I'll just set it to the contrived checkUserDto.
		userDto = checkUserDto;
		session.setAttribute("userDto", userDto);
		return "redirect:/"; // TODO: Redirect to user information page instead of home?
	}
}
