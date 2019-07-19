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

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparks?useLegacyDatetimeCode=false&serverTimezone=UTC",
        "root", "watermelon");
Statement st = con.createStatement();
ResultSet rs;
String sql = "select name FROM sparks.catalogue";
rs = st.executeQuery(sql);
//STEP 5: Extract data from result set
String name = null;
while(rs.next()){
	name = rs.getString("name");
	
%>

                        <div class="container">
                        <div class="col-md-4">
                        <div class="find-place-img_wrap">
                        <div class="grid">
                         <figure class="effect-ruby">
                               <div class="centered"><a href="usermessagelist.jsp?cataloguename=<%=name %>" style="color: #ffffff; text-decoration: none; font-size: 50px;"><%=name %></a></div>
                                <figcaption>
                                    <a href="usermessagelist.jsp?cataloguename=<%=name %>"> <img style="width:100%; height:auto" src="images/music.png" class="img-fluid" alt="img13" /></a>
                                    
                                </figcaption>
                            </figure>
                        </div>
                  
                    </div>
                </div>
                

		
	</div>
	 
                  
	<style>
	.container {
  position: relative;
  text-align: center;
  color: white;
}

	.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
	</style>
<%
}
 %>

</body>
</html>