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
String replyid = request.getParameter("replyid");
System.out.println("replyid: " + replyid);


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();

//String sql = "INSERT INTO sparks.replyinfo " + "VALUES (null, '', '', '')";
String sql = "select point from sparks.replyinfo where id=" + replyid;
ResultSet rs = st.executeQuery(sql);
int beforepoint = 0;
while(rs.next()){
	beforepoint = rs.getInt("point");
}
int afterpoint = beforepoint + 1;
String sql2 = "update sparks.replyinfo set point=" + afterpoint + " where id=" + replyid;
st.executeUpdate(sql2);

out.println("Thank you for contributing!");
%>
</body>
</html>