package com.user.servlet;

import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderDAO;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBconnect;
import com.entity.BookDtls;
import com.entity.Book_Order;
import com.entity.Cart;
import com.mysql.cj.Session;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name= req.getParameter("username");
			String email= req.getParameter("email");
			String phno= req.getParameter("phno");
			String address= req.getParameter("address");
			String landmark= req.getParameter("landmark");
			String city= req.getParameter("city");
			String state= req.getParameter("state");
			String pincode= req.getParameter("pincode");
			String payment= req.getParameter("payment");
			
			
			String fullAdd=address + "," + landmark + "," + city + "," + state + "," + pincode;
			
			System.out.println(name + " "+email+" "+phno+" "+fullAdd + payment);
			CartDAOImpl dao=new CartDAOImpl(DBconnect.getConn());
			List<Cart> b=dao.getBookByUser(id);

			if (b.isEmpty()) {
				session.setAttribute("failedMsg", "Please Add Item TO CART ");
				resp.sendRedirect("myCart.jsp");
			}else {
				BookOrderImpl dao2=new BookOrderImpl(DBconnect.getConn());
				Book_Order order=null;
				
				ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
				Random random=new Random();
				for (Cart cart:b) {
					order=new Book_Order();
					order.setOrder_id("BOOK-ORD-00"+random.nextInt(1000));
					order.setUsername(name);
					order.setEmail(email);
					order.setFullAdd(fullAdd);
					order.setPhno(phno);
					order.setBook_name(cart.getBook_name());
					order.setAuthor(cart.getAuthor());
					order.setPrice(cart.getPrice());
					order.setPayment(payment);
					orderList.add(order);
					//System.out.println(cart.getBook_name() +cart.getAuthor() +cart.getPrice());
				}
				
				if ("noselect".equals(payment)) {
					session.setAttribute("failedMsg", "Please select Payment type");
					resp.sendRedirect("myCart.jsp");
					
				}else {
					boolean f=dao2.SaveOrder(orderList);
					if(f) {
						
						System.out.println("order success");
						resp.sendRedirect("placeorder.jsp");
					}else {
						session.setAttribute("failedMsg", "Order Failed");
						resp.sendRedirect("myCart.jsp");
					}
				}

			}

			
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	
}
