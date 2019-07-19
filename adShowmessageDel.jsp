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

Connection con = null;
Statement st = null;
ResultSet rs = null;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
st = con.createStatement();

String sql = "select * from sparks.messageinfo where id=" + id;
System.out.println("sql on show: " + sql);
rs = st.executeQuery(sql);


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

Owner: <input type="text" name="Owner" value="<%=ownername %>" readonly><br>
Topic: <input type="text" name="Topic" value="<%=topic %>" readonly><br>
Message: <input type="text" name="Message" value="<%=message %>" readonly><br>


<h>reply message</h>

<%
String sql2 = "select * from sparks.replyinfo where ownername=\"" + ownername + "\" and messageid=" + id ;
System.out.println("sql2: " + sql2);
rs = st.executeQuery(sql2);
while(rs.next()){
	String replymessage = rs.getString("replymessage");
	String replyowner = rs.getString("replyowner");
	String replyid = rs.getString("id");

%>
replyer: <input type="text" name="replyer" value="<%=replyowner %>" readonly> <a href="adDelreply.jsp?id=<%=replyid %>">Del</a>  <br>
reply message: <input type="text" name="replymessage" value="<%=replymessage %>" readonly><br>

<%
}
session.setAttribute("messageid", id);
session.setAttribute("ownername", ownername);
%>
<form action="reply.jsp">
<textarea rows="4" cols="50" name="reply">
your message
</textarea>
<input type="submit" value="Submit">
</form>


</body>
</html>