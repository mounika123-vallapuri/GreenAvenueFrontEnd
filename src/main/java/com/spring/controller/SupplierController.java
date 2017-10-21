package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dao.SupplierDAO;
import com.spring.model.Supplier;


@Controller
public class SupplierController {
	   @Autowired
	    SupplierDAO supplierDAO;
	     
	    @RequestMapping(value="AddSupplier",method=RequestMethod.POST)
	    public String addSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	    {
	        supplierDAO.addSupplier(supplier);
	         
	        List<Supplier> listSupplier=supplierDAO.retrieveSupplier();
	        m.addAttribute("supplierList",listSupplier);
	         
	        return "Supplier";
	    }
	     
	    @RequestMapping(value="supplier",method=RequestMethod.GET)
	    public String showSupplier(Model m)
	    {
	        Supplier supplier=new Supplier();
	        m.addAttribute("supplier",supplier);
	         
	        List<Supplier> listSupplier=supplierDAO.retrieveSupplier();
	        m.addAttribute("supplierList",listSupplier);
	        return "Supplier";
	    }
	     
	    @RequestMapping(value="updateSupplier/{supId}",method=RequestMethod.GET)
	    public String updateSupplier(@PathVariable("supId") int supId,Model m)
	     {
	        Supplier supplier=supplierDAO.getSupplier(supId);
	        m.addAttribute(supplier);
	         
	        List<Supplier> listSupplier=supplierDAO.retrieveSupplier();
	        m.addAttribute("supplierList",listSupplier);
	        return "Supplier";
	    }
	     
	    @RequestMapping(value="deleteSupplier/{supId}",method=RequestMethod.GET)
	    public String deleteSupplier(@PathVariable("supId")int supId,Model m)
	    {
	        Supplier supplier=supplierDAO.getSupplier(supId);
	        supplierDAO.deleteSupplier(supplier);
	        List<Supplier> listSupplier=supplierDAO.retrieveSupplier();
	        m.addAttribute("supplierList",listSupplier);
	        return "Supplier";
	    }
}    