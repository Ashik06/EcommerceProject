package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.ProductDao;
import com.niit.model.Product;

@Controller
public class HomeController {
	

	@Autowired
	private ProductDao productDao;
	
	public HomeController() {
		System.out.println("HomeController is instantiated");
	}

	@RequestMapping("/")
	public String home(Model m) {
		List<Product> productList = productDao.list();
		m.addAttribute("productList", productList);
		return "home";
	}

	@RequestMapping("/home")
	public String home1(Model m) {

		return "home";
	}

	@RequestMapping("/aboutus")
	public String aboutUs() {
		return "aboutUs";
	}

	public ModelAndView sayHello() {
		return new ModelAndView("hello", "helloAttr", "Welcome to Spring Framework");
	}

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "Username or Password Incorrect");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logged out Successfully");
		}
		return "login";
	}

	@RequestMapping("/userLogged")
	public String userLogged() {
		return "redirect:home";
	}

}
