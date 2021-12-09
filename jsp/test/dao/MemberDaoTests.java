package dao;

import vo.Member;

public class MemberDaoTests {
	MemberDao dao = new MemberDao(); 
	public static void main(String[] args) {
		MemberDaoTests tests = new MemberDaoTests();
//		tests.testGetMembers();
//		tests.testLogin();
//		tests.testJoin();
//		tests.testFindBy();
//		tests.testFindByEmail();
//		tests.testFindPwdByEmail();
//		tests.testUpdate();
//		tests.testUpdatePwd();
//		tests.testWithdraw();
	}
	
	public void testGetMembers() {
		dao.getMembers().forEach(System.out::println);
	}
	
	public void testLogin() {
		System.out.println(dao.login("babamba", "1234"));
	}
	
	public void testJoin() {
		dao.join(new Member("human", "1234", "human@o.com", "휴먼"));
	}
	
	public void testFindBy() {
		System.out.println(dao.findBy("babamba"));
	}
	
	public void testFindByEmail() {
		System.out.println(dao.findByEmail("babamba@hanmail.net"));
	}
	
	public void testFindPwdByEmail() {
		System.out.println(dao.findPwdByEmail("babamba@hanmail.net", "babamba"));
	}
	
	public void testUpdate() {
		dao.update(new Member("12345", "babamba@naver.com", "바밤바", "babamba"));
	}
	
	public void testUpdatePwd() {
		dao.updatePwd("babamba", "1234");
	}
	
	public void testWithdraw() {
		dao.withdraw("human");
	}
}
