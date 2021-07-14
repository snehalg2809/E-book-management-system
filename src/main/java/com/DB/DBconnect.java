package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
private static Connection conn;
 public static Connection getConn()
 {
	 try{
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebbok-app","root","");
	System.out.println("conn");
	 }catch(Exception ex) {
		 ex.printStackTrace();
			System.out.println("error");


	 }
	 
 
	return conn;
 }
}
