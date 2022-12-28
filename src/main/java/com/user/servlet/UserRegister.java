package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();
			
			User u =new User(fullName, email, password);
			
			UserDao dao = new UserDao(DBConnect.getConn());
			
			boolean f = dao.register(u);
			if(f) {
				resp.sendRedirect("signup.jsp");
				session.setAttribute("uObj", "Successfully Registered<br> Login Now");
			}else {
				session.setAttribute("erMsg", "Invalid email and password");
				resp.sendRedirect("signup.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
