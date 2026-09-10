package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.Constant;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    UserService service = new UserServiceImpl();
                    User user = service.get(cookie.getValue());
                    if (user != null) {
                        session = req.getSession(true);
                        session.setAttribute("account", user);
                        resp.sendRedirect(req.getContextPath() + "/waiting");
                        return;
                    }
                }
            }
        }
        req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        UserService service = new UserServiceImpl();
        String alertMsg = "";

        if (service.checkExistEmail(email)) {
            alertMsg = "Email đã tồn tại!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
            return;
        }

        if (service.checkExistUsername(username)) {
            alertMsg = "Tài khoản đã tồn tại!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
            return;
        }

        String otp = String.format("%06d", new java.util.Random().nextInt(999999));
        
        HttpSession session = req.getSession();
        User pendingUser = new User(0, email, username, fullname, password, null, 5, phone, new java.sql.Date(System.currentTimeMillis()));
        
        // Validate
        jakarta.validation.ValidatorFactory factory = jakarta.validation.Validation.buildDefaultValidatorFactory();
        jakarta.validation.Validator validator = factory.getValidator();
        java.util.Set<jakarta.validation.ConstraintViolation<User>> violations = validator.validate(pendingUser);

        if (!violations.isEmpty()) {
            StringBuilder errorMsg = new StringBuilder();
            for (jakarta.validation.ConstraintViolation<User> violation : violations) {
                errorMsg.append(violation.getMessage()).append("<br>");
            }
            req.setAttribute("alert", errorMsg.toString());
            req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
            return;
        }

        session.setAttribute("pendingUser", pendingUser);
        session.setAttribute("registerOtp", otp);
        
        boolean mailSent = vn.iotstar.util.EmailUtil.sendEmail(email, "Mã xác nhận đăng ký", "Mã OTP của bạn là: " + otp);
        
        if (mailSent) {
            resp.sendRedirect(req.getContextPath() + "/verify-otp");
        } else {
            alertMsg = "Không thể gửi email xác nhận. Vui lòng thử lại!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
        }
    }
}