package chap08;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class InstructorDAO {
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	
	/**
	 * 생성자 생성과 동시에 연결
	 */
	public InstructorDAO() {
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

	public int insertJdbcTest(InstructorDO testDO) {
		int rowCount = 0;
		
		sql = "insert into jdbc_test values(?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, testDO.getName());
			pstmt.setString(2, testDO.getEmail());
			
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

	public ArrayList<InstructorDO> selectAll() {
		ArrayList<InstructorDO> list = new ArrayList<>();
		InstructorDO testDO = null;
		
		this.sql = "select * from jdbc_test";
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				testDO =new InstructorDO();
				testDO.setName(rs.getString("name"));
				testDO.setEmail(rs.getString("email"));
				
				list.add(testDO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt.isClosed())
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
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
