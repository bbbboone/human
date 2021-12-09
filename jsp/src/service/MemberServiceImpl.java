package service;

import java.util.List;

import dao.MemberDao;
import vo.Member;

public class MemberServiceImpl implements MemberService{
	private MemberDao dao = new MemberDao();
	private BoardService service1 = new BoardServiceImpl();
	private ReplyService service2 = new ReplyServiceImpl();
	
	@Override
	public List<Member> getMembers() {
		// TODO Auto-generated method stub
		return dao.getMembers();
	}

	@Override
	public boolean login(String id, String pwd) {
		// TODO Auto-generated method stub
		return dao.login(id, pwd);
	}

	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		dao.join(member);
	}

	@Override
	public Member findBy(String id) {
		// TODO Auto-generated method stub
		return dao.findBy(id);
	}
	
	public Member findByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.findByEmail(email);
	}

	@Override
	public void modify(Member member) {
		// TODO Auto-generated method stub
		dao.update(member);
	}

	@Override
	public void withdraw(String id) {
		// TODO Auto-generated method stub
		service1.withdraw(id);
		service2.withdraw(id);
		dao.withdraw(id);
	}

	@Override
	public Member findByEmail(String email, String name) {
		// TODO Auto-generated method stub
		return dao.findByEmail(email, name);
	}

	@Override
	public Integer findBy(String email, String id) {
		// TODO Auto-generated method stub
		return dao.findBy(email, id);
	}

	@Override
	public Member findPwdByEmail(String email, String id) {
		// TODO Auto-generated method stub
		return dao.findPwdByEmail(email, id);
	}

	@Override
	public void modify(String id, String pwd) {
		// TODO Auto-generated method stub
		dao.updatePwd(id, pwd);
	}
	

}
