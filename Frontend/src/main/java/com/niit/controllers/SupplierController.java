package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.SupplierDao;
import com.niit.model.Supplier;

@Controller
public class SupplierController {
	@Autowired
	SupplierDao supplierDao;

	@RequestMapping("supplier")
	public String NewCategory(Model model) {

		model.addAttribute("AddsupplierButtonClicked", true);
		return "supplier";

	}

	@RequestMapping("addSupplier")
	public String addSupplier(@ModelAttribute Supplier supplier, Model model) {
		supplierDao.saveOrUpdate(supplier);

		return "redirect:viewSupplier";

	}

	@RequestMapping("viewSupplier")
	public String viewSupplier(Model model) {

		List<Supplier> supplierList = supplierDao.list();
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("viewSupplierClicked", true);
		return  "Adminsignin";
	}
	@RequestMapping("afteredit")
	public String afterEdit(@ModelAttribute Supplier supplier){
		supplierDao.saveOrUpdate(supplier);
		return "redirect:viewSupplier";
	}
	@RequestMapping("deleteSupplier")
	public String deleteSupplier(@RequestParam("supplierId") String supplierId){
		supplierDao.delete(supplierId);
		return "redirect:viewSupplier";
		
	}

}