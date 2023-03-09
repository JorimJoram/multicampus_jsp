<%@ page contentType="text/html; charset=UTF-8"
		import="java.sql.*, javax.naming.*, javax.sql.*"%>

<%
	DataSource ds = null;
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	String sql = null;
	PreparedStatement pstmt = null;
	String list = "";
	
	try {
		InitialContext context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/oracleXE");
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	String name = "";
	String email = "";
	int rowCount = 0;
	
	if(request.getMethod().equals("POST")){
		sql = "insert into jdbc_test values(?,?)";
		name = request.getParameter("username");
		email = request.getParameter("email");
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rowCount = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt.isClosed()){
					pstmt.close();
				}
				if(!conn.isClosed()){
					conn.close(); //연결 반납
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	sql = "select * from jdbc_test";
	
	try{
		conn = ds.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			list +=  "<li>" + rs.getString("username") + " | " + rs.getString("email") + "</li>";
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(!stmt.isClosed())
				stmt.close();
			if(!conn.isClosed())
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
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