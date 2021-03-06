package com.niit.dao;

import java.util.List;

import com.niit.model.Product;

public interface ProductDao {
	public List<Product> list();

	public Product get(String productid);

	public void saveOrUpdate(Product product);

	public void delete(String productid);
}