package baseball.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import baseball.service.Service;
import baseball.vo.Player;

public class JoinController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String favorite = request.getParameter("favorite");
		
		Player player = new Player(id, pwd, name, email, favorite);
		
		Service s = Service.getInstance();
		s.join(player);
		
		request.setAttribute("name", name);
		HttpUtil.forward(request, response, "/joinComplete.jsp");
		
	}

}
