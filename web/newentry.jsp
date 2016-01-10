<!--
AUTHOR: MADISON CHASE
PROJECT: PROJECT 1 - ROLODEX
FILE: newentry.jsp
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
<%--Form is used to collect information for new record in the database --%>
<form name="form" action=newentry2.jsp target="rightframe"  method=GET> 
    Transaction ID
    <BR>
    <input name="formID" size="3" maxlength="3">
    <BR>
    <BR>
    Name
    <BR>
    <input name=formName size="25" maxlength="25">
    <BR>
    <BR>
    Phone Number  
    <BR>
    <input name=formPhone size="10" maxlength="10">
    <BR>
    <BR>
    <input type ="Submit" value="Submit">
</form> 
</body>

</html>