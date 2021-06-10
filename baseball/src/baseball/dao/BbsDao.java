package baseball.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import baseball.vo.Bbs;

public class BbsDao {

	private static BbsDao dao = new BbsDao();
	private BbsDao() {}

	public static BbsDao getInstance() {
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
	
	public int write(Bbs bDto) {
		Connection conn = connect();
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into bbs(bbstitle, bbscontent, bbscategory, team, id, bbsimg) values(?, ?, ?, ?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, bDto.getBbstitle());
			pstmt.setString(2, bDto.getBbscontent());
			pstmt.setString(3, bDto.getBbscategory());
			pstmt.setString(4, bDto.getTeam());
			pstmt.setString(5, bDto.getId());
			pstmt.setString(6, bDto.getBbsimg());
			result = pstmt.executeUpdate();
		} catch (SQLException e) { System.out.print("write error " + e);
		} finally { this.close(conn, pstmt, null);
		}
		return result;
	}
	
	public List<Bbs> selectList(String team){
		Connection conn = connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Bbs> list = new ArrayList<>();
		
		try {
			String sql ="select * from bbs where team=? order by bbsid desc;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, team);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbsDto = new Bbs();
				bbsDto.setBbsid(rs.getInt("bbsid"));
				bbsDto.setBbstitle(rs.getString("bbstitle"));
				bbsDto.setBbscontent(rs.getString("bbscontent"));
				bbsDto.setBbsdate(rs.getString("bbsdate"));
				bbsDto.setBbscategory(rs.getString("bbscategory"));
				bbsDto.setId(rs.getString("id"));
				bbsDto.setBbsimg(rs.getString("bbsimg"));
				list.add(bbsDto);
			}
			
		} catch (Exception e) { System.out.print("sList error " + e);
		} finally { close(conn, pstmt, rs);
		}
		return list;
	}

	public Bbs selectById(String bbsId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Bbs bbsDto = new Bbs();
		
		String sql = "select * from bbs where bbsid = ?";
		try {
			conn = connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bbsDto.setBbsid(rs.getInt("bbsid"));
				bbsDto.setBbstitle(rs.getString("bbstitle"));
				bbsDto.setBbscontent(rs.getString("bbscontent"));
				bbsDto.setBbsdate(rs.getString("bbsdate"));
				bbsDto.setBbscategory(rs.getString("bbscategory"));
				bbsDto.setId(rs.getString("id"));
				bbsDto.setTeam(rs.getString("team"));
				bbsDto.setBbsimg(rs.getString("bbsimg"));
			}
			
		} catch (SQLException e) { System.out.print("sById error " + e);
		} finally { close(conn, pstmt, rs);
		}
		return bbsDto;
	}

	public void bbsdelete(String bbsId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("delete from bbs where bbsid=?;");
			pstmt.setString(1, bbsId);
			pstmt.executeUpdate();
		} catch(Exception e) { System.out.print("bDelete error " + e);
		} finally { close(conn, pstmt, null);
		}
	}

	public boolean deleteusercheck(String bbsId, String sessionID) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = connect();
			String sql = "select id from bbs where bbsid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				if (rs.getString("id").equals(sessionID) && sessionID != null) {
					result = true;
				} else {
					result = false;
				}
			}
		} catch (SQLException e) { System.out.print("bDeleteUserCheck error " + e);
		} finally { close(conn, pstmt, rs); }
		
		return result;
	}
	
}
