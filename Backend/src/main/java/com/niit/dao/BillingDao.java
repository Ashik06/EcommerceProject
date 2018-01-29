package com.niit.dao;

import java.util.List;

import com.niit.model.Billing;

public interface BillingDao {
public List<Billing> list();

public Billing get(String billingid);
public List<Billing> getMailid(String mailid); 
public void saveOrUpdate(Billing billing);

public void delete(String billingid);

}