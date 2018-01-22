
package com.niit.controllers;
import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.ProductDao;
import com.niit.model.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDao productDao;

	@RequestMapping("Product")
	public String NewCategory(Model model) {

		model.addAttribute("AddproductButtonClicked", true);
		return "Product";

	}

	@RequestMapping("addProduct")
	public String addProduct(@ModelAttribute Product product,@RequestParam("file") MultipartFile file){
		productDao.saveOrUpdate(product);
		String path = "E://Project/Frontend/src/main/webapp/WEB-INF/resources/images/product/";
		FileUtil.upload(path, file, product.getProductid()+".jpg");
		return "redirect:viewProduct";
	}

	@RequestMapping("viewProduct")
	public String viewProducts(Model model) {

		List<Product> productList = productDao.list();
		model.addAttribute("productList", productList);
		model.addAttribute("viewProductClicked", true);
		return  "Adminsignin";

	}
}
