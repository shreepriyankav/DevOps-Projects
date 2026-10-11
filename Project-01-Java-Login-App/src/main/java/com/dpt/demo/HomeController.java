package com.dpt.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping("home")
    public ModelAndView home() {
        return new ModelAndView("home");
    }

    @RequestMapping("/gallery")
    public ModelAndView gallery() {
        return new ModelAndView("gallery");
    }

    @RequestMapping("/videos")
    public ModelAndView videos() {
        return new ModelAndView("videos");
    }

    @RequestMapping("/articles")
    public ModelAndView articles() {
        return new ModelAndView("articles");
    }

    @RequestMapping("/tutorials")
    public ModelAndView tutorials() {
        return new ModelAndView("tutorials");
    }

    @RequestMapping("/assessment")
    public ModelAndView assessment() {
        return new ModelAndView("assessment");
    }

    @RequestMapping("/poll-survey")
    public ModelAndView pollSurvey() {
        return new ModelAndView("poll-survey");
    }

    @RequestMapping("/chat")
    public ModelAndView chat() {
        return new ModelAndView("chat");
    }

    @RequestMapping("/")
    public ModelAndView Default() {
        return new ModelAndView("home");
    }
}