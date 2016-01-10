<!--
AUTHOR: MADISON CHASE
PROJECT: PROJECT 1 - ROLODEX
FILE: editentry.html
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
        int id;
        String idString;
        String idTrim;
        //Requests data entered in the html form//
        idString = request.getParameter("idForm");
        //Trims the whitespaces that may interfere with the conversion from string to int//
        idTrim = idString.trim();
        //Converts the string to int//
        id = Integer.parseInt(idTrim);
        //Creates connection to database//
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/rolodex");
        Statement statement = connection.createStatement();
        //Select SQL statement//
        String sql = ("SELECT * FROM rolodex WHERE ID = '"+id+"'");
        ResultSet result = statement.executeQuery(sql);
        //Start of loop//
        while (result.next()) {
    %>
    <%--Form to edit record and to submit when finished--%>
    <form name="form" action="editentry2.jsp" target="rightframe" method=GET>
        <td><input type="text" name="idForm" readonly="readonly" size="4" value="<%=result.getString("ID")%>"></td>
        <td><input type="text" name="nameForm" maxlength="25" value="<%=result.getString("NAME")%>"></td>
        <td><input type="text" name="phoneForm" maxlength="10" value="<%=result.getString("PHONE")%>"></td>
        <input type="Submit" value="Submit">
    </form>
    <%
      } //End of loop//
        statement.close();
        connection.close();
    %>
</body>
</html>
