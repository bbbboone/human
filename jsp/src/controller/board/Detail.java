package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import service.BoardServiceImpl;
import service.ReplyService;
import service.ReplyServiceImpl;
import vo.Member;

@WebServlet("/board/detail")
public class Detail extends HttpServlet{
	private BoardService service = new BoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno = Long.parseLong(req.getParameter("bno"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("board", new BoardServiceImpl().read(bno));
		req.getRequestDispatcher("/WEB-INF/jsp/board/detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno = Long.parseLong(req.getParameter("bno"));
		Member member = (Member)(req.getSession().getAttribute("member"));
		String id = service.findIdBy(bno);
		if(member != null && member.getId().equals(id)) {
			service.remove(bno);
			resp.getWriter().print(1);
		} else {
			resp.getWriter().print(0);
		}
	}
}
