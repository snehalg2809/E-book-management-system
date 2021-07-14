package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	try {
		int uid=Integer.parseInt(req.getParameter("uid"));
		int bid=Integer.parseInt(req.getParameter("bid"));

		
		
		BookDAOImpl dao=new BookDAOImpl(DBconnect.getConn());
		BookDtls b=dao.getBookById(bid);
		
		Cart c=new Cart();
		c.setBid(bid);
		c.setUid(uid);
		c.setBook_name(b.getBookName());
		c.setAuthor(b.getAuthor());
		c.setPrice(b.getPrice());
		c.setTotal_price(b.getPrice());
		
		CartDAOImpl dao1=new CartDAOImpl(DBconnect.getConn());
		boolean f=dao1.addCart(c);
		
	HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("addCart", "Book Added to cart");
			resp.sendRedirect("all_new_books.jsp");

			
		}else {
			session.setAttribute("failed", "something wrong ");
			resp.sendRedirect("index.jsp");

			System.out.println("error");
		}
		
		
	}catch(Exception e) {
		System.out.println(" smerror");

	}
	
	
	}

	
}
