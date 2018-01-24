
package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.dao.SupplierDao;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class ProductController {
	@Autowired
	ProductDao productDao;

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private SupplierDao supplierDao;

	@RequestMapping("Product")
	public String NewCategory(Model model) {

		model.addAttribute("AddproductButtonClicked", true);
		return "Product";

	}

	@RequestMapping("productPage")
	public ModelAndView newProduct() {

		ModelAndView mv = new ModelAndView("Adminsignin");
		List<Category> categoryList = categoryDao.list();
		List<Supplier> supplierList = supplierDao.list();
		mv.addObject("supplierList", supplierList);
		mv.addObject("categoryList", categoryList);
		mv.addObject("AddProductButtonClicked", true);
		return mv;
	}

	@RequestMapping("addProduct")
	public String addProduct(@ModelAttribute Product product, @RequestParam("file") MultipartFile file) {
		productDao.saveOrUpdate(product);
		String path = "E://Project/Frontend/src/main/webapp/WEB-INF/resources/images/product/";
		FileUtil.upload(path, file, product.getProductid() + ".jpg");
		return "redirect:viewProduct";
	}

	@RequestMapping("viewProduct")
	public String viewProducts(Model model) {

		List<Product> productList = productDao.list();
		model.addAttribute("productList", productList);
		model.addAttribute("viewProductClicked", true);
		return "Adminsignin";

	}

	@RequestMapping("editProduct")
	public String EditCategories(@RequestParam("productId") String productId, Model model) {

		Product product = productDao.get(productId);
		model.addAttribute("product", product);
		model.addAttribute("EditProductClicked", true);
		return "Adminsignin";
	}

	@RequestMapping("AfterEdit")
	public String AfterEdit(@ModelAttribute Product product) {
		productDao.saveOrUpdate(product);
		return "redirect:viewProduct";
	}

	@RequestMapping("deleteProduct")
	public String deleteProduct(@RequestParam("productId") String productId) {
		productDao.delete(productId);
		return "redirect:viewProduct";

	}
	
	@RequestMapping("productdescription")
	public String productdescription(@RequestParam("productid") String productid, Model model) {

		Product product = productDao.get(productid);
		model.addAttribute("product", product);
		model.addAttribute("productdescription", true);

		return "Usersignin";

	}
	
}
