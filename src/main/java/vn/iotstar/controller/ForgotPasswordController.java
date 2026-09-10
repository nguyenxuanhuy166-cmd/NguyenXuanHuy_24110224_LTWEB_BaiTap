package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/forgot-password")
public class ForgotPasswordController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		UserService service = new UserServiceImpl();
		
		if (service.checkExistEmail(email)) {
			String otp = String.format("%06d", new java.util.Random().nextInt(999999));
			HttpSession session = req.getSession();
			session.setAttribute("resetOtp", otp);
			session.setAttribute("resetEmail", email);
			
			boolean mailSent = vn.iotstar.util.EmailUtil.sendEmail(email, "Mã khôi phục mật khẩu", "Mã OTP của bạn là: " + otp);
			if (mailSent) {
				resp.sendRedirect(req.getContextPath() + "/reset-password");
			} else {
				req.setAttribute("alert", "Lỗi gửi email.");
				req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("alert", "Email không tồn tại trong hệ thống.");
			req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
		}
	}
}
