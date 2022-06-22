<%@ page import="com.example.entity.User" %>
<%@ page import="com.example.entity.Role" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Reimbursement Homepage</title>
    <link rel="stylesheet" href="http://localhost:8181//bootstrap/css/bootstrap.css">
</head>

<body  style="background-color: rgb(243, 106, 26)";

<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>

<div class="display-1">Reimbursement Homepage</div>
<hr/>


<div class="d-flex justify-content-between">
    <%
        User user = (User) session.getAttribute("user");
    %>
    <span>Hello! <%=user.getName()%> </span>
    <hr/>
</div>

<%
    for (Role role : user.getRoles()) {
%>
<span>ROLE:<%=role.getRole()%></span>
<%
    }
%>

<hr/>

 <a href="logout">Logout</a>
<hr/>
<%
String id = request.getParameter("userId");
String driverName = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://localhost:5432/";
String dbName = "Expense";
String userId = "postgres";
String password = "revrepo";


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>All Reimbursements</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
</tr>
<tr bgcolor="#A52A2A">
<td><b>Reimburse Id</b></td>
<td><b>User Id</b></td>
<td><b>Reimbursement Amount</b></td>
<td><b>User Job</b></td>
<td><b>Reimbursement Status</b></td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select* from reimbursements";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("reimburseid") %></td>
<td><%=resultSet.getString("user_id") %></td>
<td><%=resultSet.getString("reimbursementamount") %></td>
<td><%=resultSet.getString("user_job") %></td>
<td><%=resultSet.getString("reimburse_status") %></td>

</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>



</br>
<h2 align="center"><font>Create New Request</font></h2>
<br>

</br>


<form align="center" name="f1" method="get" action"success.jsp" <form>
User ID: <input type="text" name="user_id"/>
Reimbursement Id: <input type="text" name="reimburseid"/>
Reimbursement Amount: <input type="text" name="reimbursementamount"/>
Company Role: <input type="text" name="user_job"/>
<input type="submit" value="Submit"/>

</form>

</body>
</html>
