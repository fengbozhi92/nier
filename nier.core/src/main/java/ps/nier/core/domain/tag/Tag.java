package ps.nier.core.domain.tag;

import ps.nier.core.domain.base.UnitEntity;

public class Tag extends UnitEntity{

	private static final long serialVersionUID = -6402586262927740432L;
	
	private String name;
	private int useNum;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUseNum() {
		return useNum;
	}
	public void setUseNum(int useNum) {
		this.useNum = useNum;
	}
}
