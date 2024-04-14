<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
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
		<h2>Expense Tracker - Log In</h2>
        <form action="#">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email id" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit">Login</button>
            <div class="link-container">
                <a href="reset_password.jsp">Forgot password?</a>
                <span>or</span>
                <a href="register.jsp">Create an account</a>
            </div>
        </form>
    </div>
    <%!
		String email, password, JDBC_DRIVER , DB_URL, USER, PASS, dbPass;
		Statement st;
		HttpSession session;
	%>
    <%
		email = request.getParameter("email");
		password = request.getParameter("password");
		if(email != null && password != null){
			try {	

				JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
				DB_URL = "jdbc:mysql://localhost:3306/expense_tracker";

				USER = "root";
				PASS = "";

				Class.forName(JDBC_DRIVER);
				Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
				st = con.createStatement();
				String sql = "select password from user where email='"+email+"'";
				ResultSet rs = st.executeQuery(sql);
				rs.next();
				dbPass = rs.getString("password");
				if(password.equals(dbPass)){
					response.sendRedirect("home.jsp");
					session = request.getSession(true);
					session.setAttribute("user", email);
				}
				else{
					out.println("<h2>Invalid Username or Password</h2>");
				}
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
	
		if(request.getParameter("action") != null){
			out.println("<h2>Logged Out</h2>");
			session.removeAttribute("user");
			session.invalidate();
		}

	%>
</body>
</html>
