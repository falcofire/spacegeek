package com.spacegeek.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spacegeek.configuration.TwitterHandler;

@Controller
public class HomeController {

	@RequestMapping("/")
	public ModelAndView index() {
		ArrayList<String> accounts = new ArrayList<String>();
		accounts.add("from:spacex");
		accounts.add("from:Space_Station");
		accounts.add("from:NASA");
		accounts.add("from:NASAJPL");
		accounts.add("from:esa");
		ArrayList<Map<String,String>> topStories = TwitterHandler.getTopStories(accounts);
		return new ModelAndView("index", "topStories", topStories);
	}
}
