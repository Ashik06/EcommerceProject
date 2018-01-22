package com.niit.dao;


import com.niit.model.User;

public interface UserDao {
	
public boolean addUser(User user);
	
	public User getUser(String useremail);
}
