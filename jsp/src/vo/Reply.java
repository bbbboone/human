package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private Long rno;
	private String content;
	private String regDate;
	private String id;
	private Long bno;
	
	public Reply(Long rno, String content) {
		super();
		this.rno = rno;
		this.content = content;
	}
	
}
