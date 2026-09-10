package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/product/detail")
public class ProductDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idParam = req.getParameter("id");
		if (idParam != null && !idParam.isEmpty()) {
			int productId = Integer.parseInt(idParam);
			ProductService productService = new ProductServiceImpl();
			Product product = productService.findById(productId);
			req.setAttribute("product", product);
			req.getRequestDispatcher("/views/product-detail.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/home");
		}
	}
}
