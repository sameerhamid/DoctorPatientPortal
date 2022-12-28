package com.admin.servlet;

import java.io.IOException;

import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			HttpSession session = req.getSession();

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				resp.sendRedirect("admin/index.jsp");
				session.setAttribute("adminObj", new User());
				session.setAttribute("sucAdminObj", "Successfully Registered");
			}else {
				resp.sendRedirect("admin_login.jsp");
				session.setAttribute("errorAdminObj","Invalid email and password");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
