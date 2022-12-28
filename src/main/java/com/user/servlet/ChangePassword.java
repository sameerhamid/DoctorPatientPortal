package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/userChangePassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		UserDao dao = new UserDao(DBConnect.getConn());
		HttpSession session= req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("changePassSuccMsg", "Password Changed Successfully");
				resp.sendRedirect("changePassword.jsp");
			}else {
				resp.sendRedirect("changePassword.jsp");
				session.setAttribute("changePassErrMsg", "Something wrong on server");
			}
		}else {
			session.setAttribute("oldPassErrMsg", "Old Password Incorrect");
			resp.sendRedirect("changePassword.jsp");
		}
	}
	
}
