package com.niit.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Billing;

@Repository("BillingDao")
public class BillingDaoImpl implements BillingDao {
	@Autowired
	private SessionFactory sessionFactory;

	public BillingDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@SuppressWarnings("unchecked")
	public List<Billing> list() {
		List<Billing> listBilling = (List<Billing>) sessionFactory.getCurrentSession().createCriteria(Billing.class)
	.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
					return listBilling;  
	}
	@Transactional
	public Billing get(String billingid) {
		String hql = "from Billing where Billingid ='" + billingid + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Billing> listBilling = (List<Billing>) (query).list();

		if (listBilling != null && !listBilling.isEmpty()) {
			return listBilling.get(0);
		}
		return null;
	}
	@Transactional
	public List<Billing> getMailid(String mailid) {
		String hql = "from User where mailid ='" + mailid + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
	
		@SuppressWarnings("unused")
		List<Billing> list = (List<Billing>) (query).list();
		return null;
	}
	@Transactional
	public void saveOrUpdate(Billing billing) {
		sessionFactory.getCurrentSession().saveOrUpdate(billing);


	}
	@Transactional
	public void delete(String billingid) {
		Billing billingToDelete = new Billing();
		billingToDelete.setBillingid(billingid);
		sessionFactory.getCurrentSession().delete(billingToDelete);
		
	}

}
