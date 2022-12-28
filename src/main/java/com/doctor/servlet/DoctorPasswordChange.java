package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session= req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			if(dao.changePassword(uid, newPassword)) {
				
				resp.sendRedirect("doctor/edit_profile.jsp");
				session.setAttribute("drChangePassSuccMsg", "Password Change Successfully");
			}else {
				resp.sendRedirect("doctor/edit_profile.jsp");
				session.setAttribute("drChangePassErrMsg", "Something wrong on server");
			}
		}else {
			session.setAttribute("drOldPassErrMsg", "Old Password Incorrect");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
	}
}