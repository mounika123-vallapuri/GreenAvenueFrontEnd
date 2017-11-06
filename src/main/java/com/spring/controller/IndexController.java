package com.spring.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dao.ProductDAO;
import com.spring.dao.UserDAO;
import com.spring.model.User;


@Controller
public class IndexController 
{
	
	
	@Autowired
	private UserDAO userDAO;
	

	@Autowired
	ProductDAO productDao;

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String gotoWelcomePage() 
	{
		return "welcome";

	}


	@RequestMapping(value="/welcome",method=RequestMethod.GET)
	public String showWelcomePage() 
	
	
	{
		
		
		
		return "welcome";

	}

	
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String showIndexPage(Model m) 
	{
				m.addAttribute("pList",productDao.retrieveProduct());
		return "home";

	}

	
	
		@RequestMapping("/registeration")
		public String goToRegisterPage(@ModelAttribute("user") User user,Model model)
		{
			
			model.addAttribute("user",new User());
			
			return "register";
		}



		@RequestMapping("/saveUser")
		public String createUser(@Valid @ModelAttribute("user") User user,BindingResult result)
		{
			if (result.hasErrors()) {
				 
			   return "/register";
			 
			}
			else
			{
			user.setRole("ROLE_USER");
			user.setEnabled(true);
			userDAO.saveUser(user);
			return "/welcome";
		}

		}
	}
	
	
