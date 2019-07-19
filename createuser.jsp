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

String uname = request.getParameter("uname");    
String pass = request.getParameter("pass");

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();

//String sql = "INSERT INTO sparks.replyinfo " + "VALUES (null, '', '', '')";
String sql = "INSERT INTO sparks.userinfo " + "VALUES (null, " + "\"" + uname + "\"," + "\"" + pass + "\")";
System.out.println("sql at createuser" + sql);
st.executeUpdate(sql);
response.sendRedirect("usermessagelist.jsp");
}catch(Exception e){
	response.sendRedirect("login.jsp");
}

%>
</body>
</html>