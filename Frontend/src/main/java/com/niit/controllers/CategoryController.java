package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			categoryDao.saveOrUpdate(category);
			return "redirect:viewCategory";
		
		}
		@RequestMapping("viewCategory")
		public String viewCategories(Model model){
			
			List<Category> categoryList = categoryDao.list();
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("viewCategoryClicked", true);
			return "Adminsignin";
			
		}
		@RequestMapping("editCategory")
		public String EditCategories(@RequestParam("categoryId") String categoryId, Model model){
			
			Category category = categoryDao.get(categoryId);
			model.addAttribute("category", category);
			model.addAttribute("EditCategoryClicked", true);
			return "Adminsignin";
		
	}
		@RequestMapping("afterEdit")
		public String afterEdit(@ModelAttribute Category category){
			categoryDao.saveOrUpdate(category);
			return "redirect:viewCategory";
		}
		@RequestMapping("deleteCategory")
		public String deleteCategory(@RequestParam("categoryId") String categoryId){
			categoryDao.delete(categoryId);
			return "redirect:viewCategory";
			
		}
	}