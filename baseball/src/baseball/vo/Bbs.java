package baseball.vo;

public class Bbs {
	private int bbsid;
	private String bbstitle;
	private String bbscontent;
	private String bbsdate;
	private String bbscategory;
	private String id;
	private String team;
		
	@Override
	public String toString() {
		return "Bbs [bbsid=" + bbsid + ", bbstitle=" + bbstitle + ", bbscontent=" + bbscontent + ", bbsdate=" + bbsdate
				+ ", bbscategory=" + bbscategory + ", id=" + id + ", team=" + team + ", bbsimg=" + bbsimg + "]";
	}
	
	public int getBbsid() {
		return bbsid;
	}
	public void setBbsid(int bbsid) {
		this.bbsid = bbsid;
	}
	public String getBbstitle() {
		return bbstitle;
	}
	public void setBbstitle(String bbstitle) {
		this.bbstitle = bbstitle;
	}
	public String getBbscontent() {
		return bbscontent;
	}
	public void setBbscontent(String bbscontent) {
		this.bbscontent = bbscontent;
	}
	public String getBbsdate() {
		return bbsdate;
	}
	public void setBbsdate(String bbsdate) {
		this.bbsdate = bbsdate;
	}
	public String getBbscategory() {
		return bbscategory;
	}
	public void setBbscategory(String bbscategory) {
		this.bbscategory = bbscategory;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getBbsimg() {
		return bbsimg;
	}
	public void setBbsimg(String bbsimg) {
		this.bbsimg = bbsimg;
	}
	private String bbsimg;
}
