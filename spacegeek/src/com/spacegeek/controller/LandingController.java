package com.spacegeek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
/*
 * author: spacegeek.com
 * 
 */
 
@Controller
public class LandingController {
 
	@RequestMapping("/")
	public ModelAndView main() {
		return new ModelAndView("spacegeek");
	}
	
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
 
		String message = "<br><div style='text-align:center;'>"
				+ "<h3>********** Hello World, Spring MVC Tutorial</h3>This message is coming from LandingController .java **********</div><br><br>";
		return new ModelAndView("welcome", "message", message);
	}
	
	@RequestMapping("/spaceX")
	public ModelAndView spaceX() {
		String message = "Welcome to the SpaceX feed";
		return new ModelAndView("welcome", "message", message);
	}
	
	@RequestMapping("/nasa")
	public ModelAndView nasa() {
		String message = "Welcome to the NASA feed";
		return new ModelAndView("welcome", "message", message);
	}
	
	@RequestMapping("/jpl")
	public ModelAndView jpl() {
		String message = "Welcome to the JPL feed";
		return new ModelAndView("welcome", "message", message);
	}
	
	@RequestMapping("/esa")
	public ModelAndView esa() {
		String message = "Welcome to the ESA feed";
		return new ModelAndView("welcome", "message", message);
	}
}