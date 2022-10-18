<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String weekday = request.getParameter("weekday");
String s_id = request.getParameter("s_id");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String password = "1234";

Class.forName(driver);

Connection con = DriverManager.getConnection(url, user, password);

if (con != null) {
	out.print("ok");
} else {
	out.print("fail");
}

String sql="update tbl_course_300 set weekday=? where s_id=?";

PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, weekday);
pst.setString(2, s_id);

pst.executeUpdate();
response.sendRedirect("index.html"); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>