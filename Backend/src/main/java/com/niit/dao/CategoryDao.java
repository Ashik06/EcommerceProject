package com.niit.dao;

import java.util.List;

import com.niit.model.Category;



public interface CategoryDao {

	public boolean addCategory(Category category);
	public List<Category> list();
	public boolean deleteCategory(Category category);
	public Category get(String id);
	public boolean updateCategory(Category category);
	

}