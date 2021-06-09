package baseball.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import baseball.dao.BbsDao;
import baseball.vo.Bbs;

public class WriteController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String sessionID = (String)session.getAttribute("id");
		
		String team = request.getParameter("team");
		String bbsCategory = request.getParameter("bbsCategory");
		String bbsTitle = request.getParameter("bbsTitle");
		String bbsContent = request.getParameter("bbsContent");
		String bbsImg = request.getParameter("bbsImg");
		
		BbsDao bbsDao = BbsDao.getInstance();
		Bbs bbsDto = new Bbs();
		bbsDto.setBbscategory(bbsCategory);
		bbsDto.setBbstitle(bbsTitle);
		bbsDto.setBbscontent(bbsContent);
		bbsDto.setBbsimg(bbsImg);
		bbsDto.setId(sessionID);
		bbsDto.setTeam(team);

		int wResult = bbsDao.write(bbsDto);
		System.out.println(wResult);
		response.sendRedirect("bbslist.do?team="+team);
		
	}

}
