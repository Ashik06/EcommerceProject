package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.BillingDao;
import com.niit.dao.ShippingDao;
import com.niit.dao.UserDao;
import com.niit.model.Billing;
import com.niit.model.Shipping;
import com.niit.model.User;

@Controller
public class UserController {
	@Autowired
	UserDao userDao;
	
	@Autowired
	ShippingDao shippingDao;
	
	@Autowired
	BillingDao billingDao;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView goToRegister()
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("user",new User());
		mv.setViewName("register");
		return mv;
		
	}
	@RequestMapping(value="/saveRegister", method=RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute("user")User user)
	{
		ModelAndView mv=new ModelAndView();
		user.setRole("ROLE_USER");
		user.setEnabled("1");
		userDao.saveOrUpdate(user);
		mv.setViewName("home");
		return mv;	
}	
	
	@RequestMapping("register")
	public String addCategory(@ModelAttribute User user, @ModelAttribute Shipping shipping, @ModelAttribute Billing billing, Model model){
		
		shipping.setUserid(user.getUserid());
		shippingDao.saveOrUpdate(shipping);
		
		billing.setUserid(user.getUserid());
		billingDao.saveOrUpdate(billing);
	
		return "register";
}
	
	
}