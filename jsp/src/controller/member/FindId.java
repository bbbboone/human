package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.membership.MemberImpl;

import service.MemberService;
import service.MemberServiceImpl;
import util.MailSend;
import vo.Member;

@WebServlet("/findId")
public class FindId extends HttpServlet{
	private MemberService service = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/jsp/member/findId.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String id = service.findByEmail(email).getId();
		String name = service.findByEmail(email).getName();
		resp.sendRedirect("returnId?id=" + id + "&name=" + URLEncoder.encode(name, "utf-8") + "&email=" + email);
	}
}
