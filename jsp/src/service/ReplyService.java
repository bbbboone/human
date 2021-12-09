package service;

import java.util.List;

import vo.Reply;

public interface ReplyService {
	// 댓글 쓰기
	void write(Reply reply);
	// 댓글 목록
	List<Reply> list(Long bno);
	// 댓글 단일 조회
	Reply get(Long rno);
	// 댓글 수정
	void modify(Reply reply);
	// 댓글 삭제
	void remove(Long rno);
	// 글 삭제할때 댓글 삭제
	void delete(Long bno);
	// 탈퇴시 id null
	void withdraw(String id);
	// id 조회
	String findIdBy(Long rno);
}
