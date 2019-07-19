<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String replyid = request.getParameter("id");
System.out.println(replyid);


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
      "root", "watermelon");
Statement st = con.createStatement();
String sql = "DELETE FROM sparks.replyinfo WHERE id = " + replyid;
st.executeUpdate(sql);

response.sendRedirect("adusermessagelist.jsp");
%>
</body>
</html>