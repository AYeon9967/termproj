package baseball.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import baseball.dao.BbsDao;

public class DeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String sessionID = (String)session.getAttribute("id");
		String bbsId = request.getParameter("bbsid");
		
		BbsDao bbsDao = BbsDao.getInstance();
		
		boolean dusercheck = bbsDao.deleteusercheck(bbsId, sessionID);
		
		String path = null;
		// 삭제 유저와 작성자가 같아야 함. 같으면 실행, 아니면 오류메시지
		if(dusercheck) {
			bbsDao.bbsdelete(bbsId);
			path = "/home.jsp";
		} else {
			request.setAttribute("error", "작성자만 게시글 삭제가 가능합니다! ===");
			path = "/bbsview.do?bbsId=" + bbsId +"";
		}
		
		HttpUtil.forward(request, response, path);	
	}

}
