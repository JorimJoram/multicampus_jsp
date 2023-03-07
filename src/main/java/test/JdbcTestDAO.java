package test;

import java.sql.*;
import java.util.ArrayList;


public class JdbcTestDAO {
	ResultSet rs;
	Statement stmt;
	Connection conn;
	String sql;
	PreparedStatement pstmt;
	
	public JdbcTestDAO(){
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		try {
			Class.forName(jdbc_driver);
			this.conn = DriverManager.getConnection(jdbc_url, user, pwd);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<JdbcTestDO> selectAll(){
		ArrayList<JdbcTestDO> list = new ArrayList<>();
		JdbcTestDO item = null;
		this.sql = "select * from jdbc_test";
		
		try {
			this.stmt = conn.createStatement();
			this.rs = this.stmt.executeQuery(this.sql);
			
			while(this.rs.next()) {
				item = new JdbcTestDO();
				item.setUsername(rs.getString("username"));
				item.setEmail(rs.getString("email"));
				
				list.add(item);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	public int insertJdbcTest(JdbcTestDO testDO) {
		int rowCount = 0;
		this.sql = "insert into jdbc_test values(?, ?)";
		
		try {
			this.pstmt = this.conn.prepareStatement(this.sql);
			this.pstmt.setString(1, testDO.getUsername());
			this.pstmt.setString(2, testDO.getEmail());
			
			rowCount= this.pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rowCount;
	}
	public void closeConnection() {
		try {
			if(!this.conn.isClosed()) {
				this.conn.close();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
