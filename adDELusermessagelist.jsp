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
ArrayList al = new ArrayList();
String pid = request.getParameter("id");
String[] idarry =null;
String id = null;
if(pid != null){
idarry = pid.split("-");
id = idarry[0];
//String ownername = idarry[1];
System.out.println("id: " + id);
}else{
	al = (ArrayList)session.getAttribute("id");
}

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
      "root", "watermelon");
Statement st = con.createStatement();
String sql = "DELETE FROM sparks.messageinfo WHERE id = " + id;
st.executeUpdate(sql);

String sql2 = "DELETE FROM sparks.replyinfo WHERE messageid = " + id;
st.executeUpdate(sql2);

response.sendRedirect("usermessagelist.jsp");
%>
</body>
</html>