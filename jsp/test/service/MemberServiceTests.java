package service;

import vo.Member;

public class MemberServiceTests {
	MemberService service = new MemberServiceImpl();
	public static void main(String[] args) {
		MemberServiceTests tests = new MemberServiceTests();
//		tests.testGetMembers();
//		tests.testLogin();
//		tests.testJoin();
//		tests.testFindBy();
//		tests.testFindByEmail();
//		tests.testWithdraw();
	}
	
	public void testGetMembers() {
		service.getMembers().forEach(System.out::println);
	}
	
	public void testLogin() {
		System.out.println(service.login("bbbb5", "1234"));
	}
	
	public void testJoin() {
		service.join(new Member("bbbb6", "1234", "bbbb6@o.com", "보원"));
	}
	
	public void testFindBy() {
		System.out.println(service.findBy("babamba"));
	}
	
	public void testFindByEmail() {
		System.out.println(service.findByEmail("babamba@hanmail.net"));
	}
	
	public void testModify() {
		service.modify(new Member("1111", "babamba@hanmail.com", "바밤바", "babamba"));
	}
	
	public void testWithdraw() {
		service.withdraw("bbbb6");
	}
}
