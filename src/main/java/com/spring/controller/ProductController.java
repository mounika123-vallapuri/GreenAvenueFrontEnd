package com.spring.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.CategoryDAO;
import com.spring.dao.ProductDAO;
import com.spring.dao.SupplierDAO;
import com.spring.model.Category;
import com.spring.model.Product;
import com.spring.model.Supplier;

@Controller
public class ProductController
{

	@Autowired
	ProductDAO productDao;
	
	@Autowired
	CategoryDAO categoryDao;
	
	@Autowired
	SupplierDAO supplierDao;
	
	@RequestMapping(value="product",method=RequestMethod.GET)
	public String showProduct(@ModelAttribute("product") Product product,BindingResult result,Model m)
	{
		//Product product=new Product();
		m.addAttribute(product);
		m.addAttribute("productList",productDao.retrieveProduct());
		m.addAttribute("categoriesList",getCategories());
		m.addAttribute("suppliersList", getSuppliers());
		
		return "Product";
	}
	
public LinkedHashMap<Integer,String> getCategories()
	{
		List<Category> listCategories=categoryDao.retrieveCategory();
		LinkedHashMap<Integer,String> categoriesList=new LinkedHashMap<Integer,String>();
		
		for(Category category:listCategories)
		{
			categoriesList.put(category.getCatId(),category.getCatName());
		}
		
		return categoriesList;		
	}

	
		
	
	public LinkedHashMap<Integer,String> getSuppliers()
	{
		List<Supplier> listSuppliers=supplierDao.retrieveSupplier();
		LinkedHashMap<Integer,String> suppliersList=new LinkedHashMap<Integer,String>();
		
		for(Supplier supplier:listSuppliers)
		{
			suppliersList.put(supplier.getSupId(),supplier.getSupName());
		}
		
		return suppliersList;
	}
	
	public LinkedHashMap<Integer,String> getProducts()
	{
		List<Product> listProducts=productDao.retrieveProduct();
		LinkedHashMap<Integer,String> productsList=new LinkedHashMap<Integer,String>();
		
		for(Product product:listProducts)
		{
			productsList.put(product.getProductId(),product.getProductName());
		}
		
		return productsList;
	}
	

	@RequestMapping(value="productsDisplayPage", method = RequestMethod.GET)
	public String showProductDetailPage(Model m){
		m.addAttribute("pList", productDao.getAllProducts());
		return "productsDisplayPage";
	}

	@RequestMapping(value="saveProduct",method = RequestMethod.POST)
public String addItem(@ModelAttribute("product") Product p,@RequestParam("file") MultipartFile file,BindingResult result,HttpServletRequest request) throws IOException
	{
		p.setImage(file.getBytes());
		this.productDao.addProduct(p);
		return "redirect:/product";
		
	}
/*	@RequestMapping(value="userHome")
	public String showProducts(Model m)
	{
		List<Product> listProducts=productDao.retrieveProduct();
		m.addAttribute("productList",listProducts);
		
		return "UserHome";
	}
	
	@RequestMapping(value="productDesc/{productId}")
	public String showProductDesc(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDao.getProduct(productId);
		m.addAttribute("Product",product);
		return "ProductDesc";
	}
	*/
	@RequestMapping(value="updateProduct/{productId}",method=RequestMethod.GET)
	public String editProduct(@PathVariable("productId") int productId,RedirectAttributes attributes)
	{
		attributes.addFlashAttribute("product", this.productDao.getProduct(productId));
		return "redirect:/product";
	   }
	
	@RequestMapping(value="deleteProduct/{productId}",method=RequestMethod.GET)
	public String removeProduct(@PathVariable("productId") int productId,RedirectAttributes attributes)
	{
		productDao.deleteProduct(productId);
		attributes.addFlashAttribute("DeleteMessage", "Product has been deleted Successfully");
		return "redirect:/product";
	   }
	

}
