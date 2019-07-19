<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>User Messages</h1> <a href="createnewtopic.jsp">create new topic</a>

<table style="width:100%" border="1">
  <tr>
    <th>Id</th>
    <th>Topic</th>
    <th>Message</th> 
  </tr>
  <% 
 ArrayList al = new ArrayList();
  Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from messageinfo");
int i=0;
while (rs.next()) {
	
	System.out.println("row : " + i);
    //session.setAttribute("userid", userid);
    //out.println("welcome " + userid);
    //out.println("<a href='logout.jsp'>Log out</a>");
    //response.sendRedirect("usermessagelist.jsp");
    String id = rs.getString("id");
    String topic = rs.getString("topic");
    String message = rs.getString("message");
    String ownername = rs.getString("ownername");
    String pid = id + "-" + ownername + "-" + i;
    al.add(i, pid);
    i++;
%>
	<tr>
    <th><%=id %></th>
    <th><a href="adShowmessageDel.jsp?id=<%=pid %>"><%=topic %></a></th>
    <th><%=message %></th> 
    <th><a href="adDELusermessagelist.jsp?id=<%=pid %>">Del</a></th> 
  </tr>
<%
}
session.setAttribute("id", al);
%>
</table>


</body>
</html>