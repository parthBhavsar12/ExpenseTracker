<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="body.css">
    <link rel="stylesheet" href="styles.css">
    <style>
    	h2{
    		color: blue;
    	}
    </style>
</head>
<body>
    <div class="container">
    	<h2>Expense Tracker - Register</h2>
        <form action="register.jsp" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit">Register</button>
            <div class="link-container">
                <a href="index.jsp">Log In</a>
            </div>
        </form>
    </div>
    <%!
		String name, email, password, JDBC_DRIVER , DB_URL, USER, PASS;
	%>
    <%
		name = request.getParameter("name");
		email = request.getParameter("email");
		password = request.getParameter("password");
		if(name != null && email != null && password != null){
			try {	

				JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
				DB_URL = "jdbc:mysql://localhost:3306/expense_tracker";

				USER = "root";
				PASS = "";

				Class.forName(JDBC_DRIVER);
				Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
				PreparedStatement st = con.prepareStatement("insert into user values(?,?,0,?)");
				st.setString(1,name);
				st.setString(2,email);
				st.setString(3,password);
				st.execute();
				out.println("<h2>Registered successfully</h2>");
			}
			catch(Exception ex) {
				if(ex.getMessage().startsWith("Duplicate entry")){
					out.println("<h2>User already Exists</h2>");
				}
				else{
					out.println("<h2>Some error occured</h2>");
				}
			}
		}
		
	%>
</body>
</html>