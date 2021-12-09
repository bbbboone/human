package controller.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.ReplyService;
import service.ReplyServiceImpl;
import vo.Member;
import vo.Reply;

@WebServlet("/reply")
public class ReplyController extends HttpServlet{
	private ReplyService service = new ReplyServiceImpl();
	private Gson gson = new Gson();
	
	// 댓글 단일 조회
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long rno = Long.parseLong(req.getParameter("rno"));
		Reply reply = service.get(rno);
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(gson.toJson(reply));
	}
	
	// 댓글 작성
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jsonData = req.getParameter("jsonData");
		String rno = req.getParameter("rno");
		Reply reply = gson.fromJson(jsonData, Reply.class);
		if(rno == null) {
			service.write(reply);
		} else {
			doPut(req, resp);
		}
	}
	
	// 댓글 수정
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long rno = Long.parseLong(req.getParameter("rno"));
		String content = req.getParameter("content");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		Reply reply2 = service.get(rno);
		String id = reply2.getId();
		Reply reply = new Reply(rno, content);
		Member member = (Member)(req.getSession().getAttribute("member"));
		if(member != null && member.getId().equals(id)) {
			service.modify(reply);
			resp.sendRedirect("board/detail?bno=" + reply2.getBno() + "&pageNum=" + pageNum);
		} else {
			resp.sendRedirect("board/detail?bno=" + reply2.getBno() + "&pageNum=" + pageNum);
		}
	}
	
	// 댓글 삭제
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long rno = Long.parseLong(req.getParameter("rno"));
		Member member = (Member)(req.getSession().getAttribute("member"));
		String id = service.findIdBy(rno);
		if(member != null && member.getId().equals(id)) {
			service.remove(rno);
			resp.getWriter().print(1);
		} else {
			resp.getWriter().print(0);
		}
	}

}
