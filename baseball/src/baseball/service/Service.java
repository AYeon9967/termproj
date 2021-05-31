package baseball.service;

import baseball.dao.BaseballDao;
import baseball.vo.Player;

public class Service {
	
	private static Service service = new Service();
	private Service() {}
	
	private BaseballDao dao = BaseballDao.getInstance();
	
	public static Service getInstance() {
		return service;
	}

	public void join(Player player) {
		dao.join(player);
		
	}

}
