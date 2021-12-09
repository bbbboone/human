package service;

import java.util.List;

import vo.Attach;
import vo.Board;
import vo.Criteria;

public interface BoardService {
	// 글쓰기
	Long write(Board board);
	// 글조회
	Board read(Long bno);
	// 목록조회
	List<Board> list();
	List<Board> list(Criteria cri);
	// 글수정
	void modify(Board board);
	// 글삭제
	void remove(Long bno);
	// 글갯수
	int getCount(Criteria cri);
	// 첨부파일 삭제
	void deleteAttach(Long bno);
	// 글번호로 id 찾기
	String findIdBy(Long bno);
	/**
	 * 첨부파일 
	 * @param uuid
	 * @return origin
	 */
	String findOriginBy(String uuid);
	
	List<Attach> readAttachByPath(String path);
	// 탈퇴시 ID NULL
	void withdraw(String id);
}
