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

    <link rel="stylesheet" href="http://localhost:8181/simple-web-app/bootstrap/css/bootstrap.css">
</head>

<body  style="background-color: rgb(243, 106, 26)";
<header>
  <div class="p-1 text-dark text-center">
    <h1 class="display-3">Employee Reimbursement System</h1>
  </div>
</header>
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
    <span>Hello <%=user.getName()%> ! </span>


</div>
<hr/>
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
String sql ="SELECT * FROM reimbursements";

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
<hr/>
<h2 align="center"><font><strong>Add/Approve/Deny Requests </font></h2>

<form align="center" name="f1" method="get" action"success.jsp" <form>

Reimbursement Id: <input type="text" name="reimburseid"/>


       <select name="clr">
           <option>DENIED</option>
           <option>APPROVED</option>

       </select>
<input type="submit" value="Submit"/>


</form>

</body>
</html>