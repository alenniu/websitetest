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
<form action="" method="post">
topic:
<input type="text" name="topic"/><br/><br/>  
message:
<textarea rows="4" cols="50" name="message">
your message
</textarea>
<br/><br/>  
<input type="submit" value="create message"/>



</form> 
<%
String cataloguename = request.getParameter("cataloguename");
System.out.println("cataloguename in createnewtopic: " + cataloguename);
String topic = request.getParameter("topic");
String message = request.getParameter("message");
if(topic !=null && message !=null){
	String ownername = session.getAttribute("username").toString();
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
	        "root", "watermelon");
	Statement st = con.createStatement();
	
	//String sql = "INSERT INTO sparks.replyinfo " + "VALUES (null, '', '', '')";
	String sql = "INSERT INTO sparks.messageinfo " + "VALUES (null, " + "\"" + topic + "\"," + "\"" + message + "\"," + "\"" + ownername + "\"," + "\"" + cataloguename + "\")";
	System.out.println("insert at createnewtopic" + sql);
	st.executeUpdate(sql);
	
	response.sendRedirect("catalogue.jsp");
}
%> 
</body>
</html>