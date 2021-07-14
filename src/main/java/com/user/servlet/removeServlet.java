package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBconnect;

@WebServlet("/remove")
public class removeServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));


		CartDAOImpl dao=new CartDAOImpl(DBconnect.getConn());
		boolean f=dao.removeBooks(bid,uid,cid);
		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "Book removed from cart");
			resp.sendRedirect("myCart.jsp");
		} else {
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("myCart.jsp");
		}
	}catch(Exception e) {
		
	}
	}

}
