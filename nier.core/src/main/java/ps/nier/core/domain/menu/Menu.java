package ps.nier.core.domain.menu;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import ps.nier.core.domain.base.BaseEntity;

@Entity
@Table(name="s_menu")
public class Menu extends BaseEntity{
	private static final long serialVersionUID = 573226032151260266L;
	
	@Id
	private String id;
	private String name;
	private String url;
	private String parentId;
	private Integer depth;
	private int sequence;
	private Integer status;
	
	@Transient
	private String parentName;
	@Transient
	private List<Menu> submenus;
	
	public Menu() {
		super();
	}
	
	public Menu(String id, String name, String url, String parentId, Integer depth, List<Menu> submenus) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.parentId = parentId;
		this.depth = depth;
		this.submenus = submenus;
	}

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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public List<Menu> getSubmenus() {
		return submenus;
	}
	public void setSubmenus(List<Menu> submenus) {
		this.submenus = submenus;
	}
	public void addSubmenu(Menu submenu){
		if (this.submenus == null) {
			this.submenus = new ArrayList<Menu>();
		}
		this.submenus.add(submenu);
	}
}
