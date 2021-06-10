package baseball.controller;

import java.io.File;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import baseball.dao.BbsDao;
import baseball.vo.Bbs;


public class WriteController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String sessionID = (String)session.getAttribute("id");
		String saveDirectory = (String)session.getAttribute("saveDirectory");
		System.out.println(saveDirectory);
		
//		이미지 처리
//		String saveDirectory = "/baseball/WebContent/css/upimg";
		
//		String saveDirectory = pageContext.getServletContext().getRealPath("/days23/upload");
//		System.out.println(saveDirectory);
		
//		String saveDirectory = pageContext.getServletContext().getRealPath("/upimg");
//		System.out.println(saveDirectory);
//		
//		File saveDir = new File(saveDirectory);
//		if (!saveDir.exists()) saveDir.mkdirs();
		
		int maxPostSize = 1024 * 1024 * 5;
		String encoding = "UTF-8";

		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mrequest 
		= new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		String team = mrequest.getParameter("team");
		String bbsCategory = mrequest.getParameter("bbsCategory");
		String bbsTitle = mrequest.getParameter("bbsTitle");
		String bbsContent = mrequest.getParameter("bbsContent");

		BbsDao bbsDao = BbsDao.getInstance();
		Bbs bbsDto = new Bbs();
		bbsDto.setBbscategory(bbsCategory);
		bbsDto.setBbstitle(bbsTitle);
		bbsDto.setBbscontent(bbsContent);
		bbsDto.setId(sessionID);
		bbsDto.setTeam(team);
		
		if(mrequest.getFile("bbsImg") != null) {
			File uploadFile = mrequest.getFile("bbsImg");
			bbsDto.setBbsimg(uploadFile.getName());
		}

		int wResult = bbsDao.write(bbsDto);
		System.out.println(wResult);
		response.sendRedirect("bbslist.do?team="+team);
		
	}

}
