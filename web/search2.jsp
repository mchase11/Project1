<!--
AUTHOR: MADISON CHASE
PROJECT: PROJECT 1 - ROLODEX
FILE: search2.jsp
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

        //Requests the data inputed into the html form from search.jsp//
        name = request.getParameter("nameSearch");

        //Opens connection to rolodex database//
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/rolodex");
        Statement statement = connection.createStatement();
        
        //Select string to select similar names that are like the one imputted in the search box//
        String sql = ("SELECT * FROM giantdogs");
        ResultSet result = statement.executeQuery(sql);
        
        //Start of loop//
        while (result.next()) {
    %>
    <tr>
    <%--Form to display names that are found with the search and allow the user to select
    a record to edit --%>
    <form name="form" action="editentry.jsp" target="rightframe" method=GET>
        <td><input type="text" name="idForm" readonly="readonly" size="4" value="<%=result.getString("ID")%>"></td>
        <td><input type="text" name="nameForm" readonly="readonly" value="<%=result.getString("NAME")%>"></td>
        <td><input type="text" name="phoneForm" readonly="readonly" value="<%=result.getString("PHONE")%>"></td>
        <input type="Submit" value="Edit">
    </form>
    </tr>
    <br>
    <% 
        } //End of loop//
        //Closes connection//
        statement.close();
        connection.close();
    %>
</body>
</html>
