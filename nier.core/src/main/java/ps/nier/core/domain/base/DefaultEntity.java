package ps.nier.core.domain.base;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;
@MappedSuperclass 
public class DefaultEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	protected String 	id;				//主键
	private Date 		createTime;		//创建时间
	private Date 		modifyTime;		//修改时间
	private String 		createUser;		//创建用户
	private String 		modifyUser;		//修改用户
	private Integer 	deleted = 2;	//逻辑删除(1.已删除, 2.未删除)
	private int 		version = 1;	//版本号
	
	@Transient
	private String createUserNickname;
	@Transient
	private String modifyUserNickname;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getModifyUser() {
		return modifyUser;
	}
	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getCreateUserNickname() {
		return createUserNickname;
	}
	public void setCreateUserNickname(String createUserNickname) {
		this.createUserNickname = createUserNickname;
	}
	public String getModifyUserNickname() {
		return modifyUserNickname;
	}
	public void setModifyUserNickname(String modifyUserNickname) {
		this.modifyUserNickname = modifyUserNickname;
	}	
}
