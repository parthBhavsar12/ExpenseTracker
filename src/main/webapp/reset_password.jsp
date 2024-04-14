<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
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
        <h2>Expense Tracker - Reset Password</h2>
        <form action="reset_password.jsp" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email id" required>
            </div>
            <div class="form-group">
                <label for="password1">New Password:</label>
                <input type="password" id="password1" name="password1" placeholder="Enter your new password" required>
            </div>
            <div class="form-group">
                <label for="password2">Confirm Password:</label>
                <input type="password" id="password2" name="password2" placeholder="Confirm your password" required>
            </div>
            <button type="submit">Reset Password</button>
            <div class="link-container">
                <a href="register.jsp">Create an account</a>
                <span>or</span>
                <a href="index.jsp">Log In</a>
            </div>
        </form>
    </div>
    <%!
		String email, password, con_password, JDBC_DRIVER , DB_URL, USER, PASS;
	%>
    <%
		email = request.getParameter("email");
		password = request.getParameter("password1");
		con_password = request.getParameter("password2");
		if(email != null && password != null && con_password != null){
			if(password.equals(con_password)){
				try {	

					JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
					DB_URL = "jdbc:mysql://localhost:3306/expense_tracker";

					USER = "root";
					PASS = "";

					Class.forName(JDBC_DRIVER);
					Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
					PreparedStatement st = con.prepareStatement("UPDATE `user` SET `password`=? WHERE email='"+email+"'");
					st.setString(1,password);
					st.execute();
					out.println("<h2>Password reset successfully</h2>");
				}
				catch(Exception ex) {
					out.println("<h2>Some error occured</h2>");
				}
			}
			else{
				out.println("<h2>Password and Confirm Password do not match</h2>");
			}
			
		}
		
	%>
</body>
</html>