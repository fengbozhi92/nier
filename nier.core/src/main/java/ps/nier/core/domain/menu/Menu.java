package ps.nier.core.domain.menu;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import ps.nier.core.domain.base.DefaultEntity;

@Entity
@Table(name="s_menu")
public class Menu extends DefaultEntity{
	
	private static final long serialVersionUID = 573226032151260266L;
	
	private String name;
	private String url;
	private String code;
	private String parentCode;
	private Integer depth;
	private int sequence;
	
	@Transient
	private String parentName;
	@Transient
	private List<Menu> childs;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }
	public Integer getDepth() {
		return depth;
	}
	public void setDepth(Integer depth) {
		this.depth = depth;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public List<Menu> getChilds() {
        return childs;
    }
    public void setChilds(List<Menu> childs) {
        this.childs = childs;
    }
    public void addChild(Menu child){
		if (this.childs == null) {
			this.childs = new ArrayList<Menu>();
		}
		this.childs.add(child);
	}
}
