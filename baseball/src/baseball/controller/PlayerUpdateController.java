package baseball.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import baseball.service.Service;
import baseball.vo.Player;

public class PlayerUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String favorite = request.getParameter("favorite");
		
		Player player = new Player();
		player.setId(id);
		player.setPwd(pwd);
		player.setName(name);
		player.setEmail(email);
		player.setFavorite(favorite);
		
		Service s = Service.getInstance();
		s.playerUpdate(player);
		
		request.setAttribute("id", id);
		request.setAttribute("update", "회원정보 업데이트가 완료되었습니다.");
		HttpUtil.forward(request, response, "/mypage.do");
		
	}

}
