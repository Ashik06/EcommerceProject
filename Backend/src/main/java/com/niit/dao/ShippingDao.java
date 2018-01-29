package com.niit.dao;

import java.util.List;

import com.niit.model.Shipping;

public interface ShippingDao {
	public List<Shipping> list();

	public Shipping get(String shippingid);

	public List<Shipping> getMailid(String mailid);

	public void saveOrUpdate(Shipping shipping);

	public void delete(String shippingid);
}