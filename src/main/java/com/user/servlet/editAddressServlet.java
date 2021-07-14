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

@WebServlet("/edit_address")
public class editAddressServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			int id=Integer.parseInt(req.getParameter("uid"));
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pin=req.getParameter("pin");
			
			user us=new user();
			us.setId(id);
			us.setAddress(address);
			us.setLandmark(landmark);
			us.setCity(city);
			us.setState(state);
			us.setPincode(pin);
			
			UserDAOImpl dao=new UserDAOImpl(DBconnect.getConn());
			boolean f=dao.EditAddress(us);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Address Update Successfully");
				resp.sendRedirect("editaddress.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("editaddress.jsp");
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
