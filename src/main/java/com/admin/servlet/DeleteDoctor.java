package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		try {		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.deleteDoctor(id);
		if(f) {
			resp.sendRedirect("admin/view_doctor.jsp");
			session.setAttribute("deleteDrSuccessMsg", "Doctor Delete Successfully");
		}else {
			session.setAttribute("deleteDrErrMassage", "Something wrong on server");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}
	}


