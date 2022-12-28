package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/userLogin")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			HttpSession session = req.getSession();
			
			UserDao dao = new UserDao(DBConnect.getConn());
			User user =dao.login(email, password);
			

			if (user!=null) {
				session.setAttribute("userObj",user);
				resp.sendRedirect("index.jsp");
				session.setAttribute("succMsg", "ABC");
			}else {
				resp.sendRedirect("user_login.jsp");
				session.setAttribute("errorMsg", "Invalid email and password");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
