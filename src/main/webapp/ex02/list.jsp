<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>

<%

String sql ="select * from tbl_course_300";
PreparedStatement  pst  =con.prepareStatement(sql);
ResultSet rs  =pst.executeQuery();

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
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><a href="update.jsp?s_id=<%=rs.getString(1) %>">수정</a> / 삭제</td>
		</tr>
<%}

rs.close();
pst.close();
con.close();


%>
	</table>
</body>
</html>