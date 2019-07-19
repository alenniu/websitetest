<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String ownername = session.getAttribute("ownername").toString();
String replymessage = request.getParameter("reply");
String id = session.getAttribute("messageid").toString();
System.out.println("id: " + id);

String replyowner = session.getAttribute("username").toString();

System.out.println("replymessage: " + replymessage);

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();

//String sql = "INSERT INTO sparks.replyinfo " + "VALUES (null, '', '', '')";
String sql = "INSERT INTO sparks.replyinfo " + "VALUES (null, " + "\"" + ownername + "\"," + "\"" + replymessage + "\"," + "\"" + replyowner + "\"," + id + ",0)";
System.out.println("insert replyinfo: " + sql);
st.executeUpdate(sql);
response.sendRedirect("catalogue.jsp");
%>
</body>
</html>