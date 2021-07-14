<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.*"%>

<%
String fname=request.getParameter("fname");
String email=request.getParameter("email");
String phno=request.getParameter("phno");
String sec=request.getParameter("sec");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");


int check=0;
try{
	Connection conn=DBconnect.getConn();
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and phno='"+phno+"'");
	
	while(rs.next()){
		check=1;
		Statement sm=conn.createStatement();
		sm.executeUpdate("update user set password='"+password+"' where email='"+email+"'");
		response.sendRedirect("forgetPassword.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("forgetPassword.jsp?msg=invalid");

	}
}catch(Exception e){
	System.out.println(e);
}

%>
