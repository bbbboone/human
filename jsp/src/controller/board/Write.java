package controller.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import service.BoardService;
import service.BoardServiceImpl;
import util.CommonConst;
import util.MyFileRenamePolicy;
import vo.Attach;
import vo.Board;
import vo.Member;

@WebServlet("/board/write")
public class Write extends HttpServlet{
	BoardService service = new BoardServiceImpl();
	
	// 글쓰기 폼
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("bno") != null) {
            Long bno=Long.parseLong(req.getParameter("bno"));
            req.setAttribute("board", service.read(bno) );
            req.getRequestDispatcher("/WEB-INF/jsp/board/update.jsp").forward(req, resp);
        } else {
        	String category = req.getParameter("category");
        	req.setAttribute("category", category);
        	req.getRequestDispatcher("/WEB-INF/jsp/board/write.jsp").forward(req, resp);
        }
	}
	
	// 글쓰기 후 프로세스
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 제목
		// 글 내용
		// 작성자
		
		// 선행 작업
		// session의 member이 null에 대한 예외처리
		if(req.getParameter("bno") == null) {
			String saveDirectory = CommonConst.UPLOAD_PATH;
			String path = getPath();
			
			File uploadPath = new File(saveDirectory + File.separator + path);
			if(!uploadPath.exists()) {
				uploadPath.mkdirs();
			}
			
			int maxPostSize = 10 * 1024 * 1024;
			String encoding = "utf-8";
			FileRenamePolicy policy = new MyFileRenamePolicy();
			MultipartRequest multi = new MultipartRequest(req, uploadPath.getAbsolutePath(), maxPostSize, encoding, policy);
			
			Enumeration<String> files = multi.getFileNames();
			List<Attach> attachs = new ArrayList<>();
			while(files.hasMoreElements()) {
				String file = files.nextElement();
				String uuid = multi.getFilesystemName(file);
				if(uuid == null) continue;
				String origin = multi.getOriginalFileName(file);
				
				Attach attach = new Attach(uuid, origin, null, path);
				attachs.add(attach);
			}
//		attachs.forEach(System.out::println);
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String id = ((Member)(req.getSession().getAttribute("member"))).getId();
			String category = multi.getParameter("category");
			
			Board board = new Board(title, content, id, Long.parseLong(category));
			board.setAttachs(attachs);
			Long bno = service.write(board);
			resp.sendRedirect("detail?bno=" + bno + "&pageNum=1");
		} else {
			Long bno = Long.parseLong(req.getParameter("bno"));
			String pageNum = req.getParameter("pageNum");
			doPut(req, resp);
			resp.sendRedirect("detail?bno=" + bno + "&pageNum=" + pageNum);
		}
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno = Long.parseLong(req.getParameter("bno"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		Board board = new Board(bno, title, content);
		BoardService service = new BoardServiceImpl();
		service.modify(board);
		
	}

	private String getPath() {
		return new SimpleDateFormat("yyMMdd").format(new Date());
	}
}
