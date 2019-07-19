<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*,java.util.*"%>
     <%
     String cataloguename = request.getParameter("cataloguename");
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table>
 <tr>
 <%
 

 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
         "root", "watermelon");
 Statement st = con.createStatement();
 ResultSet rs;
 String sql = "select name,icon FROM sparks.catalogue";
 rs = st.executeQuery(sql);
 //STEP 5: Extract data from result set
 String name = null;
 String icon = null;
 while(rs.next()){
 	name = rs.getString("name");
 	icon = rs.getString("icon");
 	icon = "images/" + icon;
 	
 %>
 	<th> <a href="usermessagelist.jsp?cataloguename=<%=name %>" style="color:#176093;text-decoration:none;font-size:11pt;font-weight:normal;"> <img src="<%=icon %>" style="width:20px; height:20px"> <%=name %></a> </th>
 <%
 }	
 %>
 
 
 
 
  </tr>
 </table>
<h1>User Messages</h1> <a href="createnewtopic.jsp?cataloguename=<%=cataloguename %>">create new topic</a>  <a href="updatemyprofile.jsp">my profile</a>
<div class="tbl-header">
<table cellpadding="0" cellspacing="0" border="0">
<thead>
  <tr>
    <th>Id</th>
    <th>Creator</th>
    <th>Topic</th>
    <th>Message</th> 
  </tr>
  </thead>
  </table>
  </div>
  
 
  <% 
 
  
 ArrayList al = new ArrayList();
  Class.forName("com.mysql.jdbc.Driver");
//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
  //      "root", "kootracats");
//Statement st = con.createStatement();
//ResultSet rs;
rs = st.executeQuery("select * from messageinfo where type=\"" + cataloguename + "\"");
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
 <div class="tbl-content"> 
    <table cellpadding="0" cellspacing="0" border="1" bordercolor="grey">
    <tbody>
	<tr>
    <td><%=id %></td>
    <td><%=ownername %></td>
    <td><a href="showmessage.jsp?id=<%=pid %>" style="color:#176093;text-decoration:none;font-size:11pt;font-weight:normal;"><%=topic %></a></td>
    <td><%=message %></td> 
  </tr>
  </tbody>
  </div>
  </table>
  
    
<%
}
session.setAttribute("id", al);
%>


<style>
h1{
  font-size: 30px;
  color: black;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: white;
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid white;
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: black;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: black;
  border-bottom: solid 1px white;
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background-color: white;
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: black;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: black;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}
</style>
</body>
</html>