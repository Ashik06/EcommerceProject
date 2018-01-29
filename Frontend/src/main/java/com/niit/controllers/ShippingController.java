package com.niit.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDao;
import com.niit.dao.ShippingDao;
import com.niit.dao.UserDao;
import com.niit.model.Cart;
import com.niit.model.Shipping;
import com.niit.model.User;

@Controller
public class ShippingController {
	@Autowired
	private ShippingDao shippingDao;
	@Autowired
	private UserDao userDao;

	@Autowired
	private CartDao cartDao;

	public String addShipping(@ModelAttribute Shipping shipping) {

		shippingDao.saveOrUpdate(shipping);

		return "viewproduct";
	}

	@RequestMapping("proceed")
	public String proced(Principal p, Model model) {
		String email = p.getName();
		List<Shipping> shippingList = shippingDao.getMailid(email);
		model.addAttribute("shippingList", shippingList);
		model.addAttribute("viewShipping", true);
		return "Usersignin";
	}

	@RequestMapping("editShipping")
	public String EditShipping(@RequestParam("shippingId") String shippingid, Model model) {

		Shipping shipping = shippingDao.get(shippingid);
		model.addAttribute("shipping", shipping);
		model.addAttribute("EditShippingClicked", true);
		return "Usersignin";

	}

	@RequestMapping("deleteShipping")
	public String deleteShipping(@RequestParam("shippingId") String shippingId) {
		shippingDao.delete(shippingId);
		return "redirect:proceed";

	}

	@RequestMapping("newAddress")
	public String newAddress(@ModelAttribute Shipping shipping, Principal p, Model model) {
		User user = userDao.getByMailId(p.getName());
		shipping.setMailid(p.getName());
		shipping.setUserid(user.getEmail());
		shippingDao.saveOrUpdate(shipping);

		return "redirect:proceed";
	}

	@RequestMapping("afterEditShipping")
	public String AfterEdit(@ModelAttribute Shipping shipping, Principal p) {
		User user = userDao.getByMailId(p.getName());
		shipping.setMailid(p.getName());
		shipping.setUserid(user.getEmail());

		shippingDao.saveOrUpdate(shipping);

		return "redirect:proceed";
	}

	@RequestMapping("newshipping")
	public String newshipping(Model model) {
		model.addAttribute("newShippingClicked", true);
		return "Usersignin";
	}

	@RequestMapping("deliveryaddress")
	public String deliverAdress(@RequestParam("shippingId") String shippingId, Principal p, Model model) {

		String email = p.getName();

		List<Cart> cartList = cartDao.list(email);

		for (Cart crt : cartList) {
			crt.setShippingid(shippingId);
			cartDao.saveOrUpdate(crt);

		}
		model.addAttribute("deliveryaddress", true);

		return "Usersignin";

	}

}