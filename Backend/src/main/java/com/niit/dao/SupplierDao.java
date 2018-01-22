package com.niit.dao;

import java.util.List;

import com.niit.model.Supplier;

public interface SupplierDao {

	public List<Supplier> list();

	public Supplier get(String supplierid);

	public void saveOrUpdate(Supplier supplierid);

	public void delete(String id);

}
