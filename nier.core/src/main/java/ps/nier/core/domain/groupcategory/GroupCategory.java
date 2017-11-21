package ps.nier.core.domain.groupcategory;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.DictionaryEntity;
@Entity
@Table(name="d_group_category")
public class GroupCategory extends DictionaryEntity{
	
	private static final long serialVersionUID = 8138479219339635308L;

	private String name;
	private int sequence;
	
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
}
