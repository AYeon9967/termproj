package baseball.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import baseball.service.Service;
import baseball.vo.Player;

public class MypageController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String sessionID = (String)session.getAttribute("id");
		
		Service s = Service.getInstance();
		
		Player player = s.playerSearch(sessionID);
		
		String team = player.getFavorite();
		String fteam = null;
		if (team.equals("lg")) { fteam = "엘지 트윈스"; }
		else if (team.equals("ssg")) { fteam = "에스에스지 랜더스"; }
		else if (team.equals("kt")) { fteam = "케이티 위즈"; }
		else if (team.equals("nc")) { fteam = "엔씨 다이노스"; }
		else if (team.equals("kia")) { fteam = "기아 타이거즈"; }
		else if (team.equals("lotte")) { fteam = "롯데 자이언츠"; }
		else if (team.equals("samsung")) { fteam = "삼성 라이온즈"; }
		else if (team.equals("doosan")) { fteam = "두산 베어스"; }
		else if (team.equals("kiwoom")) { fteam = "키움 히어로즈"; }
		else if (team.equals("hanhwa")) { fteam = "한화 이글스"; }
		
		request.setAttribute("player", player);
		request.setAttribute("fteam", fteam);
		HttpUtil.forward(request, response, "/myPage.jsp");
	}

}
