package baseball.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String team = request.getParameter("team");
		
		HttpSession session = request.getSession();
		session.setAttribute("team", team);
		
		HttpUtil.forward(request, response, "bbsList.jsp");

	}

}
