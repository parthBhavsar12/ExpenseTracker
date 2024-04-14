<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Past Expenses</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="nav.css">
</head>
<body>

	<%!
		String email, JDBC_DRIVER , DB_URL, USER, PASS, limit;
		Statement st;
		HttpSession session;
		Connection con;
	%>
	<%
		email = String.valueOf(session.getAttribute("user"));
	%>
	<nav>
      	<strong>Expense Tracker System</strong>      	
        <a href="home.jsp"><i class="zmdi zmdi-present-to-all"></i>Home</a>
        <a href="new_entry.jsp"><i class="zmdi zmdi-info"></i>Add New Entry</a>
        <a class="user-name" href="#"><% out.print(email); %></a>
        <a class="logout" href="index.jsp?action=logout"><i class="zmdi zmdi-square-right"></i>Log Out</a>
    </nav>
	<div class="container">
		<strong>Your expenses:</strong>
		<table id="expenses">
			<tr>
				<th>#</th>
				<th>Title</th>
				<th>Description</th>
				<th>Date</th>
				<th>Amount</th>
			</tr>	
			<tr>
				<td>1</td>
				<td>Abc</td>
				<td>Description</td>
				<td>01-01-2000</td>
				<td>250</td>
			</tr>
			<tr>
				<td>2</td>
				<td>pqr</td>
				<td>Description</td>
				<td>01-01-2000</td>
				<td>2800</td>
			</tr>
			<tr>
				<td>3</td>
				<td>xyz</td>
				<td>Description</td>
				<td>01-01-2000</td>
				<td>1000</td>
			</tr>
			<tr>
				<td colspan="4">Total</td>
				<td>1000</td>
			</tr>
		</table>
    </div>
</body>
</html>