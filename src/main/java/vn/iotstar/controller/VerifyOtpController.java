package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/verify-otp")
public class VerifyOtpController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String otpInput = req.getParameter("otp");
		HttpSession session = req.getSession();
		String sessionOtp = (String) session.getAttribute("registerOtp");
		User pendingUser = (User) session.getAttribute("pendingUser");

		if (sessionOtp != null && pendingUser != null && sessionOtp.equals(otpInput)) {
			UserService service = new UserServiceImpl();
			service.insert(pendingUser);
			session.removeAttribute("registerOtp");
			session.removeAttribute("pendingUser");
			resp.sendRedirect(req.getContextPath() + "/login?message=success");
		} else {
			req.setAttribute("alert", "Mã OTP không chính xác hoặc đã hết hạn!");
			req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
		}
	}
}
