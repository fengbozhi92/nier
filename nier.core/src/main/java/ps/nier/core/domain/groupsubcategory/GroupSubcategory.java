package ps.nier.core.domain.groupsubcategory;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import ps.nier.core.domain.base.DictionaryEntity;
@Entity
@Table(name="d_group_subcategory")
@JsonIgnoreProperties({"handler", "hibernateLazyInitializer"})
public class GroupSubcategory extends DictionaryEntity{

	private static final long serialVersionUID = -705963853473736023L;

	private String groupCategoryId;
	private String name;
	private int sequence;
	@Transient
	private String groupCategoryName;
	
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
	public String getGroupCategoryName() {
		return groupCategoryName;
	}
	public void setGroupCategoryName(String groupCategoryName) {
		this.groupCategoryName = groupCategoryName;
	}
}
