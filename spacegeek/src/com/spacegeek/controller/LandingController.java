package com.spacegeek.controller;

import com.spacegeek.configuration.TwitterHandler;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public ModelAndView spaceX(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String message = "Welcome to the SpaceX feed";
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:SpaceX");
		session.setAttribute("tweets", tweets);
		return new ModelAndView("welcome", "message", message);
	}
	
	@RequestMapping("/nasa")
	public ModelAndView nasa(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String message = "Welcome to the NASA feed";
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:NASA");
		session.setAttribute("tweets", tweets);
		return new ModelAndView("welcome", "message", message);
	}
	
	@RequestMapping("/jpl")
	public ModelAndView jpl(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String message = "Welcome to the JPL feed";
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:NASAJPL");
		session.setAttribute("tweets", tweets);
		return new ModelAndView("welcome", "message", message);
	}
	
	@RequestMapping("/esa")
	public ModelAndView esa(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String message = "Welcome to the ESA feed";
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:esa");
		session.setAttribute("tweets", tweets);
		return new ModelAndView("welcome", "message", message);
	}
}