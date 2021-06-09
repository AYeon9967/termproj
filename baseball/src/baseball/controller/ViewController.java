package baseball.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import baseball.dao.BbsDao;
import baseball.vo.Bbs;

public class ViewController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bbsId = request.getParameter("bbsid");
		BbsDao bbsDao = BbsDao.getInstance();
		
		Bbs bbsDto = new Bbs();
		bbsDto = bbsDao.selectById(bbsId);
		
		request.setAttribute("bbsview", bbsDto);
		
		RequestDispatcher rd = request.getRequestDispatcher("/bbsView.jsp");
		rd.forward(request, response);

	}

}
