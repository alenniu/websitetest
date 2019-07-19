<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String newpassword = request.getParameter("newpassword");
String username = session.getAttribute("username").toString();

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();
//ResultSet rs;
String sql = "update sparks.userinfo set password=\"" + newpassword + "\" where username=\"" + username + "\"";
System.out.println("reste password: " + sql);
st.executeUpdate(sql);

response.sendRedirect("usermessagelist.jsp");
%>
</body>
</html>