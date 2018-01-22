package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.niit.dao.CategoryDao;
import com.niit.model.Category;

@Controller
public class CategoryController {
	@RequestMapping("category")
	public String NewCategory(Model model) {

		model.addAttribute("AddsupplierButtonClicked", true);
		return "category";

	}
	
		@Autowired
		private CategoryDao categoryDao;
		
		
		
		@RequestMapping("addcategory" )
		public String addCategory(@ModelAttribute Category category){
			categoryDao.updateCategory(category);
			return "redirect:viewcategory";
		
		}
		@RequestMapping("viewCategory")
		public String viewCategories(Model model){
			
			List<Category> categoryList = categoryDao.list();
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("viewCategoryClicked", true);
			return "Adminsignin";
			
		}
		
	}
