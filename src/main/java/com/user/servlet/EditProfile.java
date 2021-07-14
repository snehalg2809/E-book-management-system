package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBconnect;
import com.entity.user;

@WebServlet("/editprofileServlet")
    public class EditProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	    	
	    	int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String pass=req.getParameter("password");
			
			
			user us=new user();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);

			HttpSession session = req.getSession();

			UserDAOImpl dao=new UserDAOImpl(DBconnect.getConn());
			boolean f=dao.checkPassword(id, pass);
			
			if (f) {
				boolean f2=dao.EditProfile(us);
				if (f2) {
					session.setAttribute("succMsg", "Profile Update Successfully");
					resp.sendRedirect("Editprofile.jsp");
				} else {
					session.setAttribute("failedMsg", "Something went wrong");
					resp.sendRedirect("Editprofile.jsp");
				}

			}else {
				session.setAttribute("failedMsg", "Password is incorrect");
				resp.sendRedirect("Editprofile.jsp");
				
			}

			
			
	    	
	    }catch(Exception e) {
	    	
	    }
	}

}
