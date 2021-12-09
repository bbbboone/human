package service;

import java.util.List;

import dao.ReplyDao;
import vo.Reply;

public class ReplyServiceImpl implements ReplyService{
	private ReplyDao dao = new ReplyDao();
	
	@Override
	public void write(Reply reply) {
		// TODO Auto-generated method stub
		dao.insert(reply);
	}

	@Override
	public List<Reply> list(Long bno) {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Override
	public Reply get(Long rno) {
		// TODO Auto-generated method stub
		return dao.select(rno);
	}

	@Override
	public void remove(Long rno) {
		// TODO Auto-generated method stub
		dao.remove(rno);
	}

	@Override
	public void delete(Long bno) {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	@Override
	public void withdraw(String id) {
		// TODO Auto-generated method stub
		dao.withdraw(id);
	}

	@Override
	public void modify(Reply reply) {
		// TODO Auto-generated method stub
		dao.update(reply);
	}

	@Override
	public String findIdBy(Long rno) {
		// TODO Auto-generated method stub
		return dao.findIdBy(rno);
	}
	
}
