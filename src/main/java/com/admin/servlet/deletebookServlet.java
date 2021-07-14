package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBconnect;

@WebServlet("/delete")
public class deletebookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
			boolean f=dao.deleteBooks(id);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book delete Successfully");
				resp.sendRedirect("admin/allbooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("admin/editBooks.jsp");
			}

			

			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
