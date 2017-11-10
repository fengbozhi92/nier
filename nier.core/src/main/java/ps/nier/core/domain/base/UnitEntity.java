package ps.nier.core.domain.base;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.MappedSuperclass;
@MappedSuperclass 
public class UnitEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String 	id;				//主键
	private Date 	createTime;		//创建时间

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

}
