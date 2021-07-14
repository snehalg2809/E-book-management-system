package com.entity;

public class Book_Order {

	private int id;
	private String order_id;
	private String username;
	private String email;
	private String phno;
	private String  fullAdd;
	private String book_name;
	private String author;
	private double price;
	private String payment;

	
	
	public Book_Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book_Order(int id, String username, String email, String phno, String fullAdd, String payment) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.phno = phno;
		this.fullAdd = fullAdd;
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", username=" + username + ", email=" + email + ", phno=" + phno + ", fullAdd="
				+ fullAdd + ", payment=" + payment + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
		
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFullAdd() {
		return fullAdd;
	}
	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
	
}
