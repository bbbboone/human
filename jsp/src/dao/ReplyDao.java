package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;
import vo.Board;
import vo.Criteria;
import vo.Reply;

public class ReplyDao {

	public void insert(Reply reply) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO TBL_REPLY(RNO, CONTENT, ID, BNO) VALUES (SEQ_REPLY.NEXTVAL, ?, ?, ?)");
			int idx = 1;
			pstmt.setString(idx++, reply.getContent());
			pstmt.setString(idx++, reply.getId());
			pstmt.setLong(idx++, reply.getBno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Reply> list(Long bno) {
		Connection conn = DBConn.getConnection();
		List<Reply> list = new ArrayList<>();
		try {
			String sql = "SELECT RNO, CONTENT, TO_CHAR(REGDATE, 'YY/MM/DD') REGDATE, ID \r\n" + 
					"FROM TBL_REPLY WHERE RNO > 0 AND BNO = ? ORDER BY RNO";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, bno);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int idx = 1;
				Long rno = rs.getLong(idx++);
				String content = rs.getString(idx++);
				String regDate = rs.getString(idx++);
				String id = rs.getString(idx++);
				
				Reply reply= new Reply(rno, content, regDate, id, bno);
				list.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Reply select(Long rno) { 
		Connection conn = DBConn.getConnection();
		Reply reply = null;
		try {
			String sql = "SELECT RNO, CONTENT, TO_CHAR(REGDATE, 'YY/MM/DD') REGDATE, ID, BNO FROM TBL_REPLY WHERE RNO = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, rno);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int idx = 1;
				rno = rs.getLong(idx++);
				String content = rs.getString(idx++);
				String regDate = rs.getString(idx++);
				String id = rs.getString(idx++);
				Long bno = rs.getLong(idx++);
				
				reply= new Reply(rno, content, regDate, id, bno);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reply;
	}
	
	public void remove(Long rno) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"DELETE TBL_REPLY WHERE RNO = ?");
			pstmt.setLong(1, rno); 
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void delete(Long bno) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"DELETE TBL_REPLY WHERE BNO = ?");
			pstmt.setLong(1, bno); 
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void withdraw(String id) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE TBL_REPLY SET ID=NULL WHERE ID = ?");
			pstmt.setString(1, id); 
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Reply reply) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE TBL_REPLY SET CONTENT = ? WHERE RNO = ?");
			int idx = 1;
			pstmt.setString(idx++, reply.getContent()); 
			pstmt.setLong(idx++, reply.getRno()); 
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String findIdBy(Long rno) {
		Connection conn = DBConn.getConnection();
		String id = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"SELECT ID FROM TBL_REPLY WHERE RNO = ?");
			pstmt.setLong(1, rno);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
//	public static void main(String[] args) {
//		ReplyDao dao = new ReplyDao();
//		dao.list(2388296L).forEach(System.out::println);
//	}



}
