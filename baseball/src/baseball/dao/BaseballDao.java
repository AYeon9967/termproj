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
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baseball", "root", "hello1248");
		} catch(Exception e) {
			System.out.print("MDAO: connect " + e);
		}
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement pstmt) {
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
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch(Exception e) {
				System.out.print("Rs close error" + e);
			}
		}
		close(conn, pstmt);
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
			close(conn, pstmt);
		}
		
	}

}
