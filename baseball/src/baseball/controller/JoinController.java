package baseball.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import baseball.service.Service;
import baseball.vo.Player;

public class JoinController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");		
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String favorite = request.getParameter("favorite");
		String path = null;
		
		Service s = Service.getInstance();
		
		boolean result = s.overlap(id); // 아이디 중복 확인 true=아이디 중복, 회원가입 다시시도

		if(result) {
			request.setAttribute("msg", "중복되는 아이디가 존재합니다. 다시 시도해주세요");
			path = "/memberJoin.jsp";
		} else {

			Player player = new Player(id, pwd, name, email, favorite);
			s.join(player);
			path = "/result/joinResult.jsp";
		}
		HttpUtil.forward(request, response, path);
		
	}

}
