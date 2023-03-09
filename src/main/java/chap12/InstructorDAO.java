package chap12;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.*;

public class InstructorDAO {
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	private DataSource ds;
	
	/**
	 * 생성자 생성과 동시에 연결
	 */
	public InstructorDAO() {
		try {
			InitialContext context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracleXE");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int insertJdbcTest(InstructorDO testDO) {
		int rowCount = 0;
		sql = "insert into jdbc_test values(?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, testDO.getUsername());
			pstmt.setString(2, testDO.getEmail());
			
			rowCount = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(!pstmt.isClosed())
					pstmt.close();
				if(!conn.isClosed())
					conn.close();
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
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				conn = ds.getConnection();
				testDO =new InstructorDO();
				testDO.setName(rs.getString("username"));
				testDO.setEmail(rs.getString("email"));
				
				list.add(testDO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(!stmt.isClosed())
					stmt.close();
				if(!conn.isClosed())
					conn.close();
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
