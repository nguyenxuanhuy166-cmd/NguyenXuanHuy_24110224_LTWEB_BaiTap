package vn.iotstar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.Constant;

@MultipartConfig()
@WebServlet(urlPatterns = { "/admin/products", "/admin/product/add", "/admin/product/insert",
		"/admin/product/edit", "/admin/product/update", "/admin/product/delete" })
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductServiceImpl();
	private CategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		if (url.contains("/admin/products")) {
			List<Product> list = productService.findAll();
			req.setAttribute("listprod", list);
			req.getRequestDispatcher("/views/admin/product-list.jsp").forward(req, resp);
		} else if (url.contains("/admin/product/add")) {
			List<Category> listCate = cateService.findAll();
			req.setAttribute("listcate", listCate);
			req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
		} else if (url.contains("/admin/product/edit")) {
			int id = Integer.parseInt(req.getParameter("id"));
			Product product = productService.findById(id);
			req.setAttribute("prod", product);
			List<Category> listCate = cateService.findAll();
			req.setAttribute("listcate", listCate);
			req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
		} else {
			int id = Integer.parseInt(req.getParameter("id"));
			try {
				productService.delete(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/products");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		if (url.contains("/admin/product/insert")) {
			String productName = req.getParameter("productName");
			double price = Double.parseDouble(req.getParameter("price"));
			String description = req.getParameter("description");
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));
			String images = req.getParameter("images");

			Product product = new Product();
			product.setProductName(productName);
			product.setPrice(price);
			product.setDescription(description);
			Category cate = cateService.findById(categoryId);
			product.setCategory(cate);

			String fname = "";
			String uploadPath = Constant.DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = req.getPart("images1");
				if (part != null && part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					product.setImage(fname);
				} else if (images != null && !images.trim().isEmpty()) {
					product.setImage(images);
				} else {
					product.setImage("default-product.png");
				}
			} catch (FileNotFoundException fne) {
				fne.printStackTrace();
			}

			jakarta.validation.ValidatorFactory factory = jakarta.validation.Validation.buildDefaultValidatorFactory();
			jakarta.validation.Validator validator = factory.getValidator();
			java.util.Set<jakarta.validation.ConstraintViolation<Product>> violations = validator.validate(product);

			if (!violations.isEmpty()) {
				StringBuilder errorMsg = new StringBuilder();
				for (jakarta.validation.ConstraintViolation<Product> violation : violations) {
					errorMsg.append(violation.getMessage()).append("<br>");
				}
				req.setAttribute("alert", errorMsg.toString());
				req.setAttribute("prod", product); // retain data
				List<Category> listCate = cateService.findAll();
				req.setAttribute("listcate", listCate);
				req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
				return;
			}

			productService.insert(product);
			resp.sendRedirect(req.getContextPath() + "/admin/products");
		}
		
		if (url.contains("/admin/product/update")) {
			int productId = Integer.parseInt(req.getParameter("productId"));
			String productName = req.getParameter("productName");
			double price = Double.parseDouble(req.getParameter("price"));
			String description = req.getParameter("description");
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));
			String images = req.getParameter("images");

			Product product = productService.findById(productId);
			String fileold = product.getImage();
			
			product.setProductName(productName);
			product.setPrice(price);
			product.setDescription(description);
			Category cate = cateService.findById(categoryId);
			product.setCategory(cate);

			String fname = "";
			String uploadPath = Constant.DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			try {
				Part part = req.getPart("images1");
				if (part != null && part.getSize() > 0) {
					if (fileold != null && !fileold.startsWith("http")) {
						deleteFile(uploadPath + "\\" + fileold);
					}
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					product.setImage(fname);
				} else if (images != null && !images.trim().isEmpty()) {
					product.setImage(images);
				} else {
					product.setImage(fileold);
				}
			} catch (FileNotFoundException fne) {
				fne.printStackTrace();
			}

			jakarta.validation.ValidatorFactory factory = jakarta.validation.Validation.buildDefaultValidatorFactory();
			jakarta.validation.Validator validator = factory.getValidator();
			java.util.Set<jakarta.validation.ConstraintViolation<Product>> violations = validator.validate(product);

			if (!violations.isEmpty()) {
				StringBuilder errorMsg = new StringBuilder();
				for (jakarta.validation.ConstraintViolation<Product> violation : violations) {
					errorMsg.append(violation.getMessage()).append("<br>");
				}
				req.setAttribute("alert", errorMsg.toString());
				req.setAttribute("prod", product); // retain data
				List<Category> listCate = cateService.findAll();
				req.setAttribute("listcate", listCate);
				req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
				return;
			}

			productService.update(product);
			resp.sendRedirect(req.getContextPath() + "/admin/products");
		}
	}

	public static void deleteFile(String filePath) throws IOException {
		Path path = Paths.get(filePath);
		Files.deleteIfExists(path);
	}
}
