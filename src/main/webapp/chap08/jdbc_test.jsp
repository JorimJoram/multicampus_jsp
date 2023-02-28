<%@ page contentType="text/html; charset=UTF-8"
		import="java.sql.*"%>

<%
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "scott";
	String pwd = "tiger";
	ResultSet rs = null;
	Statement stmt = null;
	Connection conn = null;
	String sql = null;
	PreparedStatement pstmt = null;
	String list = "";
	
	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, user, pwd);
	}catch (SQLException e) {
		e.printStackTrace();
	}
	
	String name = "";
	String email = "";
	int rowCount = 0;
	
	if(request.getMethod().equals("POST") 
			&& !request.getParameter("username").equals("") 
			&& !request.getParameter("email").equals("")){
		sql = "insert into jdbc_test values(?,?)";
		name = request.getParameter("username");
		email = request.getParameter("email");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rowCount = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt.isClosed())
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	sql = "select * from jdbc_test";
	
	try{
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			list +=  "<li>" + rs.getString("name") + " | " + rs.getString("email") + "</li>";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jdbc_test jsp</title>
</head>

<body>

	<h1>jdbc test</h1>
	<hr>
	
	<form method="POST">
		<fieldset>
			<legend>사용자 등록</legend>
			<label for="username">name</label>
			<input type="text" name="username", id="username"/>
			<label for="email">email</label>
			<input type="email" name="email", id="email"/>
			<input type="submit" value="Regist"/>
		</fieldset>
	</form>
	<hr>
	
	<h3>Register List</h3>
	<h4>rowCount : <%= rowCount %></h4>
	<ol>
		<%= list %>
	</ol>
</body>
</html>