package com.niit.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Shipping;

@Repository("ShippingDao")
public class ShippingDaoImpl implements ShippingDao {
	@Autowired
	private SessionFactory sessionFactory;

	/*public ShippingDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
*/
	public List<Shipping> list() {

		@SuppressWarnings("unchecked")
		List<Shipping> listShipping = (List<Shipping>) sessionFactory.getCurrentSession().createCriteria(Shipping.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listShipping;
	}

	@Transactional
	public Shipping get(String shippingid) {
		String hql = "from Shipping where Shippingid ='" + shippingid + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Shipping> listShipping = (List<Shipping>) (query).list();

		if (listShipping != null && !listShipping.isEmpty()) {
			return listShipping.get(0);
		}
		return null;
	}

	@Transactional
	public void saveOrUpdate(Shipping shipping) {
		sessionFactory.getCurrentSession().saveOrUpdate(shipping);

	}

	@Transactional
	public void delete(String shippingid) {
		Shipping shippingToDelete = new Shipping();
		shippingToDelete.setShippingId(shippingid);
		sessionFactory.getCurrentSession().delete(shippingToDelete);

	}

	@Transactional
	public Shipping getBy(String email) {
		String hql = "from Shipping where email ='" + email + "'";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Shipping> listShipping = (List<Shipping>) (query).list();

		if (listShipping != null && !listShipping.isEmpty()) {
			return listShipping.get(0);
		}
		return null;
	}

	@Transactional
	public List<Shipping> getMailid(String mailid) {
		String hql = "from Shipping where mailid=" + "'" + mailid + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Shipping> list = (List<Shipping>) query.list();

		return list;
	}

}