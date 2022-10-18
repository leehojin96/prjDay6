<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
//0.데이터베이스 정보 준비
//1.드라이버 로딩
//2.Connection 생성
//3.Statement 생성
//4.쿼리 작성 입력 실행 출력

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String password = "1234";

Class.forName(driver);

Connection con = DriverManager.getConnection(url, user, password);
if(con!=null){
	out.print("ok");
}else{
	out.print("fail");
}

String sql="select * from tbl_course_300";
PreparedStatement pst = con.prepareStatement(sql);
ResultSet rs = pst.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="list.css" rel="stylesheet">
</head>
<body>
	<table>
		<caption>수강과목 조회</caption>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
<% while(rs.next()){ //next : 1행씩 데이터를 담아오기 다음 데이터가 없으면 fulse 반환 %>
		<tr>
			<td><a href="update.jsp?code=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
<%}

rs.close();
pst.close();
con.close();


%>
	</table>
</body>
</html>