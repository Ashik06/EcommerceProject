package com.niit.dao;

import java.util.List;

import com.niit.model.User;

public interface UserDao {

	public List<User> list();

	public User get(String userid);

	public User getByMailId(String email);

	public void saveOrUpdate(User user);

	public void delete(String userid);

	public boolean isAllReadyRegister(String mailid, boolean b);
}