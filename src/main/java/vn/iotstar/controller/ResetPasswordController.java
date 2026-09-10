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
@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String otpInput = req.getParameter("otp");
		String newPassword = req.getParameter("newPassword");
		
		HttpSession session = req.getSession();
		String sessionOtp = (String) session.getAttribute("resetOtp");
		String resetEmail = (String) session.getAttribute("resetEmail");

		if (sessionOtp != null && resetEmail != null && sessionOtp.equals(otpInput)) {
			UserService service = new UserServiceImpl();
			service.updatePassword(resetEmail, newPassword);
			session.removeAttribute("resetOtp");
			session.removeAttribute("resetEmail");
			resp.sendRedirect(req.getContextPath() + "/login?message=password_updated");
		} else {
			req.setAttribute("alert", "Mã OTP không chính xác hoặc đã hết hạn!");
			req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
		}
	}
}
