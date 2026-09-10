package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/product")
public class ShopController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService productService = new ProductServiceImpl();
		
		int page = 0;
		int pageSize = 6;
		
		String pageParam = req.getParameter("page");
		if (pageParam != null && !pageParam.isEmpty()) {
			page = Integer.parseInt(pageParam) - 1; // 0-indexed
		}
		
		List<Product> products = productService.findAll(page, pageSize);
		int totalProducts = productService.count();
		int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
		
		req.setAttribute("products", products);
		req.setAttribute("currentPage", page + 1);
		req.setAttribute("totalPages", totalPages);
		
		req.getRequestDispatcher("/views/products.jsp").forward(req, resp);
	}
}
