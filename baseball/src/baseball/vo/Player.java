package baseball.vo;

public class Player {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String favorite;
	
	public Player() {}
	
	public Player(String id, String pwd, String name, String email, String favorite) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.favorite = favorite;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}
	public void setEmali(String email) {
		this.email = email;
	}

	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	
	
}
