package com.DAO;

import java.awt.Point;
import java.io.PipedWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderImpl implements BookOrderDAO {

	private Connection connection;

	public BookOrderImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean SaveOrder(List<Book_Order> blist) {

		boolean f = false;
		try {
			String sql = "insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values (?,?,?,?,?,?,?,?,?)";

			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement(sql);

			for (Book_Order bo : blist) {
				ps.setString(1, bo.getOrder_id());
				ps.setString(2, bo.getUsername());
				ps.setString(3, bo.getEmail());
				ps.setString(4, bo.getFullAdd());
				ps.setString(5, bo.getPhno());
				ps.setString(6, bo.getBook_name());
				ps.setString(7, bo.getAuthor());
				ps.setDouble(8, bo.getPrice());
				ps.setString(9, bo.getPayment());
				ps.addBatch();

			}
			int[] count = ps.executeBatch();
			connection.commit();
			f = true;
			connection.setAutoCommit(true);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}

	public List<Book_Order> getBook(String email) {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order order = null;

		try {
			String sql = "select * from book_order where email=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new Book_Order();
				order.setId(rs.getInt(1));
				order.setOrder_id(rs.getString(2));
				order.setUsername(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFullAdd(rs.getString(5));
				order.setPhno(rs.getString(6));
				order.setBook_name(rs.getString(7));
				order.setAuthor(rs.getString(8));
				order.setPrice(rs.getDouble(9));
				order.setPayment(rs.getString(10));

				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Book_Order> getAllOrder() {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order order = null;

		try {
			String sql = "select * from book_order ";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new Book_Order();
				order.setId(rs.getInt(1));
				order.setOrder_id(rs.getString(2));
				order.setUsername(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFullAdd(rs.getString(5));
				order.setPhno(rs.getString(6));
				order.setBook_name(rs.getString(7));
				order.setAuthor(rs.getString(8));
				order.setPrice(rs.getDouble(9));
				order.setPayment(rs.getString(10));

				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
