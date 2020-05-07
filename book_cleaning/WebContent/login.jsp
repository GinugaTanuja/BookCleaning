<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*" %>
<%!
String username;
String pass;
%>
<%
String user=request.getParameter("usr");
session.putValue("user",user);
String pwwd=request.getParameter("pwwd");
String role=request.getParameter("role");
//session.putValue("pwd",pwd);
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");
Statement st =con.createStatement();
//String query =("select * from registration where user ='"+user+"'");
ResultSet rs = st.executeQuery("select * from members_details where user ='"+user+"'");

//out.println(rs.getString(2));
try
{
if(rs.next())
{
	if(rs.getString(2).equals(pwwd) && rs.getString(3).equals("Librarian"))
	{
		out.println("welcome"+user);
		response.sendRedirect("librarianPage.html");
		String query = "INSERT INTO login_timings(user,last_login,role )VALUES (?, CURRENT_TIMESTAMP,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1,user);
		pstmt.setString(2,role);
		pstmt.executeUpdate();
	}
	else if(rs.getString(2).equals(pwwd) && rs.getString(3).equals("Admin"))
	{
		out.println("welcome"+user);
		response.sendRedirect("barcode.html");
		String query = "INSERT INTO login_timings(user,last_login,role )VALUES (?, CURRENT_TIMESTAMP,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1,user);
		pstmt.setString(2,role);
		pstmt.executeUpdate();
	}
	else
	{
		out.println("invalid userid or password...");
		out.println(rs.getString(2));
		out.println(pwwd);
		out.println(user);
		//response.sendRedirect("barcode.html");
	}
}
}
catch(Exception e)
{
	System.out.println(e);
}
finally
{
	rs.close();
	con.close();
	
}
%>
<br/>

<a href="home.html">Home</a><br/>
</body>
</html>