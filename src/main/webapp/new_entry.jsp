<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add New Entry</title>
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
		String email;
		HttpSession session;
	%>
	<%
		email = String.valueOf(session.getAttribute("user"));
	%>
	<nav>
      	<strong>Expense Tracker System</strong>
        <a href="home.jsp"><i class="zmdi zmdi-info"></i>Home</a>
        <a href="update.jsp"><i class="zmdi zmdi-present-to-all"></i>Update/Delete</a>
        <a class="user-name" href="#"><% out.print(email); %></a>
        <a class="logout" href="index.jsp?action=logout"><i class="zmdi zmdi-square-right"></i>Log Out</a>
    </nav>
    <div class="container">
    	<h2>Add New Entry</h2>
        <form action="new_entry.jsp" method="post">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" placeholder="Enter expense title here" required>
            </div>
            <div class="form-group">
                <label for="desc">Description:</label>
                <textarea id="desc" name="desc" placeholder="Type expense description here" required></textarea>
            </div>
            <div class="form-group">
                <label for="desc">Date:</label>
                <input type="date" id="date" name="date" placeholder="Select date" required>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" placeholder="Enter amount here" required step="0.1" min="0">
            </div>
            <button type="submit" class="next">Add</button>
            <button type="reset" class="next">Clear</button>
        </form>
    </div>
    <%!
		String title, desc, date, amount, JDBC_DRIVER , DB_URL, USER, PASS;
	%>
    <%
		title = request.getParameter("title");
    	desc = request.getParameter("desc");
		date = request.getParameter("date");
		amount = request.getParameter("amount");
		if(title != null && desc != null && date != null && amount != null){
			try {	

				JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
				DB_URL = "jdbc:mysql://localhost:3306/expense_tracker";

				USER = "root";
				PASS = "";

				Class.forName(JDBC_DRIVER);
				Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
				PreparedStatement st = con.prepareStatement("insert into expenses values(?,?,?,?,?)");
				st.setString(1,email);
				st.setString(2,title);
				st.setString(3,desc);
				st.setString(4,date);
				st.setString(5,amount);
				st.execute();
				out.println("<h2>Data inserted successfully</h2>");
			}
			catch(Exception ex) {
				out.println("<h2>Some error occured</h2>");
			}
		}
		
	%>
</body>
</html>