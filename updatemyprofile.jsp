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
String username = session.getAttribute("username").toString();


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();
ResultSet rs;
String sql = "select COUNT(*) as num FROM sparks.messageinfo where ownername='" + username + "'";
rs = st.executeQuery(sql);
int postnum = 0;
//STEP 5: Extract data from result set
while(rs.next()){
	postnum = rs.getInt("num");
}
//rs.close();
//st.close();

out.println("your post number is" + postnum);

String sql2 = "SELECT count(*) as num FROM sparks.replyinfo where replyowner='"  + username + "'";
rs = st.executeQuery(sql2);
int replynum = 0;
//STEP 5: Extract data from result set
while(rs.next()){
	replynum = rs.getInt("num");
}
out.println("your reply number is" + replynum);
%>
<form action="resetPassword.jsp" method="post">  
new Password:<input type="text" name="newpassword"/><br/><br/>  
<input type="submit" value="reset password"/>"  
</form>  
</body>
</html>