package chap08;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcBeans {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	private String list;
	private String name;
	private String email;
	
	/**
	 * 만들어질 때 바로 연결시키기
	 */
	public JdbcBeans() {
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
		readList();
	}
	/**
	 * 연결종료
	 */
	public void closeConnection() {
		try {
		if(!this.conn.isClosed()) {
			this.conn.close();
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
	}

	public void readList() {
		this.sql = "select * from jdbc_test";
		
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				this.list +=  "<li>" + rs.getString("name") + " | " + rs.getString("email") + "</li>";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getList() {
		return this.list;
	}
	
	public int writeList() {
		int rowCount = 0;		
		String name = "";
		String email = "";
		
		sql = "insert into jdbc_test values(?,?)";
		
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
			return rowCount;
	}		
}
