package dao;

import vo.Reply;

public class ReplyDaoTests {
	ReplyDao dao = new ReplyDao();
	public static void main(String[] args) {
		ReplyDaoTests tests = new ReplyDaoTests();
//		tests.testInsert();
//		tests.testList();
//		tests.testSelect();
//		tests.testRemove();
//		tests.testDelete();
//		tests.testWithdraw();
//		tests.testUpdate();
		tests.testFindIdBy();
	}
	
	public void testInsert() {
		dao.insert(new Reply(95L, "댓글 내용", "21-09-29", "babamba", 2391870L));
	}
	
	public void testList() {
		dao.list(2391870L).forEach(System.out::println);
	}
	
	public void testSelect() {
		System.out.println(dao.select(95L)); 
	}
	
	public void testRemove() {
		dao.remove(95L);
	}
	
	public void testDelete() {
		dao.delete(2391870L);
	}
	
	public void testWithdraw() {
		dao.withdraw("human");
	}
	
	public void testUpdate() {
		dao.update(new Reply(94L, "수정된 댓글"));
	}
	
	public void testFindIdBy() {
		System.out.println(dao.findIdBy(94L));
	}
}
