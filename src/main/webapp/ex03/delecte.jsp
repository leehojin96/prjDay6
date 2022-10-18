<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "dbcon.jsp" %>
    <%
    String s_id = request.getParameter("s_id");
    
    String sql=" delete from tbl_course_300 where s_id= ?";
    
    PreparedStatement pst = con.prepareStatement(sql);
    
    pst.setString(1, s_id);	
    pst.executeUpdate();
    pst.close();
    con.close();

    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
location.href="index.html";
</script>
</head>
<body>

</body>
</html>