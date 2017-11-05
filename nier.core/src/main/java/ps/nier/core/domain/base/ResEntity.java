package ps.nier.core.domain.base;

import ps.nier.core.dictionary.ResCodeEnum;

public class ResEntity {
	
	private int code;
    private String msg;
    private Object data;

    public ResEntity(ResCodeEnum respCode) {
        this.code = respCode.getCode();
        this.msg = respCode.getMsg();
    }

    public ResEntity(ResCodeEnum respCode, Object data) {
        this(respCode);
        this.data = data;
    }

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
    
}
