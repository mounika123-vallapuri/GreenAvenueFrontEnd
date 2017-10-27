package com.spring.controller;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dao.ProductDAO;
import com.spring.model.Product;

import java.io.*;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/myImage")
public class ImageController {
	
	
	
	
	@Autowired
	ProductDAO productDao;

	
	
	
	
	
	@RequestMapping(value = "/imageDisplay", method = RequestMethod.GET)
	  public void showImage(@RequestParam("id") int id, HttpServletResponse response,HttpServletRequest request) 
throws ServletException, IOException{
		
		System.out.println(id);
		Product item = productDao.getProduct(id);
		System.out.println(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
	
		
		response.getOutputStream().write(item.getImage());
		
		System.out.println("Image is");
	
		response.getOutputStream().close();
		
	
	}
	
	
	
	
	
	
	
	/*
	private static final Logger log = LoggerFactory.getLogger(ImageController.class);
	public static String uploadFile(MultipartFile file)
	{
		String name=null;
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.base");
				File dir = new File(rootPath + File.separator+"wtpwebapps/GreenAvenueFrontEnd/resources/images" );
				if (!dir.exists())
					dir.mkdirs();
				  name=String.valueOf(new Date().getTime()+".jpg");
				 // Create the file on server
				File serverFile = new File(dir.getAbsolutePath()	+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				log.info("Server File Location="	+ serverFile.getAbsolutePath());

				return  name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name+ " because the file was empty.";
		}
	}
*/}