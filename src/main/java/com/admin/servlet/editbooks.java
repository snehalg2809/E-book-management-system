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
import com.entity.BookDtls;

@WebServlet("/editbooks")
public class editbooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		 
		try {
		    int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bName");
			String author = req.getParameter("author");
			Double price = Double.parseDouble(req.getParameter("price"));
			String status = req.getParameter("status");

			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);

			BookDAOImpl dao = new BookDAOImpl(DBconnect.getConn());
			boolean f = dao.updateEditBooks(b);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Update Successfully");
				resp.sendRedirect("admin/allbooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("admin/editBooks.jsp");
			}

		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
}
