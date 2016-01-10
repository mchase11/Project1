<!--
AUTHOR: MADISON CHASE
PROJECT: PROJECT 1 - ROLODEX
FILE: newentry2.html
-->


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body bgcolor='white'>
    <%
        //Variables//
        String name;
        String phoneNumber;
        int ID;

        //Extracts the parameter of the submitted html form//
        name=request.getParameter("formName");
        phoneNumber=request.getParameter("formPhone");
        ID = Integer.parseInt(request.getParameter("formID"));
        //Connects to the database//
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/rolodex");
        Statement statement = connection.createStatement();
        //Uses SQL to insert the values from the html form into the database//
        String sql = "INSERT INTO rolodex values('"+ID+"', '"+name+"','"+phoneNumber+"')";
        statement.executeUpdate(sql);
        //Closes connection//
        statement.close();
        connection.close();
    %>
</body>
</html>
