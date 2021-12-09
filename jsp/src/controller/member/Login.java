package controller.member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/login")
public class Login extends HttpServlet {
	List<Member> members = new ArrayList<Member>();
	MemberService service = new MemberServiceImpl();
	{
		members.add(new Member("javaman", "1234"));
		members.add(new Member("babamba", "1234"));
		members.add(new Member("hong", "1234"));
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 폼 화면 : forwarding
		HttpSession session = req.getSession();
		String referer = (String)req.getHeader("referer");
		session.setAttribute("referer", referer);
		req.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 처리
		String id = req.getParameter("id");
		String referer = (String) req.getSession().getAttribute("referer");
		HttpSession session = req.getSession();
		
		session.setAttribute("member", service.findBy(id));
		
		Cookie cookie = new Cookie("savedId", id);
		cookie.setMaxAge(req.getParameter("savedId") == null ? 0 : 60 * 60 * 24 * 365);
		resp.addCookie(cookie);
		
		if(referer != null) {
			resp.sendRedirect(referer);
		} else {
			resp.sendRedirect("index.html");
		}
		
	}
}
