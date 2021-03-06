<%-- 
    Document   : loginprocess
    Created on : 01-Apr-2017
    Author     : Abhishek
--%>
<%
    java.sql.Connection conn;                 // Connection: A connection with a specific database.
    java.sql.ResultSet rs;                   // ResultSet: A table of data representing a database result set, which is usually generated by executing a statement that queries the database. 
    java.sql.Statement st;                   // Statement: The object used for executing a static SQL statement and returning the results it produces.
    // mysql database to work with your project. Go to,
    // Your project -> right click -> properties -> Libraries -> Compiler tab -> Add library -> select "MySQL JDBC Driver" library -> Ok
    Class.forName("com.mysql.jdbc.Driver"); //to connect mysql database
    conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/demo", "root", "");  //connection with database.. demo: db name, username:root, password: " "
    st = conn.createStatement();
    
    //get parameter value by using the 'name' of the field
    String username = request.getParameter("username");     
    String password = request.getParameter("password");

    String qr = "SELECT username FROM users WHERE username = '"+username+"' and password = '"+password+"'";    //query to select if the username already exists or not
    rs = st.executeQuery(qr);
    if(rs.next())                       
    {
        // if username or password is correct
        session.setAttribute("uname", username);          //session created... name: 'uname' and value: 'username' of the user    
        response.sendRedirect("home.jsp");
    }
    else
    {
        // if username or password is incorrect
        // passing variable "c" with URL
        // lets say "c" is for "username/password is incorrect"
        response.sendRedirect("index.jsp?c");
    }
%>