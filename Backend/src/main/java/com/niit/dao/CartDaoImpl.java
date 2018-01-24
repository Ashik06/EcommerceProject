package com.niit.dao;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Cart;

@Repository("CartDao")
public class CartDaoImpl implements CartDao {
@Autowired
private SessionFactory sessionFactory;

public CartDaoImpl(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
}

@Transactional
	public List<Cart> list() {
		
	@SuppressWarnings({ "unchecked" })
	List<Cart> listCart = (List<Cart>) sessionFactory.getCurrentSession().createCriteria(Cart.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	return listCart;
	}
@Transactional
	public Cart get(String cartid) {
	String hql = "from Cart where cartid ='" + cartid + "'";
	Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
  
	@SuppressWarnings("unchecked")
	List<Cart> listCart = (List<Cart>) (query).list();

	if (listCart != null && !listCart.isEmpty()) {
		return listCart.get(0);
	}

		return null;
	}
@Transactional
	public void saveOrUpdate(Cart cart) {
	sessionFactory.getCurrentSession().saveOrUpdate(cart);

	}
@Transactional
	public void delete(String cartid) {
	Cart cartToDelete = new Cart();
	cartToDelete.setCartid(cartid);
	sessionFactory.getCurrentSession().delete(cartToDelete);

}
@Transactional
public List<Cart> list(String mailid) {
	String hql = "from Cart where mailid=" + "'" + mailid + "'   and status = " + "'N'";
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	@SuppressWarnings("unchecked")
	List<Cart> list = (List<Cart>) query.list();
	
	return list;
}
@Transactional
public boolean itemAlreadyExist(String mailid, String productId, boolean b) {
	String hql = "from Cart where mailid= '" + mailid + "' and " + " productid ='" + productId+"'";
	org.hibernate.Query query = sessionFactory.getCurrentSession().createQuery(hql);
	@SuppressWarnings("unchecked")
	List<Cart> list = (List<Cart>) query.list();
	if (list != null && !list.isEmpty()) {
		return true;
	}
	return false;
}
@Transactional
public Cart getByUserandProduct(String mailid, String productId) {
	String hql = "from Cart where mailid= '" + mailid + "' and " + " productid ='" + productId+"'";
	org.hibernate.Query query = sessionFactory.getCurrentSession().createQuery(hql);
	@SuppressWarnings("unchecked")
	List<Cart> listCart = (List<Cart>) query.list();
	
	if (listCart != null && !listCart.isEmpty()){
		return listCart.get(0);
	}
	return null;
}

@Transactional
public Long getTotal(String cartid) {
	String hql = "select sum(total) from Cart where mailid = " + "'" + cartid + "'" + "and status = '" + "N" +"'";
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
   Long sum = (Long) query.uniqueResult();
	return sum;
}


}


