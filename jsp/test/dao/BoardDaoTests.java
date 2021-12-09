package dao;

import vo.Board;
import vo.Criteria;

public class BoardDaoTests {
	BoardDao dao = new BoardDao();

	public static void main(String[] args) {
		BoardDaoTests tests = new BoardDaoTests();
//        tests.testInsert();
//        tests.testRead();
//        tests.testList();
//        tests.testUpdate();
//        tests.testDelete();
//        tests.testGetCount();
//        tests.testWithdraw();
	}

	public void testInsert() {
		Board board = new Board("제목", "내용", "babamba", 1L);
		dao.insert(board);
	}

	public void testRead() {
		Board board = dao.read(10L);
		System.out.println(board);
	}

	public void testList() {
		dao.list(new Criteria(1, 10, 1)).forEach(System.out::println);
	}

	public void testUpdate() {
		dao.update(new Board(2391870L, "수정된 제목", "수정된 내용"));
	}

	public void testDelete() {
		dao.delete(2391870L);
	}

	public void testGetCount() {
		System.out.println(dao.getCount(new Criteria(1, 10, 1)));
	}

	public void testWithdraw() {
		dao.withdraw("babamba");
	}
}
