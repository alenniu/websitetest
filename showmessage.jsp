<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="css.php?css=xenforo,form,public&amp;style=1&amp;dir=LTR&amp;d=1543097663" />
	<link rel="stylesheet" href="css.php?css=discussion_list,login_bar,notices,panel_scroller&amp;style=1&amp;dir=LTR&amp;d=1543097663" />
</head>
<body>

<table>
 <tr>
 <%
 

 Class.forName("com.mysql.jdbc.Driver");
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

String topic = null;
String message = null;
String ownername = null;

//Connection con = null;
//Statement st = null;
//ResultSet rs = null;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
st = con.createStatement();

String sql2 = "select * from sparks.messageinfo where id=" + id;
System.out.println("sql on show: " + sql);
rs = st.executeQuery(sql2);



if (rs.next()) {
	topic = rs.getString("topic");
	message = rs.getString("message");
	ownername = rs.getString("ownername");
	
	rs.close();
} else {
    out.println("null");
}
}catch(Exception e){
	e.printStackTrace();
}
/*
finally{
	try{
		//con.close();
	}catch(Exception j){
		j.printStackTrace();
	}
}*/
%>

<table border="0" width="100%" bgcolor="#EAEAF0" >
<tr>
<th>
<div><%=topic %></div><br>
</th>
</tr>
</table>
<br>
<table cols="2" border="1" width="100%">
<tr>
<th>
Owner: 
<input type="text" name="Owner" value="<%=ownername %>" readonly><br>
</th>
<th>
<input type="text" name="Message" value="<%=message %>" readonly><br>
</th>

</tr>

</table>


<%
String sql2 = "select * from sparks.replyinfo where ownername=\"" + ownername + "\" and messageid=" + id ;
System.out.println("sql2: " + sql2);
rs = st.executeQuery(sql2);
while(rs.next()){
	String replymessage = rs.getString("replymessage");
	String replyowner = rs.getString("replyowner");

	String point = rs.getString("point");
	String replyid = rs.getString("id");
%>
<table cols="2" border="1" width="100%">
<tr>
<th>

Replier: <div><%=replyowner %></div> <a href="addPoint.jsp?replyid=<%=replyid %>" target="_blank" class="button button-like"><i class="fa fa-heart"></i><span>Like</span></a>  <i class="fas fa-thumbs-up"></i>  <%=point %>   <br>
</th>
<th>
Reply: <div><%=replymessage %></div><br>
</th>

</tr>

</table>





<%
}
session.setAttribute("messageid", id);
session.setAttribute("ownername", ownername);
%>
<form action="reply.jsp">
<textarea rows="4" cols="50" name="reply" placeholder="Type Your Reply Here!">
</textarea>
<input type="submit" value="Submit">
</form>

<script>
$(document).foundation();

$(function() {
  $('.button-like')
    .bind('click', function(event) {
      $(".button-like").toggleClass("liked");
    })
});

</script>

<style>

.button-like {
  border: 2px solid #8a8a8a;
  background-color: transparent;
  text-decoration: none;
  padding: 1rem;
  position: relative;
  vertical-align: middle;
  text-align: center;
  display: inline-block;
  border-radius: 3rem;
  color: #8a8a8a;
  transition: all ease 0.4s;
}

.button-like span {
  margin-left: 0.5rem;
}

.button-like .fa,
.button-like span {
  transition: all ease 0.4s;
}

.button-like:focus {
  background-color: transparent;
}

.button-like:focus .fa,
.button-like:focus span {
  color: #8a8a8a;
}

.button-like:hover {
  border-color: #cc4b37;
  background-color: transparent;
}

.button-like:hover .fa,
.button-like:hover span {
  color: #cc4b37;
}

.liked {
  background-color: #cc4b37;
  border-color: #cc4b37;
}

.liked .fa,
.liked span {
  color: #fefefe;
}

.liked:focus {
  background-color: #cc4b37;
}

.liked:focus .fa,
.liked:focus span {
  color: #fefefe;
}

.liked:hover {
  background-color: #cc4b37;
  border-color: #cc4b37;
}

.liked:hover .fa,
.liked:hover span {
  color: #fefefe;
}


</style>
</body>


</html>