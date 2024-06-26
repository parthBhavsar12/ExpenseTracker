<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Entry</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="nav.css">
</head>
<body>
	<nav>
      	<strong>Expense Tracker System</strong>
        <a href="home.html"><i class="zmdi zmdi-info"></i>Home</a>
        <a href="new_entry.html"><i class="zmdi zmdi-present-to-all"></i>Add New Entry</a>
        <a class="user-name" href="#">Hello, User</a>
        <a class="logout" href="index.html"><i class="zmdi zmdi-square-right"></i>Log Out</a>
    </nav>
    <div class="container">
    	<h2>Update Entry</h2>
        <form action="#">
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
            <button type="submit" class="next">Update</button>
            <button type="reset" class="next">Clear</button>
        </form>
    </div>
</body>
</html>