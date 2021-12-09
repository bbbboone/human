package service;

import vo.Reply;

public class ReplyServiceTests {
	ReplyService service = new ReplyServiceImpl();
	public static void main(String[] args) {
		ReplyServiceTests tests = new ReplyServiceTests();
//		tests.testWrite();
//		tests.testList();
//		tests.testGet();
//		tests.testRemove();
//		tests.testDelete();
//		tests.testWithdraw();
//		tests.testModify();
//		tests.testFindIdBy();
	}
	
	public void testWrite() {
		service.write(new Reply(88L, "새로운 댓글", "21-09-30", "bbbb5", 2391935L));
	}
	
	public void testList() {
		service.list(2391935L).forEach(System.out::println);
	}
	
	public void testGet() {
		System.out.println(service.get(88L));
	}
	
	public void testRemove() {
		service.remove(88L);
	}
	
	public void testDelete() {
		service.delete(2391921L);
	}
	
	public void testWithdraw() {
		service.withdraw("bbbb6");
	}
	
	public void testModify() {
		service.modify(new Reply(99L, "수정된 내용", "21-09-30", "bbbb5", 2391935L));
	}
	
	public void testFindIdBy() {
		System.out.println(service.findIdBy(100L));
	}
}
