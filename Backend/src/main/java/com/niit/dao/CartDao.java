package com.niit.dao;

import java.util.List;

import com.niit.model.Cart;

public interface CartDao {
	public List<Cart> list();

	public List<Cart> list(String email);

	public Cart get(String cartid);

	public void saveOrUpdate(Cart cart);

	public void delete(String cartid);

	public boolean itemAlreadyExist(String mailid, String productid, boolean b);

	public Cart getByUserandProduct(String mailid, String productid);
	
	public Long getTotal(String cartid);
}


