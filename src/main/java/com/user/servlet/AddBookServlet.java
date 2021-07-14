package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;
@MultipartConfig
@WebServlet("/addBookServlet")
public class AddBookServlet extends HttpServlet{

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				String bookName = req.getParameter("bName");
				String author = req.getParameter("author");
				Double price = Double.parseDouble(req.getParameter("price"));
				String categories="Old";
				String status="Active";
				Part part = req.getPart("bimg");
				String fileName = part.getSubmittedFileName();

				String useremail=req.getParameter("useremail");
				BookDtls b=new BookDtls(bookName,author,price,categories, status,fileName, useremail);

				System.out.println(b);

				BookDAOImpl dao = new BookDAOImpl(DBconnect.getConn());

				boolean f = dao.addBooks(b);
				HttpSession session = req.getSession();
				if (f) {

					String path = getServletContext().getRealPath("") + "book";

					// System.out.println(path);
					File file = new File(path);
					part.write(path + File.separator + fileName);
//					

					session.setAttribute("succMsg", "Book Add Successfully !");
					resp.sendRedirect("sellOldbook.jsp");
				} else {
					session.setAttribute("failedMsg", "Something went wrong !");
					resp.sendRedirect("sellOldbook.jsp");

				}

			} catch (Exception e) {

			}

		}


}
