<!--
AUTHOR: MADISON CHASE
PROJECT: PROJECT 1 - ROLODEX
FILE: editentry2.jsp
-->

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
        int id;
        String idString;
        String idTrim;
        String phone;

        //Requests html form entries//
        idString = request.getParameter("idForm");
        name = request.getParameter("nameForm");
        phone = request.getParameter("phoneForm");
        //Trims the whitespaces that may interfere with the conversion from string to int//
        idTrim = idString.trim();
        id = Integer.parseInt(idTrim);
        //Start connection to database//
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/rolodex");
        Statement statement = connection.createStatement();
        //SQL statement to update database//
        String sql = "UPDATE rolodex SET NAME = '"+name+"', PHONE = '"+phone+"' WHERE ID = '"+id+"'";
        statement.executeUpdate(sql);
        //Closes ocnnection//
        statement.close();
        connection.close();

    %>
</body>
</html>
