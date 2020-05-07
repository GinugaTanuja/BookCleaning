<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Regjsp</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
String user=request.getParameter("user");
session.putValue("user",user);
String pwd=request.getParameter("pwd");
String role=request.getParameter("role");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/book_cleaning","root","root123");
Statement st=con.createStatement();
ResultSet rs;

/*String i=("insert into members_details(user,pwd) values(?,?,?)");
PreparedStatement pstmt = con.prepareStatement(i);
pstmt.setString(1,user);
pstmt.setString(2,pwd);
pstmt.setString(3,role);
pstmt.executeUpdate();*/
int i =st.executeUpdate("insert into members_details values('"+user+"','"+pwd+"','"+role+"')");
out.println("Registered...");
%>
<br/>
<a href="log.html">Log in</a><br/>
<a href="home.html">Home</a><br/>
</body>
</html>   
