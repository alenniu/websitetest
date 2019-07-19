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

String userid = request.getParameter("username");    
String pwd = request.getParameter("password");

session.setAttribute("username", userid);


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from userinfo where username='" + userid + "' and password='" + pwd + "'");
/*
if (rs.next() && !userid.equals("admin")) {
    session.setAttribute("userid", userid);
    out.println("welcome " + userid);
    out.println("<a href='logout.jsp'>Log out</a>");
    response.sendRedirect("usermessagelist.jsp");
} else if(rs.next() && userid.equals("admin")){
	response.sendRedirect("adusermessagelist.jsp");
}else{
	out.println("Invalid password <a href='index.jsp'>try again</a>");
}*/

if(rs.next()){
	if(!userid.equals("admin")){
		session.setAttribute("userid", userid);
	    out.println("welcome " + userid);
	    out.println("<a href='logout.jsp'>Log out</a>");
	  //  response.sendRedirect("usermessagelist.jsp");
	    response.sendRedirect("catalogue.jsp");
	}else if(userid.equals("admin")){
		//response.sendRedirect("adusermessagelist.jsp");
		response.sendRedirect("catalogue.jsp");
	}
}

%>  

</body>
</html>