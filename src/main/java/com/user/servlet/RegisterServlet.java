package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.xml.IfTag;

import com.DAO.UserDAOImpl;
import com.DB.DBconnect;
import com.entity.user;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			HttpSession session1= req.getSession();
			if(phno.length()!=10) {
				session1.setAttribute("failedMsg", "Enter valid Mobile number ");
				resp.sendRedirect("register.jsp");

			}
			
			if(password.length() <=8) {
				session1.setAttribute("failedMsg", "Password is too weak");

			}
		

			//System.out.println(name + "" + email + "" + phno + "" + password + "" + check);

			user us = new user();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			
			HttpSession session = req.getSession();

			if (check!= null) {

				UserDAOImpl dao = new UserDAOImpl(DBconnect.getConn());
				boolean f1=dao.checkUser(email);
				
				
				if (f1) {
					
					
					boolean f=dao.userRegister(us);
					if(f) {
					// System.out.println("User Registerd Successfully !");

					session.setAttribute("succMsg", "Registration Successful !");
					resp.sendRedirect("register.jsp");

				} else {
					// System.out.println("Something went wrong !");
					session.setAttribute("failedMsg", "Something went wrong !");
					resp.sendRedirect("register.jsp");

				}
				}
				else {
					session.setAttribute("failedMsg", "User already exists");
					resp.sendRedirect("register.jsp");

				}
				

			} else {

				// System.out.println("Please accept Terms & Conditions");
				session.setAttribute("failedMsg", "Please accept Terms & Conditions!");
				resp.sendRedirect("register.jsp");

			}
			}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	
}
}
