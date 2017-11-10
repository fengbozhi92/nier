package ps.nier.core.domain.base;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.MappedSuperclass;
@MappedSuperclass 
public class DefaultEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String 	id;				//主键
	private Date 	createTime;		//创建时间
	private Date 	modifyTime;		//修改时间
	private String 	createUser;		//创建用户
	private String 	modifyUser;		//修改用户
	private Integer status = 2;		//状态(1.启用, 2.禁用)
	private int 	version = 1;	//版本号

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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
	
}
