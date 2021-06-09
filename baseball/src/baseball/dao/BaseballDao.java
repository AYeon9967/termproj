package baseball.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import baseball.vo.Player;

public class BaseballDao {
	
	private static BaseballDao dao = new BaseballDao();
	private BaseballDao() {}

	public static BaseballDao getInstance() {
		return dao;
	}
	
	public Connection connect() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/baseball?characterEncoding-UTF-8&serverTimezone=UTC";
		String id = "root";
		String pwd = "hello1248";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pwd);
		} catch(Exception e) {
			System.out.print("MDAO: connect " + e);
		}
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(Exception e) {
				System.out.print("Pstmt close error" + e);
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(Exception e) {
				System.out.print("Conn close error" + e);
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch(Exception e) {
				System.out.print("Rs close error" + e);
			}
		}
	}

	public void join(Player player) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("insert into player values(?, ?, ?, ?, ?);");
			pstmt.setString(1, player.getId());
			pstmt.setString(2, player.getPwd());
			pstmt.setString(3, player.getName());
			pstmt.setString(4, player.getEmail());
			pstmt.setString(5, player.getFavorite());
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.print("Join error" + e);
		} finally {
			close(conn, pstmt, null);
		}
		
	}

	public boolean login(String id, String pwd) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from player where id=? and pwd=?;");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			} else {
				result = false;
			}
		} catch(Exception e) {
			System.out.print("Login error " + e);
		} finally {
			close(conn, pstmt, rs);
		}	
		
		return result;
	}

	public boolean overlap(String id) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from player where id=?;");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			} else {
				result = false;
			}
		} catch(Exception e) {
			System.out.print("Overlap error " + e);
		} finally {
			close(conn, pstmt, rs);
		}	
		
		return result;
	}

}
