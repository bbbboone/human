package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;
import vo.Member;

public class MemberDao {
	public List<Member> getMembers() {
		// 1. Connection 취득
		// 2. 문장(Statement)생성
		// 3. Select >> 결과 집합(ResultSet) >> RS 순회
		
		Connection conn = DBConn.getConnection();
		List<Member> list = new ArrayList<Member>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE WITHDRAW = 1");
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String name = rs.getString("name");
				
				Member member = new Member(id, pwd, email, name);
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean login(String id, String pwd) {
		Connection conn = DBConn.getConnection();
		boolean success = false;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER "
					+ "WHERE ID='" + id + "' AND PWD = '" + pwd + "' AND WITHDRAW = 1");
			success = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}
	
	public void join(Member member) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO TBL_MEMBER VALUES (?, ?, ?, ?, 1)");
			int idx = 1;
			pstmt.setString(idx++, member.getId()); // 1
			pstmt.setString(idx++, member.getPwd()); // 2
			pstmt.setString(idx++, member.getEmail()); // 3
			pstmt.setString(idx++, member.getName()); // 4
			
			// select : executeQuery, insert update delete : executeUpdate
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Member findBy(String id) {
		Connection conn = DBConn.getConnection();
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE ID=?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int idx = 1;
				member = new Member(
						rs.getString(idx++), 
						rs.getString(idx++), 
						rs.getString(idx++), 
						rs.getString(idx++)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public Member findByEmail(String email) {
		Connection conn = DBConn.getConnection();
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE EMAIL=? AND WITHDRAW = 1");
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int idx = 1;
				member = new Member(
						rs.getString(idx++), 
						rs.getString(idx++), 
						rs.getString(idx++), 
						rs.getString(idx++)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

	public Member findByEmail(String email, String name) {
		Connection conn = DBConn.getConnection();
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE EMAIL=? AND NAME = ? AND WITHDRAW = 1");
			int idx = 1;
			pstmt.setString(idx++, email);
			pstmt.setString(idx++, name);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				idx = 1;
				member = new Member(
						rs.getString(idx++), 
						rs.getString(idx++), 
						rs.getString(idx++), 
						rs.getString(idx++)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public Member findPwdByEmail(String email, String id) {
		Connection conn = DBConn.getConnection();
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE EMAIL=? AND ID = ? AND WITHDRAW = 1");
			int idx = 1;
			pstmt.setString(idx++, email);
			pstmt.setString(idx++, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				idx = 1;
				member = new Member(
						rs.getString(idx++), 
						rs.getString(idx++), 
						rs.getString(idx++),
						rs.getString(idx++)
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public Integer findBy(String email, String id) {
		Connection conn = DBConn.getConnection();
		Integer result = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"WITH BASE AS (\r\n" + 
					"    SELECT \r\n" + 
					"        (\r\n" + 
					"            SELECT 1 \r\n" + 
					"            FROM TBL_MEMBER\r\n" + 
					"            WHERE EMAIL = ?\r\n" + 
					"        ) EMAIL, \r\n" + 
					"        (\r\n" + 
					"            SELECT 1\r\n" + 
					"            FROM TBL_MEMBER\r\n" + 
					"            WHERE ID = ?\r\n" + 
					"        ) ID\r\n" + 
					"    FROM DUAL\r\n" + 
					")\r\n" + 
					"SELECT \r\n" + 
					"    CASE \r\n" + 
					"        WHEN EMAIL IS NULL AND ID IS NULL THEN 0 \r\n" + 
					"        WHEN EMAIL IS NULL THEN 1\r\n" + 
					"        WHEN ID IS NULL THEN 2\r\n" + 
					"        ELSE 3\r\n" + 
					"    END RESULT\r\n" + 
					"FROM BASE"
					);
			int idx = 1;
			pstmt.setString(idx++, email);
			pstmt.setString(idx++, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void update(Member member) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE TBL_MEMBER SET PWD = ?, EMAIL = ?, NAME = ? WHERE ID = ?");
			int idx = 1;
			pstmt.setString(idx++, member.getPwd());
			pstmt.setString(idx++, member.getEmail());
			pstmt.setString(idx++, member.getName());
			pstmt.setString(idx++, member.getId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updatePwd(String id, String pwd) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE TBL_MEMBER SET PWD = ? WHERE ID = ? ");
			int idx = 1;
			pstmt.setString(idx++, pwd);
			pstmt.setString(idx++, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void withdraw(String id) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE TBL_MEMBER SET WITHDRAW = 0 WHERE ID = ?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
