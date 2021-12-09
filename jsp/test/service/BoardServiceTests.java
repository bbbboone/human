package service;

import vo.Board;
import vo.Criteria;

public class BoardServiceTests {
	BoardService service = new BoardServiceImpl();
	public static void main(String[] args) {
		BoardServiceTests tests = new BoardServiceTests();
//		tests.testWrite();
//		tests.testModify();
//		tests.testRead();
//		tests.testList();
//		tests.testRemove();
//		tests.testGetCount();
//		tests.testFindIdBy();
//		tests.testWithdraw();
	}
	
	public void testWrite() {
		Board board = new Board("테스트 제목", "테스트 내용", "babamba", 1L);
		service.write(board);
	}
	
	public void testModify() {
		service.modify(new Board(2391946L, "수정된 제목", "수정된 내용"));
	}
	
	public void testRead() {
		System.out.println(service.read(2391946L));
	}
	
	public void testList() {
		service.list(new Criteria(1, 10, 1)).forEach(System.out::println);
	}
	
	public void testRemove() {
		service.remove(2391946L);
	}
	
	public void testGetCount() {
		System.out.println(service.getCount(new Criteria(1, 10, 1)));
	}
	
	public void testFindIdBy() {
		System.out.println(service.findIdBy(2391945L));
	}
	
	public void testWithdraw() {
		service.withdraw("bbbb5");
	}
}
