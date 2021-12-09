package vo;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@XmlRootElement
public class Member {
	@NonNull
	@XmlAttribute
	private String id;
	@NonNull
	private String pwd;
	private String email;
	private String name;
	
	// 생성자, getter, setter, toString
	
}
