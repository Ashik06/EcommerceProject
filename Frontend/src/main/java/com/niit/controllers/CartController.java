package com.niit.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDao;
import com.niit.dao.ProductDao;
import com.niit.dao.UserDao;
import com.niit.model.Cart;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
public class CartController {

	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private Cart cart;

	@RequestMapping("addToCart")
	public String addToCart(@RequestParam("productId") String productid ,Principal p, Model model){
		
		Product product = productDao.get(productid);
		User user = userDao.getUser(p.getName()); 
		
		Cart crt = cartDao.getByUserandProduct(p.getName(), productid);
		
		if (product.getStock() > 0){
			
			if(cartDao.itemAlreadyExist(p.getName(), productid, true)){
				
			int qty = crt.getQuantity() + 1;
			crt.setQuantity(qty);
			crt.setTotal(product.getPrice()*qty);
			cartDao.saveOrUpdate(crt);
				
			}
			else {
				
		    Random t = new Random();
			int day = 2 + t.nextInt(6);
			
			cart.setUserid(user.getEmail());
			cart.setName(user.getFirstname());
			cart.setMailid(p.getName());
			cart.setProductid(product.getProductid());
			cart.setProductName(product.getProductName());
			cart.setQuantity(1);
			cart.setPrice(product.getPrice());
		    cart.setTotal(cart.getPrice()*cart.getQuantity());
		    cart.setStatus("N");
		    cart.setDays(day);
			
		cartDao.saveOrUpdate(cart);
			}
		int stc=product.getStock()-1;
		product.setStock(stc);
		productDao.saveOrUpdate(product);
			
			
		return "redirect:mycart";

		}
		else{
			model.addAttribute("product", product);
			model.addAttribute("productdescription", true);
			model.addAttribute("msg", "Out of Stock");
			return "Usersignin";
		}
				
	}

	
	@RequestMapping("mycart")
	public String mycart(Principal principal, Model model) {
		String email = principal.getName();
		List<Cart> cartList = cartDao.list(email);
		Long sum=cartDao.getTotal(email);  
		model.addAttribute("total",sum);
		model.addAttribute("cartList", cartList);
		model.addAttribute("myKartClicked", true);
		return "Usersignin";
	  
	
	}
	@RequestMapping("deleteCart")
	public String deleteCart(@RequestParam("cartId") String cartId){
		Cart cart =cartDao.get(cartId);
		Product product = productDao.get(cart.getProductid());		
		
		int qty=cart.getQuantity();
		int stc=product.getStock();
		product.setStock(stc+qty);
		productDao.saveOrUpdate(product);
		cartDao.delete(cartId);
		
		return "redirect:mycart";
	}	
}
