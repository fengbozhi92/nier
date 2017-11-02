package ps.nier.core.domain.groupcategory;

import javax.persistence.Entity;
import javax.persistence.Id;

import ps.nier.core.domain.base.BaseEntity;
@Entity
public class GroupCategory extends BaseEntity{
	private static final long serialVersionUID = 8138479219339635308L;
	@Id
	private String id;
	private String name;
	private int sequence;
	private Integer status;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}
