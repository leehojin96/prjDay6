<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "dbcon.jsp" %>
    <%
    request.setCharacterEncoding("UTF-8");
    String s_id = request.getParameter("s_id");
    String s_name = request.getParameter("s_name");
    String s_grade = request.getParameter("s_grade");
    String teacher_id = request.getParameter("teacher_id");
    String weekday = request.getParameter("weekday");
    String start_h = request.getParameter("start_h");
    String end_h = request.getParameter("end_h");
    
    String sql =  " UPDATE tbl_course_300 SET s_name=?, s_grade=?, teacher_id=?, weekday=?, start_h=?, end_h=? WHERE s_id=? ";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setString(1, s_name);
    pst.setString(2, s_grade);
    pst.setString(3, teacher_id);
    pst.setString(4, weekday);
    pst.setString(5, start_h);
    pst.setString(6, end_h);
    pst.setString(7, s_id);
    pst.executeUpdate();
    pst.close();
    con.close();
    
    
    response.sendRedirect("list.jsp"); 
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