package service;

import java.util.List;

import vo.Member;

public interface MemberService {
	
	// 회원가입
	void join(Member member);
	// 로그인
	boolean login(String id, String pwd);
	// 탈퇴
	void withdraw(String id);
	// 정보수정
	void modify(Member member);
	void modify(String id, String pwd);
	// email
	Member findByEmail(String email);
	Member findByEmail(String email, String name);
	Member findPwdByEmail(String email, String id);
	// 단일 회원 조회
	Member findBy(String id);
	Integer findBy(String email, String id);
	// 회원 목록 조회
	List<Member> getMembers();
}
