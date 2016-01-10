<!--
AUTHOR: MADISON CHASE
PROJECT: PROJECT 1 - ROLODEX
FILE: search.html
-->

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body bgcolor='white'>
    <center>
        Record Search by Name
        <BR>
        <%-- Form to conduct a search based on the name --%>
        <form name="form" action="search2.jsp" target="rightframe"   method=GET>
            <input name=nameSearch maxlength=25 size=20>
            <BR>
            <BR>
            <input type="Submit" value="Search">
        </form>    
        <hr>
        <BR>
        <%--Form to add a new entry --%>
        <form name="form" action="newentry.jsp" target="rightframe" method=GET>
            Input New Record
            <BR>
            <BR>
            <input type="Submit" value="Submit">
        </form>
        <hr>
        <%-- Beginning of jsp script for the number of entries in the database --%>
        <%
        //Class for the driver//
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        //Creates a connection to the database called rolodex//
        Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/rolodex");   
        Statement statement = connection.createStatement();
        //SQL statement to get the number of entries there are in the database.//
        ResultSet result = statement.executeQuery("SELECT COUNT(*) AS rowcount FROM rolodex");
        result.next();
        int count = result.getInt("rowcount");
        %>
        <br>
        Number of Entries
        <BR>
        <BR>
        <%-- Form to display the number of entries in the database. --%>
        <form>
            <input id=rows maxlength="3" size="2" readonly="readonly" value=<%=count%>>
        </form>
        <% 
        //Closes the connection//
        statement.close();
        connection.close();
        %>
        <BR>
        <BR>
        <%-- Allows the user to refresh the page to update the count --%>
        <form name="refresh" action="search.jsp" target="leftframe" method="GET">
            <input type="Submit" value="Refresh">
        </form>
    </center>   

</body>
</html>
