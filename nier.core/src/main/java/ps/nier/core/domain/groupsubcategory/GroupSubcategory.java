package ps.nier.core.domain.groupsubcategory;

import javax.persistence.Entity;
import javax.persistence.Id;

import ps.nier.core.domain.base.BaseEntity;
@Entity
public class GroupSubcategory extends BaseEntity{
	private static final long serialVersionUID = -705963853473736023L;
	@Id
	private String id;
	private String groupCategoryId;
	private String name;
	private int sequence;
	private Integer status;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGroupCategoryId() {
		return groupCategoryId;
	}
	public void setGroupCategoryId(String groupCategoryId) {
		this.groupCategoryId = groupCategoryId;
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
