package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class StudentDAO {
	ResultSet rs;
	Statement stmt;
	Connection conn;
	String sql;
	PreparedStatement pstmt;
	
	public StudentDAO(){
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
	
	public void closeConnection() {
		try {
			if(!this.conn.isClosed()) {
				this.conn.close();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 확인결과 문제 없었음!
	 * @param student
	 * @return
	 */
	public int createStudent(StudentDO student) {
		int rowCount = 0;
		this.sql = "insert into student (id, name, gender)"
				+ " values(?, ?, ?)";
		System.out.println("Gender: " + student.getGender());
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setString(1, student.getId());
			pstmt.setString(2, student.getName());
			pstmt.setString(3, student.getGender());
			
			
			rowCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(!pstmt.isClosed())
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return rowCount;
	}
	
	public int createScore(StudentDO student, ScoreDO score) {
		int rowCount = 0;
		this.sql = "insert into score (id, s_id, korean, math, english, science)"
				+ " values(score_seq.nextval, ?, ?, ?, ?, ?)";
		
		System.out.println(student.getId());
		System.out.println(score.getKorean());
		System.out.println(score.getMath());
		System.out.println(score.getEnglish());
		System.out.println(score.getScience());
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setString(1, student.getId());
			pstmt.setDouble(2, score.getKorean());
			pstmt.setDouble(3, score.getMath());
			pstmt.setDouble(4, score.getEnglish());
			pstmt.setDouble(5, score.getScience());
			
			rowCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(!pstmt.isClosed())
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return rowCount;
	}

	public ArrayList<StudentDO> getStudentAll(){
		ArrayList<StudentDO> list = new ArrayList<StudentDO>();
		StudentDO student = null;
		this.sql = "select * from student order by id";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(this.sql);
			
			while(rs.next()) {
				student = new StudentDO();
				
				student.setId(rs.getString("id"));
				student.setName(rs.getString("name"));
				student.setGender(rs.getString("gender"));
				student.setCreateDate(rs.getString("createDate"));
				if(rs.getString("createDate").equals(rs.getString("modifiedDate"))) {
					student.setModifiedDate("-");
				}else {
					student.setModifiedDate(rs.getString("modifiedDate"));
				}
				list.add(student);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(!stmt.isClosed())
					stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public ArrayList<ScoreDO> getScoreAll(){
		ArrayList<ScoreDO> list = new ArrayList<ScoreDO>();
		ScoreDO score = null;
		this.sql = "select korean, math, english, science from score order by s_id";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(this.sql);
			
			while(rs.next()) {
				score = new ScoreDO();
				
				score.setKorean(rs.getDouble("korean"));
				score.setMath(rs.getDouble("math"));
				score.setEnglish(rs.getDouble("english"));
				score.setScience(rs.getDouble("science"));
				
				list.add(score);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(!stmt.isClosed())
					stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public StudentDO getStudent(String id) {
		StudentDO student = new StudentDO();
		student.setId("-1");
		this.sql = "select * from student where id = ?";
		
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setString(1, id);
			
			this.rs = pstmt.executeQuery();
			
			if(rs.next()) {
				student.setId(rs.getString("id"));
				student.setName(rs.getString("name"));
				student.setGender(rs.getString("gender"));
				student.setCreateDate(rs.getString("createdate"));
				if(rs.getString("createDate").equals(rs.getString("modifiedDate"))) {
					student.setModifiedDate("-");
				}else {
					student.setModifiedDate(rs.getString("modifiedDate"));
				}
			}
				
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(!this.pstmt.isClosed())
					this.pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return student;
	}
	
	public ScoreDO getScore(String s_id) {
		ScoreDO score = new ScoreDO();
		score.setKorean(-1);
		this.sql = "select * from score where s_id = ?";
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setString(1, s_id);
			
			this.rs = pstmt.executeQuery();
			
			if(rs.next()) {
				score.setKorean(rs.getDouble("korean"));
				score.setMath(rs.getDouble("math"));
				score.setEnglish(rs.getDouble("english"));
				score.setScience(rs.getDouble("science"));
			}
				
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(!this.pstmt.isClosed())
					this.pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return score;
	}

	public int deleteScore(String s_id) {
		System.out.println(s_id);
		int rowCount = 0;
		this.sql = "delete from score where s_id = ? ";
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setString(1, s_id);
			
			rowCount = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(!this.pstmt.isClosed())
					this.pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return rowCount;
	}
	
	public int deleteStudent(String id) {
		int rowCount = 0;
		this.sql = "delete from student where id = ?";
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setString(1, id);
			
			rowCount = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(!this.pstmt.isClosed())
					this.pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return rowCount;
	}
	
	public int updateStudent(StudentDO student) {
		System.out.println(student.getId());
		int rowCount = 0;
		this.sql = "update student "
				+ " set name = ?, gender = ?, modifiedDate = sysdate "
				+ "where id = ?";
		
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getGender());
			pstmt.setString(3, student.getId());
			
			
			rowCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(!pstmt.isClosed())
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return rowCount;
	}
	public int updateScore(StudentDO student, ScoreDO score) {
		int rowCount = 0;
		this.sql = "update score "
				+ "set korean = ?, math = ?, english = ?, science = ? "
				+ "where s_id = ?";
		
		try {
			pstmt = conn.prepareStatement(this.sql);
			pstmt.setDouble(1, score.getKorean());
			pstmt.setDouble(2, score.getMath());
			pstmt.setDouble(3, score.getEnglish());
			pstmt.setDouble(4, score.getScience());
			pstmt.setString(5, student.getId());
			
			rowCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(!pstmt.isClosed())
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return rowCount;
	}
}
