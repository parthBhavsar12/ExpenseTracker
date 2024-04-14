<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home page of Expense Tracker</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="nav.css">
    <style>
    	h2{
    		color: blue;
    		text-align: center;
    	}
    </style>
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
        <a href="new_entry.jsp"><i class="zmdi zmdi-info"></i>Add New Entry</a>
        <a href="update.jsp"><i class="zmdi zmdi-present-to-all"></i>Update/Delete</a>
        <a class="user-name" href="#"><% out.print(email); %></a>
        <a class="logout" href="index.jsp?action=logout"><i class="zmdi zmdi-square-right"></i>Log Out</a>
    </nav>
    
    <%
			try {	

				JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
				DB_URL = "jdbc:mysql://localhost:3306/expense_tracker";

				USER = "root";
				PASS = "";

				Class.forName(JDBC_DRIVER);
				con = DriverManager.getConnection(DB_URL,USER,PASS);
				st = con.createStatement();
				String sql = "select `limit` from user where email='"+email+"'";
				ResultSet rs = st.executeQuery(sql);
				rs.next();
				limit = rs.getString("limit");				
			}
			catch(Exception ex) {
				out.println("<h2>Some error occured</h2>" + ex.getMessage());
			}
		
	%>
    <div class="container budget">
		<span>Your monthly budget limit is Rs. <% out.print(limit); %>.</span>
		<a id="update" href="limit.jsp">Update</a>
    </div>
    <div class="container warning">
		<span>Your remaining budget for this month is Rs. 2000</span>
    </div>
    <div class="container">
		<strong>Your expenses (this month): <a href="past_expenses.jsp">Past Expenses</a></strong>
		<table id="expenses">
			<tr>
				<th>#</th>
				<th>Title</th>
				<th>Description</th>
				<th>Date</th>
				<th>Amount</th>
			</tr>	
			
    <%
			try {	
				st = con.createStatement();
				String sql = "select * from expenses where email='"+email+"'";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>-</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("<td>" + rs.getString(3) + "</td>");
					out.println("<td>" + rs.getString(4) + "</td>");
					out.println("<td>" + rs.getString(5) + "</td>");
					out.println("</tr>");
				}				
			}
			catch(Exception ex) {
				out.println("<h2>Some error occured</h2>");
			}
		
	%>
		</table>
    </div>
  
		
    <% 
    	if(session.getAttribute("user") == null){
			response.sendRedirect("index.jsp");
		} 
	%>
</body>
</html>
