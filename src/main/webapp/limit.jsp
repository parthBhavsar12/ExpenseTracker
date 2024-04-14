<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Budget Limit</title>
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
			out.println("<h2>Some error occured</h2>");
		}
		
	%>
	<nav>
      	<strong>Expense Tracker System</strong>
        <a href="home.jsp"><i class="zmdi zmdi-info"></i>Home</a>
        <a href="new_entry.jsp"><i class="zmdi zmdi-present-to-all"></i>Add New Entry</a>
        <a class="user-name" href="#"><% out.print(email); %></a>
        <a class="logout" href="index.jsp?action=logout"><i class="zmdi zmdi-square-right"></i>Log Out</a>
    </nav>
    <div class="container budget">
		<span>Your monthly budget limit currently is Rs. <% out.print(limit); %>.</span>
    </div>
    <div class="container">
    	<h2>Update Budget Limit</h2>
        <form action="limit.jsp" method="post">
            <div class="form-group">
                <label for="limit">Limit:</label>
                <input type="number" id="limit" name="limit" placeholder="Enter limit amount here" required step="0.1" min="0">
            </div>
            <button type="submit" class="next">Update</button>
            <button type="reset" class="next">Clear</button>
        </form>
    </div>
    <%
		limit = request.getParameter("limit");
		if(limit != null){
			try {	

				PreparedStatement st = con.prepareStatement("UPDATE `user` SET `limit`=? WHERE email='"+email+"'");
				st.setString(1,limit);
				st.execute();
				out.println("<h2>Budget Limit Updated - Refresh or <a href='home.jsp'>Go Back Home</a></h2>");
			}
			catch(Exception ex) {
				out.println("<h2>Some error occured</h2>");
			}
		}
		
	%>
</body>
</html>