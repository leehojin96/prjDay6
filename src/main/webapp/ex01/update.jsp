<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
String code = request.getParameter("code");
out.print(code);

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

String sql = "select * from tbl_course_300 where s_id = ?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, code);
ResultSet rs = pst.executeQuery();

String s_id  = "";
String s_name= "";
String s_grade = "";
String teacher_id= "";
String weekday= "";
String start_h = "";
String end_h= "";

if(rs.next()){
	s_id=rs.getString(1);
	s_name=rs.getString(2);
	s_grade=rs.getString(3);
	teacher_id=rs.getString(4);
	weekday=rs.getString(5);
	start_h=rs.getString(6);
	end_h=rs.getString(7);
}
rs.close();
pst.close();
con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>

<script>

</script>
</head>
<body>

	<form name="frm" action="update_action.jsp" method="post">
		<table>
			<caption>수강과목 등록</caption>
			<tr>
				<td>교과목 코드</td>
				<td><input type="text" name="s_id" value=<%=s_id%>></td>
			</tr>
			<tr>
				<td>교과명</td>
				<td><input type="text" name="s_name" value=<%=s_name%>></td>
			</tr>
			<tr>
				<td>당당강사</td>
				<td><select name="teacher_id">
						<option value="">선택</option>
						<option value="1">정국교수</option>
						<option value="2">뷔교수</option>
						<option value="3">지민교수</option>
						<option value="4">제이홉교수</option>
						<option value="5">슈가교수</option>
						<option value="6">진교수</option>
						<option value="7">RM교수</option>
				</select></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="s_grade" value=<%=s_grade%>></td>
			</tr>
			<tr>
				<td>요일</td>
				<td><input type="radio" name="weekday" value="M"> 월 <input
					type="radio" name="weekday" value="TU"> 화 <input
					type="radio" name="weekday" value="W"> 수 <input
					type="radio" name="weekday" value="TH">목 <input
					type="radio" name="weekday" value="F"> 금 <input
					type="radio" name="weekday" value="SA"> 토</td>
			</tr>
			<tr>
				<td>수업시작시간</td>
				<td><input type="text" name="start_h" value=<%=start_h%>>
			</tr>
			<tr>
				<td>수업종료시간</td>
				<td><input type="text" name="end_h" value=<%=end_h%>></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="첫페이지" onclick="window.location.href='index.html'">
					<input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>

</body>
</html>